# Discovering what a route exposes

How the operator learns the authorization surface behind a route, without being
told image tags, file paths or deployment names.

## The chain

Identity comes from the routing surface. The surface itself comes from the
process serving it, or from a document the route names.

```
HTTPRoute, a backend keyed by annotation
  → backendRef → Service
  → GET /.authz/openapi on the port the backendRef uses
    or the AuthzDocument the route names for that backend
```

The HTTPRoute is the trust anchor: it is the door to the app, the deployment
writes it, and every app already has one. The operator asks "what is serving
the backend I know as X right now", so a rollout changes the answer without
anyone editing configuration. A customer's routes are read as they are; the
only thing added to them is annotations.

Only HTTPRoutes are read: they are the one route kind that carries an
`ExternalAuth` filter.

## Where each fact comes from

| Fact | Owner | Carried by |
| --- | --- | --- |
| a backend is authorized | deployment | `iam.mojaloop.io/<backend>.service` on the route |
| the backend's permission prefix | deployment | the value of that annotation |
| where the backend's document comes from | deployment | `iam.mojaloop.io/<backend>.schema` on the route |
| host and paths the rules match | deployment | the route's hostnames and matches |
| the operations and their scoping | developer | `x-authz` in the document |
| which document is in force | the process | what it serves |

## Keyed per backend

Annotations name a backend by the name the route's own `backendRefs` give it,
which is required on every backend reference, in the
`<prefix>/<name>.<setting>` shape Argo CD Image Updater uses for its aliases.

```yaml
metadata:
  annotations:
    iam.mojaloop.io/mcm-connection-manager-api.service: mcm
    iam.mojaloop.io/mcm-reports.service: mcmReports
    iam.mojaloop.io/mcm-ui.service: mcmUi
    iam.mojaloop.io/mcm-ui.schema: mcm-connection-manager-ui
spec:
  rules:
    - matches: [{ path: { type: PathPrefix, value: /api } }]
      backendRefs: [{ name: mcm-connection-manager-api, port: 80 }]
    - matches: [{ path: { type: PathPrefix, value: /reports } }]
      backendRefs: [{ name: mcm-reports, port: 80 }]
    - matches: [{ path: { type: PathPrefix, value: / } }]
      backendRefs: [{ name: mcm-ui, port: 80 }]
```

`<backend>.service` opts that backend in, and its value is the prefix of the
backend's permissions (`mcmUi` → `mcmUi.view`). There is no route-wide value:
every backend's prefix sits beside its name.

**One value, one Service, one document.** A value is keyed on exactly one
Kubernetes Service, and that Service's document is its only source. The same
Service reached through several rules or several routes keeps its one value.
The same value on any other Service — another rule, another route, the same
weighted rule, any namespace — is a conflict: the value keeps its last
published state, nothing from the second Service is composed, and every route
involved reports it. Two apps are never merged under one prefix.

A route in another namespace reaches a Service only through a `ReferenceGrant`
from the Service's namespace, so keying someone else's backend always takes its
owner's consent.

A backend with no `.service` key is not composed, and the route reports it.
A key naming a backend the route does not reference is an error, as are two
backends of one name in different namespaces, which the key cannot tell apart,
and a backend name longer than 55 characters, since the annotation name is
capped at 63.

## Where a backend's document comes from

The route decides, per backend, by reference within its own namespace, the way
Kubernetes objects name each other with `secretName` or `serviceAccountName`.

- no `<backend>.schema`: the backend answers `GET /.authz/openapi` through its
  Service.
- `<backend>.schema: <name>`: `AuthzDocument/<name>` in the route's namespace
  is the backend's document, and the backend is not asked. A missing resource
  is an error on the route and nothing is composed for that backend.

There are no keyword values: absent means served, anything present is a name.
An `AuthzDocument` no route names does nothing, so a chart that drops one into
a namespace cannot attach it to a route that did not ask for it, and cannot
take a name already in use.

```yaml
apiVersion: mojaloop.io/v1
kind: AuthzDocument
metadata:
  name: mcm-connection-manager-ui
  namespace: mcm
spec:
  document:
    openapi: 3.1.0
    info:
      title: Mojaloop Connection Manager UI
      version: '1.0'
    paths:
      /:
        get:
          operationId: view
          summary: Opens the connection manager
          x-authz:
            scopedBy: []
```

The resource carries the document and nothing else, as a YAML object. The
operator validates it when it is written: a validating admission webhook runs
the same reader the composition uses and refuses the object with that reader's
message, failing closed while the operator is down. Documents are OpenAPI 3.1
or later, served ones included.

## Only the process knows its own surface

A document's location inside an image does not identify it. Measured:

- `@mojaloop/api-snippets` ships 1234 YAML/JSON files and 25 OpenAPI roots in
  one copy, for services other than the one carrying it.
- `central-settlement` ships two of its own annotated documents, `openapi.json`
  and `openapi-handler.json`, and runs each from a different entrypoint.
- `sdk-scheme-adapter` reaches its outbound document through
  `require.resolve('@mojaloop/api-snippets')`, and carries three copies of that
  package at 17.10.2, 17.10.3 and 18.3.0, pulled in by different dependencies
  and spanning a major boundary. Which one answers is Node's decision at
  require time.
- The same service picks its inbound document from its own configuration, which
  an operator sets in their values file.

So the document in force is a function of the image, the operator's
configuration and the language's own resolution, and it is settled at startup
inside the process. A service that assembles its specification from code has no
document in the image at all. The process is the only component that holds the
answer, so the process is what gets asked.

## The service serves its own document

On the port and route it already has, so a deployment's chart is untouched:

```js
const authz = await createGuard('./src/api/openapi.yaml');
app.use(authz.expose());
```

One object holds the document, answers requests against it and publishes it, so
the surface the platform authorizes is the one the service is enforcing. A
document that cannot be read as an authorization surface fails at startup, in
the service's own logs.

The path is the same everywhere, so a service names it nowhere. Reaching it from
outside is a request the gateway declines; the operator reads it inside the
cluster, through the Service, the same way traffic reaches the service. The
Service also answers only from ready endpoints, so the reply comes from a pod
that is actually serving.

How the gateway declines it depends on the shape of the route's rules, and
both shapes end in the same 404. Per-operation rules are exact matches the path
was never going to hit. A rule matching a subtree — a UI's whole host — excludes
the path with a negative lookahead, the same mechanism the generator already
uses to keep a templated segment off its literal siblings. Measured on
`oathkeeper` v26.2.0: with the exclusion, `/index.html` and `/assets/app.js`
answer 200 and the document path answers 404; a second rule denying the path
instead answers 500, because two rules matching one request is an error rather
than a precedence.

The handler passes every other path on, which is what lets it mount ahead of a
router generated from the document — that router would refuse a path its own
document does not describe.

## What a server has to do

The contract is HTTP, so a service in any language satisfies it with or without
this package:

```
GET  /.authz/openapi                  → 200, application/json, the document
                                        ETag over exactly those bytes
GET  with If-None-Match: <that etag>  → 304
HEAD /.authz/openapi                  → the same headers, no body
any other method                      → 405
```

A handler either returns a value or writes the response, and a guard carries
what each shape needs: `document` for the first, `published.body` and
`published.etag` for the second, and `expose()` for an express-shaped one.

`ETag` is the part a hand-written implementation is most likely to omit, and
omitting it costs a cheap re-check rather than correctness: the operator refetches
and compares instead of being told nothing changed.

## Reading the route

Each rule contributes only the operations its own matches can reach, from its
own backends. Path and method matches narrow that; header and query matches
decide which requests go where, not which operations exist. `URLRewrite` is
undone first, since a backend's document describes the rewritten path, and a
`RequestMirror` backend never counts, since its responses are discarded. An
operation no rule reaches is dropped, from a served document or a named one.

A route without hostnames matches on its listener's hostname, and a wildcard
hostname becomes a host pattern.

A rule that splits traffic across several Services cannot know, when the
request is checked, which of them will serve it: authorization runs ahead of
the backend choice. So an operation reachable through it requires the
permission of every backend defining it, checked together as one `allOf`, and
each backend keeps its own prefix and its own document. An operation only one
of them defines needs only that one's permission. A backend with `weight: 0`
receives no traffic and is not read.

Versioned prefixes (`mcmV1`, `mcmV2`) suit API versions that live side by side.
A canary build of one API runs as one Service over both builds' pods, so its
prefix survives every release.

## Conflicts

Each conflict denies only what it covers, is reported naming the backends and
the operation, and clears when the inputs agree.

- The same value on a second Service holds the whole value.
- One permission id from two different methods or paths fails closed for both,
  so a grant never covers two operations.
- Two routes matching the same host and path are refused: Gateway API settles
  that by precedence, while Oathkeeper answers 500.
- A new operation is held by nobody until a role grants it.

## Enforcement present

Every rule reaching a keyed backend must carry the `ExternalAuth` filter
pointing at the platform. A keyed backend behind a rule without it is
unprotected while its annotations say otherwise, which the operator reports
loudly.

## Reading it once

The operator fetches a backend's document when its route appears and when its
endpoints change, and compares the `ETag` to decide whether anything it derived
needs redoing.

A surface that changes while the endpoints have not is a surface rewritten in
place, which is refused: a running process cannot restate its own permissions
without a rollout. Rules outlive the pods that described them, so a service that
scales to zero or crashloops keeps the rules it had, and there is no fallback
from one source to another.

A rollout mid-flight serves two surfaces at once, and whichever the operator
read is the one in force until it refetches. Deny-by-default means a new
operation is refused during that window rather than let through.

## Where it is reported

The operator reports on the route through Kubernetes Events, and every
condition is also in the platform's `/state`.

## What this rests on

A request for an operation the declared surface does not carry is refused rather
than passed upstream, which `gateway-authz-architecture.md` records as verified:
an unmatched path gets 404 with nothing reaching the service. A surface the
operator has not yet read therefore costs availability, not containment.

## What an adopter does

Mount the guard it already builds, and key its backend on the route. A static
bundle or an image that cannot serve its document names an `AuthzDocument`
instead.
