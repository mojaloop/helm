# Mojaloop permissions guide

This guide is for service owners, deployment operators and the people who
write roles. It covers how a service declares its permissions, how a
deployment exposes the service through the gateway, how roles grant
permissions, and how to find out why a request was refused. The model behind
it is in `permission-model.md`, and how the IAM finds a route's document is in
`discovery.md`.

## How it fits together

Authorization comes from three inputs:

| Input | What it is | Written by |
|---|---|---|
| API document | The service's OpenAPI 3.1 document, with `x-authz` annotations | Service owner |
| Route annotations | `iam.mojaloop.io/...` annotations on the HTTPRoute, one set per backend | Deployment |
| Roles | Named sets of permissions, assigned to people and machine clients | Deployment |

The IAM operator reads these from the cluster and generates the Oathkeeper
rules the gateway checks, the Keto model the grants are stored in, and the
catalog the role screen shows. It watches routes, documents and gateways, so a
new route or a changed document takes effect without redeploying the IAM.
Oathkeeper rules and Keto tuples are never edited by hand.

## Permissions

Each operation in the document is one permission: one HTTP method on one path
template. `GET` and `PUT` on the same path are two permissions.

A permission id is the route's prefix for the service followed by the
operation's `operationId`:

```
mcm.getDFSPs                     # prefix mcm from the route, operationId getDFSPs from the document
mcm.createDFSPInboundEnrollment
settlement.getSettlementWindows
```

Renaming an `operationId` changes the permission id. When a role grants a
permission and a rollout renames it, removes it or changes the resources it is
checked against, the IAM keeps the previous rules until `global.iamMigrations`
says where the grants go:

```yaml
global:
  iamMigrations:
    mcm.getDFSPca: mcm.getDfspCa    # move the grants to the new id
    reports.legacyExport: null      # drop the grants
```

CORS preflight requests are answered without authorization and are not
permissions.

## Protecting a service

A service is protected through its HTTPRoute. The route needs two things:

- the `ExternalAuth` filter on every rule, which sends each request to the
  gateway's authorization check. Charts built on `mojaloop-common` add it.
- an annotation for each backend, keyed by the backend's name in
  `backendRefs`, giving the prefix its permissions live under.

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: mcm-connection-manager-api
  namespace: mcm
  annotations:
    iam.mojaloop.io/mcm-connection-manager-api.service: mcm
spec:
  hostnames: [mcm-api.ext.example.org]
  rules:
    - filters:
        - type: ExternalAuth
          # ...
      backendRefs:
        - name: mcm-connection-manager-api  # the name the annotation is keyed by
          port: 3001
```

### Where the document comes from

| Case | Annotations | Document |
|---|---|---|
| Your own service | `<backend>.service` | The service serves it at `/.authz/openapi`, and the IAM reads it through the Service |
| An image you can't change | `<backend>.service` and `<backend>.schema` | An `AuthzDocument` in the route's namespace, named by `.schema` |

A Node service serves its document with `@mojaloop/authz`, from the same guard
it authorizes with:

```js
const authz = await createGuard('src/api/openapi.yaml');
app.use(authz.expose());
```

A service in another language serves it directly. `GET /.authz/openapi`
answers with the document as JSON and an `ETag`, a request with
`If-None-Match` set to that ETag answers `304`, and any other method answers
`405`.

For an image you can't change, write the document as an `AuthzDocument`:

```yaml
apiVersion: mojaloop.io/v1
kind: AuthzDocument
metadata:
  name: hubble-ui
  namespace: cilium            # the namespace of the route that names it
spec:
  document:
    openapi: 3.1.0
    info: { title: Hubble UI, version: '1.0' }
    paths:
      /:
        get:
          operationId: view
          summary: Opens the UI  # what an operator reads when granting it
          x-authz: { scopedBy: [] }
```

An `AuthzDocument` takes effect only when a route names it in a `.schema`
annotation. Until then its state is `Unreferenced`.

When an `AuthzDocument` is applied, the IAM checks it with the same reader it
composes with and refuses a document that would not compose, giving the
reason. While the IAM is unavailable, applying any `AuthzDocument` fails.

A UI needs one permission to open it. Charts built on `mojaloop-common`
generate its document from values:

```yaml
ui:
  authz:
    service: mcmUi        # the prefix, set by the deployment
    operationId: view
    title: Mojaloop Connection Manager UI
    summary: Opens the connection manager
```

### Keeping an operation off the gateway

Health and metrics endpoints are called on the pod itself, by the kubelet and
by metrics scrapers. Mark them internal:

```yaml
paths:
  /health:
    get:
      operationId: getHealth
      summary: Reports whether the service is up
      x-authz:
        internal: true
```

An internal operation is not a permission and the gateway has no rule for it,
so requests for it through the gateway are refused. The pod still answers it
directly. An internal operation takes no `scopedBy`.

### Prefixes

- A prefix belongs to one Kubernetes Service. Several routes, in any
  namespaces, can send traffic to that Service under the same prefix. If a
  second Service uses the same prefix, the prefix is held until one of them
  changes.
- Each Service needs its own prefix, including two versions of the same app
  (`mcmv1`, `mcmv2`).
- A prefix has one document, and every host it is served on must be sent the
  same paths.
- A rule only matches the paths the route sends to that backend. If a route
  sends `/participants` to one Service and `/quotes` to another, a grant on the
  first doesn't reach the second.
- A route rule sends traffic to one backend. A rule that splits traffic
  between backends, such as a canary, is refused.
- Path matches are `Exact` or `PathPrefix`. A `URLRewrite` has to be a
  `ReplacePrefixMatch` on a rule with a single path prefix.
- A prefix starts with a letter or digit and contains letters, digits, `_` and
  `-`. Its Keto namespace is the prefix itself when the prefix is an identifier
  (`portalShell`). Other characters are encoded, so `portal-shell` becomes
  `portal_2d_shell`. The catalog lists each service's namespace.
- A backend name is at most 55 characters, so the annotation key fits the
  Kubernetes limit of 63.

## Scoping by resource

Most operations are about a particular thing, such as a DFSP or a report. The
document declares this with `x-authz`:

```yaml
x-authz:
  resourceTypes: [dfsps]               # every type the operations use

paths:
  /dfsps/{dfspId}/ca:
    get:
      operationId: getDFSPca
      x-authz:
        scopedBy: [{ dfsps: dfspId }]  # the path carries the DFSP's id
  /dfsps:
    get:
      operationId: getDFSPs
      x-authz:
        scopedBy: [dfsps]              # about DFSPs, with no id in the path
```

Without `scopedBy`, an operation is scoped by the type of its outermost path
parameter, so `/dfsps/{dfspId}/ca` is about `dfsps`.

| Operation | The gateway checks a grant on | The service receives |
|---|---|---|
| `GET /dfsps/{dfspId}/ca` | that DFSP | the DFSPs the caller holds |
| `GET /dfsps` | the service | the DFSPs the caller holds, to filter the list |
| `GET /hub/endpoints` (`scopedBy: []`) | the service | nothing |

A `GET` that returns a list and has no id in its path must declare
`scopedBy`, either the row type or `[]` when everyone holding the permission
may see every row. A document without it is refused.

The service asks its guard what the caller may see:

```js
const dfsps = req.authz(req, 'dfsps');
return dfsps.narrow(rows, (row) => row.id);   // or dfsps.allows(id) for one id
```

## Resource names

Services can spell the same thing differently. MCM calls a DFSP `dfsps` and
the reporting services call it `participants`. The deployment declares that
these are the same thing, so one grant covers every service's spelling and an
operator picks "Participant: dfsp1" once:

```yaml
global:
  resourceNames:
    Participant:
      label: Participant
      description: A financial institution connected to the hub
      members:
        - { service: mcm,        type: dfsps }
        - { service: reports,    type: participants }
        - { service: settlement, type: participants }
      source:                  # where the list of participants comes from
        url: http://moja-centralledger-service.mojaloop.svc.cluster.local/participants
        id: /name
```

Every type a service uses must be a member of some resource name, and every
member must be a type its service declares. Otherwise the composition is
refused. A member whose service isn't deployed is listed as unbound in the
IAM log and otherwise ignored.

## Roles and assignments

Roles are deployment values under `global.iamRoles`. A grant names a
permission and, for each resource name the permission is scoped by, one of:

| The grant says | Meaning |
|---|---|
| `resources: { Participant: all }` | every participant, including future ones |
| `resources: { Participant: [dfsp1, dfsp2] }` | exactly these |
| nothing | left open, so each assignment names the participant |

```yaml
global:
  iamRoles:
    roles:
      hub-admin:
        grants:
          - { permission: mcm.getDFSPs, resources: { Participant: all } }
          - { permission: mcmUi.view }
      dfsp-operator:             # leaves Participant open
        grants:
          - { permission: mcm.getDFSPca }
          - { permission: mcm.setDFSPca }
    assignments:
      - { subject: <identity id>, role: hub-admin }
      - { subject: <identity id>, role: dfsp-operator, resources: { Participant: dfsp1 } }
```

A role that leaves a resource name open is held once per resource. Someone
holding `dfsp-operator` for dfsp1 and for dfsp2 has two separate holdings. The
connection manager assigns `dfsp-operator` this way when it onboards a DFSP.

An operation no role grants can't be called by anyone.

### Assigning roles

Operators assign roles on the portal's role screen, which works through the
role assignment service. A service that creates resources calls the IAM's API
directly, as the connection manager does when it onboards a DFSP. The subject
is the identity id for a person and the OAuth client id for a machine client.

```
GET    /catalog                              every permission, with its summary
GET    /roles                                the roles, and which resource names each leaves open
GET    /resources?resourceName=Participant   what can be picked
GET    /resource-names                       the deployment's resource names
GET    /subjects/<id>/assignments            what someone holds
POST   /subjects/<id>/assignments            { role, resources }
DELETE /subjects/<id>/assignments            { role, resources }
GET    /state                                what is applied, and what is waiting
```

The API is only reachable inside the cluster. Restrict it with a network policy
to the role assignment service and the services that create resources.

## Separation of duties

Some permissions must not end up with the same person or client, however many
roles it takes to get there:

```yaml
global:
  iamRoles:
    exclusions:
      - name: audit-exclusion
        a: [settlement.auditSettlement]
        b: [settlement.positionFundsInOut, settlement.positionNDCEdit]
```

An assignment that would give someone both sides is refused, and the error
names the rule. A role, or an assignment in `global.iamRoles`, that breaks a
rule keeps the IAM from becoming ready. When a rule is added while holdings
that break it already exist, those holdings stay in place and are reported in
the IAM log as `ALREADY HELD` and in `/state` under `applied.findings`. The
deployment decides which side to remove.

## When a request is refused

- `401` means the request carried no credential the gateway accepts. A
  browser asking for HTML is redirected to the login page.
- `403` means the caller was recognized but holds no grant for this operation
  on this resource. A machine token used on an operation that only people are
  granted gets `403`.

## When something is wrong

A problem with one prefix doesn't stop the others from publishing.

| Situation | What happens | Where it shows |
|---|---|---|
| A document can't be read or is invalid | That prefix keeps its last good rules | Event on the route; `AuthzDocument` state `Refused` |
| One prefix on two Services, or read from two documents | That prefix is held | Event on the route |
| A backend behind `ExternalAuth` has no annotation | Nothing it serves is authorized | Event on the route |
| An annotated backend is behind a rule without `ExternalAuth` | The gateway doesn't check that rule's requests | Event on the route |
| Two prefixes match the same request | Nothing publishes until it's fixed | IAM log |
| A granted permission is renamed, removed or reshaped | Nothing publishes until `global.iamMigrations` covers it | IAM log |
| A role names a service no route serves yet | The role waits, and goes live once the service is routed | `/state` → `pending` |
| A role names an operation its service doesn't have | The IAM doesn't become ready | IAM log |
| An existing holding breaks a separation-of-duties rule | The holding stays | IAM log; `/state` → `applied.findings` |

Waiting roles are normal during a fresh install. The IAM starts before the
applications, so roles such as `hub-admin` wait until the services they name
are routed. Nobody holds a role while it waits.

## Checking what is live

```bash
# problems the IAM found with a route
kubectl -n mcm describe httproute mcm-connection-manager-api

# every AuthzDocument and its state
kubectl get authzdoc -A
# NAMESPACE     NAME        SERVICE                              STATE
# cilium        hubble-ui   hubbleUi                             Accepted
# mojaloop      intapi      intapiSettlements,lookup,quotes,...  Accepted

# the IAM's API, through the Kubernetes API server
IAM=/api/v1/namespaces/<iam namespace>/services/<release>-ml-iam-services-provisioning:80/proxy

kubectl get --raw $IAM/state               # what was applied, waiting roles, findings
kubectl get --raw $IAM/catalog             # every permission the deployment offers
kubectl get --raw $IAM/access-rules.yml    # the rules the gateway enforces
```

## Worked example: the operator machine API

The `intapi.int` host gives operator tools one address for five of the
switch's services, routed by path. None of these images serves a document for
this surface, so a single `AuthzDocument` describes it with one permission per
HTTP method, applied to whatever the route sends:

```yaml
metadata:
  name: intapi
  namespace: mojaloop
  annotations:
    iam.mojaloop.io/moja-account-lookup-service.service: lookup
    iam.mojaloop.io/moja-account-lookup-service.schema: intapi
    iam.mojaloop.io/moja-quoting-service.service: quotes
    iam.mojaloop.io/moja-quoting-service.schema: intapi
    iam.mojaloop.io/moja-ml-api-adapter-service.service: transfers
    iam.mojaloop.io/moja-ml-api-adapter-service.schema: intapi
    iam.mojaloop.io/moja-transaction-requests-service.service: transactionRequests
    iam.mojaloop.io/moja-transaction-requests-service.schema: intapi
    iam.mojaloop.io/moja-centralsettlement-service.service: intapiSettlements
    iam.mojaloop.io/moja-centralsettlement-service.schema: intapi
```

Each backend is a different Service, so each gets its own prefix, and each
prefix's rules match only the paths sent to it. `lookup.view` covers
`/participants` and `/parties` and nothing under `/quotes`.

The `intapi-client` role grants the five methods on each prefix. A machine
client gets access by having its OAuth client created and being assigned that
role.

## Terms

| Term | Meaning |
|---|---|
| prefix | The name a route gives a backend's permissions, set by `iam.mojaloop.io/<backend>.service`. One prefix belongs to one Kubernetes Service |
| permission | `<prefix>.<operationId>`: one method on one path |
| internal operation | An operation marked `x-authz.internal`, answered by the pod and never served through the gateway |
| resource name | The deployment's name for a real thing, such as Participant, that services spell differently |
| grant | A permission in a role, with the resources it covers or left open |
| assignment | A person or machine client holding a role, with the resources the role leaves open |
| AuthzDocument | A document for a backend that doesn't serve its own. It takes effect when a route names it |
| held | A prefix kept at its last good state because something about it is wrong, while everything else publishes |
| pending | A role waiting for a service that no route serves yet |
