# Gateway and Authorization Architecture

Decided design for the platform gateway and the Oathkeeper/Keto authorization
layer. This is the reference to build the charts and the generator against.
What permissions, roles, and grants mean, and who may define each, is
`permission-model.md`.

## Platform stack

| Layer | Choice |
|---|---|
| OS | Talos, on baremetal and on GCP/AWS, one immutable node layer everywhere |
| CNI, kube-proxy replacement, L4, LoadBalancer, pod encryption | Cilium (1.20, pre-release accepted) |
| L7 gateways, routing, ext_authz, CORS | Cilium Gateway API + the `ExternalAuth` filter (GEP-1494) |
| Authorization PDP | Oathkeeper (one shared rule set) + the IAM decision endpoint + Keto |
| Authorization writes | the IAM provisioning endpoint, the only holder of Keto write access |
| VPN and split-horizon DNS | Netbird, on every environment |
| TLS | cert-manager with Let's Encrypt DNS-01 |

Cilium 1.20 carries the `ExternalAuth` HTTPRoute filter (GEP-1494), which lets a
route delegate the authorization decision to Oathkeeper over Envoy ext_authz
(gRPC or HTTP). That closes the one gap that previously needed a separate mesh,
so Cilium runs the whole L3 through L7 path and there is no second dataplane.

The ext_authz primitive is swappable: the same design runs on Istio
(`AuthorizationPolicy` action CUSTOM plus `extensionProvider`) with no change to
the generated rules, Oathkeeper, Keto, DNS, or hosts. Istio gateway-only over
Cilium CNI is the fallback while Cilium `ExternalAuth` is pre-release.

## Principles

1. **One hostname = one service.** No hostname is shared by two services, or by
   a UI and its API. Each service's rules match on its own host, so no rule set
   encodes another service's routes, and every URL a browser sees is the real
   one.
2. **The trust boundary is the network, not the URL.** Internal (VPN) versus
   external (public) is decided by which gateway served the request, through
   split-horizon DNS. Hostnames carry no tier label.
3. **The gateway stamps trust context.** The boundary decides the tier once,
   scopes the credential, and tags the request. Everything downstream reads the
   tag.
4. **Oathkeeper is the policy enforcement point.** One rule per endpoint,
   called by the gateway through ext_authz. It authenticates the subject,
   renders the rule's payload, and asks the decision endpoint, which is the only
   thing that talks to Keto.
5. **Services are self-contained.** Each service ships its OpenAPI document and
   nothing else about authorization. Adding a service is one registration entry
   plus its routes, with no change to the platform.

## Two layers

The design has two independent layers that stack, they do not compete:

- **Network boundary (gateways + VPN + DNS): who can reach what.** Split-horizon
  DNS decides which gateway a client reaches, and each gateway serves only the
  routes attached to it. The internal surface is reachable only over the VPN and
  is absent from public DNS, and a path with no route on a gateway returns 404 at
  the edge. This is where the per-tier exposure is enforced, ahead of any
  authorization.
- **Authorization (Oathkeeper + decision endpoint + Keto): may this subject do
  this action.** For a request a route accepted, ext_authz calls Oathkeeper,
  which authenticates the subject and posts the rendered payload to the decision
  endpoint.

```
request -> DNS picks gateway -> route match?
                                 |- no route  -> 404   (per-tier exposure, before RBAC)
                                 '- route hit -> ExternalAuth -> Oathkeeper
                                                 -> decision endpoint -> Keto
                                                 -> allow (+ X-Scope) or deny
```

A single shared Oathkeeper rule set is enough because the network boundary
already keeps machines away from human endpoints, so Oathkeeper only answers what
a reachable subject may do.

## Network tiers and DNS

Two tiers, distinguished only by network reachability:

- **External (public):** the bare domain `<domain>`, reachable from the
  internet. Machines only, Hydra JWT.
- **Internal (VPN):** resolvable only over Netbird. Humans only, Kratos session
  cookie.

Netbird provides both the VPN and the split-horizon DNS. It pushes an internal
zone to peers where service names resolve to the internal gateway, while public
DNS resolves the machine-facing names to the external gateway. Human-facing
names (UIs, the human API) live only in the internal zone, so off the VPN they
do not resolve and are not served.

The tier lives in DNS and the gateway, so hostnames stay topology-free:
`<service>.<domain>`, `api.<service>.<domain>`, one name per surface.

## Two gateways

Two Cilium Gateway-API gateways, each on its own LoadBalancer address:

- **Internal gateway:** VPN-reachable address, publishes the human routes (UIs,
  human APIs), enforces cookie auth.
- **External gateway:** public address, publishes the machine routes (machine
  APIs), enforces JWT auth.

Each gateway does four things through Gateway-API filters and the ext_authz
integration:

1. **Stamps the tier header and clears the platform headers.**
   `RequestHeaderModifier` with `set` writes `X-Gateway-Tier:
   internal|external`, overwriting any client-supplied copy, and with `remove`
   drops any inbound `X-Scope`. That header is written only by the
   authorization path on allow, so stripping it at the edge is what makes its
   presence unforgeable and its absence meaningful.

   ```yaml
   filters:
     - type: RequestHeaderModifier
       requestHeaderModifier:
         set:
           - name: X-Gateway-Tier
             value: internal
         remove:
           - X-Scope
   ```

   Every route carries this, not only the ones that front a service that reads
   the scope. An authorized route overwrites the header anyway, because the
   decision endpoint answers with one either way and the gateway forwards what
   it answered; an anonymous route never calls the decision endpoint at all, so
   without the `remove` the client's own value travels on untouched. Measured on
   the local stack: a request carrying `X-Scope: dfsps=forged` reaches the
   upstream verbatim when nothing strips it, and does not when this filter is
   present.
2. **Calls Oathkeeper** through the `ExternalAuth` filter (GEP-1494) on its
   routes, pointing at the shared Oathkeeper. Verified field shape on 1.20:

   ```yaml
   filters:
     - type: ExternalAuth
       externalAuth:
         protocol: HTTP                                    # or gRPC (Envoy ext_authz)
         backendRef: { name: oathkeeper-api, port: 4456 }
         http:
           path: /decisions                                # Oathkeeper's decision API
           # credentials + the headers Oathkeeper's handlers read, x-forwarded-proto
           # rebuilds the https URL, accept picks the browser or json error handler
           allowedHeaders: [cookie, authorization, accept, x-forwarded-proto]
           allowedResponseHeaders: [x-scope]               # forwarded upstream on allow
   ```

3. **Publishes only its tier's routes.** The per-tier endpoint subset is which
   HTTPRoutes each gateway carries.
4. **Handles SPA CORS** with the Gateway-API CORS filter on the API routes, so
   the browser call from the UI host to the API host needs no app-side CORS.

## Host and naming scheme

Pattern: `<surface>.<domain>`, tier decided by DNS and gateway, not by the name.

| Host | Serves | Rules | Auth | Tier |
|---|---|---|---|---|
| `<service>.<domain>` | the service's UI (SPA) | one, whole host | cookie, allow | internal |
| `api.<service>.<domain>` | the service's API | per-endpoint | cookie or JWT | both |

- UI and API are separate subdomains, so the UI's rule is a trivial whole-host
  match with zero API knowledge, and the SPA calls its API cross-origin (same
  parent domain, so the cookie is shared).
- The external tier carries the machine API. UIs are internal, since machines do
  not browse.
- Micro-frontends follow the same rule: each gets its own subdomain and its own
  whole-host rule.

IdP hosts follow the tier by who uses them:

- Internal: `kratos.<domain>` (login and session), `auth.<domain>` (login UI),
  `mailpit.<domain>` (dev mail).
- External: `hydra.<domain>` (machines fetch their token).

## Oathkeeper: one shared rule set

Both gateways call the same Oathkeeper. It tells services apart by the request
host, which Envoy forwards on the check and which the gateway's routing already
pinned to exactly one service (one hostname = one service). The host also keys
every user-facing URL Oathkeeper builds (the login redirect's `return_to`), so
what the browser sees is always the real URL.

Each endpoint is one rule, and its `authenticators` list names the credentials it
accepts: a human-only endpoint lists `cookie_session`, a machine-only endpoint
lists `jwt`, an endpoint on both lists both (tried in order, falling through by
credential presence). The list comes from the operation's OpenAPI `security`.

```yaml
- id: example.getWidgetCa
  match:
    url: <http|https>://api.example.test/api/widgets/<(?<widgetId>[^/]+)>/ca<$>
    methods: [GET]
  authenticators:
    - handler: cookie_session   # a human, session cookie
    - handler: jwt              # a machine, client-credentials token
  authorizer:
    handler: remote_json
    config:
      payload: '{"namespace":"example","object":"widgets/{{ printIndex .MatchContext.RegexpCaptureGroups 1 }}","relation":"getWidgetCa","subject_id":"{{ print .Subject }}","scope":["widgets"]}'
  mutators:
    - handler: header
```

Rules never name infrastructure. The decision endpoint's address, the response
headers it is allowed to return, and the mutator's header set are global
Oathkeeper configuration, identical for every service. The only thing that
varies per rule is the match and the payload.

Sharing one rule is safe because Keto keys on the subject, which the credential
determines: a cookie resolves a human identity, a JWT resolves a machine client,
and each holds only the grants a deployment assigned it (see
`permission-model.md`). A rule that accepts both credentials still denies
whatever the resolved subject is not entitled to, so a machine cannot perform a
human-only action by reaching a shared rule.

Per-tier exposure is host-level: internal-only hosts (UIs, the IdP UIs) attach
only to the internal gateway, so off the VPN they do not resolve and return 404 at
the edge. A dual-tier host like the API attaches to both gateways, and a machine
that reaches a human-only endpoint hits a `cookie_session`-only rule and gets 401
from Oathkeeper.

Rules are generated, and carry no per-rule handler configuration, so a rule
cannot branch on `X-Gateway-Tier`. It does not need to: the `authenticators`
list already names which credentials an endpoint accepts, and Keto gates the
rest.

## What a service registers

A service ships its OpenAPI document in its image and nothing else about
authorization. The deployment registers where that document is and where the
service is served:

```yaml
global:
  authz:
    - name: example
      image: org/example-api:<tag>
      spec: /opt/app/src/api/openapi.yaml
      url:
        host: api.example.<domain>
        # path: /example    # when served under a prefix of a shared host
```

Nothing outside `global.authz` names a service.

The aggregator mounts each registered image, reads the document, and generates
that service's artifacts with the host and mount path filled in, failing the
rollout on an unprovided variable. It then serves the aggregate to Oathkeeper
and Keto:

| generated | staged as |
|---|---|
| `oathkeeper-rules.yml` | one file per service, all in Oathkeeper's rule repository |
| `keto-namespaces.ts` | concatenated with every other service's into one file |
| `catalog.json` | aggregated and served to the IAM for the role UI |
| `derivation.txt` | published for review and diffed against the previous rollout |

The staged model is one concatenated file, and Keto keeps the **last**
declaration of a duplicated name. Pointing Keto at a directory of per-service
files is not an alternative: each file is parsed self-contained, so a duplicated
class name makes Keto drop a whole file's namespaces silently, and a file
referencing a stub it does not declare fails to parse at all. `User` and `Role`
are referenced by every service, so the generator emits them byte-identical
everywhere; diverging copies would silently make the model depend on sort order.

```ts
export class User implements Namespace {}

export class Role implements Namespace {
  // @ts-ignore TS2564: OPL declaration, never instantiated
  related: {
    members: User[]
  }
}
```

A UI registers the same way. It serves at least one route, so it has an OpenAPI
document describing it, and the generator produces a whole-host rule from it:

```yaml
- id: example-ui.getApp
  match:
    url: <http|https>://example.<domain><(?:/.*)?>
    methods: [GET]
  authenticators:
    - handler: cookie_session
  authorizer:
    handler: allow
  mutators:
    - handler: header
```

CORS preflights carry no credentials and are answered before authorization, so
the generator emits one credential-less OPTIONS rule per service. ext_authz runs
ahead of the gateway's CORS filter, which is why the rule has to exist.

## The IAM's own processes

One codebase, deployed as separate processes because they want different
access and different scaling. Nothing else in the platform holds a Keto write
URL.

| process | on | holds | reached by |
|---|---|---|---|
| decision | every request | read-only Keto | Oathkeeper, no route |
| provisioning | rollout, resource creation | Keto write, Kratos admin | services, no public route |
| aggregator | deploy | the registered images | the rollout |

The decision endpoint is on the hot path and answers a rendered payload. The
provisioning endpoint is not. It opens a rollout by applying the deployment's
role documents against the composed catalog and creating the first
administrator, and refuses to serve if a role names a permission no service
advertises. From then on a service calls it when it creates a resource, naming
the resource and its principals, and those same role documents decide what that
implies. It runs single-replica, because applying roles clears and rewrites the
grants of each role and two copies would interleave. The aggregator is a job
that runs once per rollout.

Services never link a Keto client. What they do link is `@mojaloop/authz`, a
zero-dependency package holding the `X-Scope` contract in both directions, so
the endpoint that writes the header and every service that reads it cannot
disagree about what it means. It carries a round-trip test for exactly that,
and it stays free of the generator, the Keto client and the provisioner, which
would otherwise pull the whole toolchain into every service image.

## TLS

cert-manager with Let's Encrypt DNS-01, one mechanism on every substrate. A
wildcard certificate per tier (`*.<domain>` for external, and the internal
zone's own wildcard). DNS-01 issues for both public and internal names, since it
is a DNS challenge and needs no inbound path.

## Environments (substrate)

The logical design is identical on every platform, since Talos is the node layer
everywhere and Cilium is the dataplane everywhere. Only how each gateway gets its
address differs, and it is one values-driven annotation set.

| Concern | On-prem / baremetal | Cloud (GCP / AWS) |
|---|---|---|
| External gateway address | Cilium LoadBalancer IPAM with L2 or BGP announcement (`CiliumLoadBalancerIPPool`) | Public cloud LB via Service annotation |
| Internal gateway address | Cilium LB internal pool, or a ClusterIP advertised by a Netbird routing peer | Internal cloud LB in a private subnet |
| VPN and internal reach | Netbird mesh, a routing peer advertises the internal gateway | Netbird again, or cloud-native VPN over VPC peering |
| Split-horizon DNS | Netbird DNS pushes the internal zone to peers | Netbird, or a cloud private DNS zone bound to the VPC |
| TLS | cert-manager, Let's Encrypt DNS-01 | same |

Cilium replaces MetalLB and kube-proxy, so baremetal loses two components.
Netbird runs on baremetal and cloud, so the VPN and split DNS are the same
mechanism everywhere. Everything above the gateway Service is byte-for-byte
identical, so a service's rules and routes are generated once and run on any
substrate.

## Request flows

**Human (browser, on VPN):**

1. Netbird DNS resolves `<service>.<domain>` to the internal gateway.
2. With no session, Oathkeeper returns unauthorized and the gateway redirects
   the browser to `kratos.<domain>` login.
3. After login the Kratos cookie is set on the shared parent domain.
4. The SPA loads from `<service>.<domain>` and calls `api.<service>.<domain>`
   (cross-origin, handled by the gateway CORS filter, cookie sent).
5. The internal gateway stamps `internal`, strips any inbound `X-Scope`, and
   calls Oathkeeper, which authenticates via `cookie_session`, posts the
   rendered payload to the decision endpoint, and on allow forwards the
   `X-Scope` it returned.

**Machine (off VPN):**

1. An operator generates client credentials through the human UI.
2. The machine fetches a token from `hydra.<domain>` (client credentials).
3. It calls `api.<service>.<domain>`, resolved by public DNS to the external
   gateway.
4. The external gateway stamps `external`, strips the platform headers, and
   calls Oathkeeper, which authenticates via `jwt` and takes the same decision
   path. The machine's `X-Scope` names the resources the role that admitted the
   call covers, which is how a service learns which participant is calling
   without any identity claim carrying that fact.

## Verified on the Cilium 1.20 pre-release

Confirmed live on Cilium 1.20.0-pre.4 with Gateway API v1.6 experimental CRDs:

- `ExternalAuth` forwards Oathkeeper's mutated headers to the upstream on allow
  (`allowedResponseHeaders`).
- A deny passes Oathkeeper's response straight back, so the redirect error handler
  returns 302 with the login `Location` for a browser, and the `return_to` is the
  clean original URL (host from the check request, scheme from the forwarded
  `x-forwarded-proto`).
- An unmatched path gets 404 (deny) with nothing leaked upstream. CORS preflights
  need a credential-less OPTIONS rule, since ext_authz runs ahead of the gateway
  CORS filter.

Confirmed against `oathkeeper` v26.2.0's own config schema: the `remote_json`
authorizer takes `forward_response_headers_to_upstream`, which is how `X-Scope`
travels from the decision endpoint through Oathkeeper to the service in one
call rather than a second hydration round trip.

## Simulation

The kind sim approximates split-horizon, since sslip.io maps a name to a fixed
IP and cannot answer per network. It runs two gateways on two LoadBalancer
addresses and reaches each tier by its gateway address, standing in for the DNS
split. The generated rules, the tier header, ext_authz, Oathkeeper, the decision
endpoint, and Keto match the production shape.
