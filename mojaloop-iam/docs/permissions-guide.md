# Mojaloop permissions guide

This guide is for service owners, deployment operators and the people who
write roles. It covers how a service declares its permissions, how a
deployment exposes the service through the gateway, how roles grant
permissions, and how to find out why a request was refused. The model behind
it is in `permission-model.md`, and how the IAM finds a route's document is in
`discovery.md`. To put a service or UI behind the IAM for the first time,
start with `guide.md`.

## How it fits together

Authorization comes from three inputs:

| Input | What it is | Written by |
|---|---|---|
| API document | The service's OpenAPI 3.1 document, with `x-authz` annotations | Service owner |
| Route annotations | `iam.mojaloop.io/...` annotations on the HTTPRoute, one set per backend | Deployment |
| Roles, resource names, separation rules | `AuthzRole`, `AuthzResourceName` and `AuthzSeparation` objects | Deployment |

The IAM operator reads these from the cluster and generates the Oathkeeper
rules the gateway checks, the Keto model the grants are stored in, and the
catalog the role screen shows. It watches routes, documents, gateways and the
deployment's objects, so a new route, a changed document or an edited role
takes effect without redeploying the IAM. Each object says in its `Ready`
condition what became of it. Oathkeeper rules and Keto tuples are never edited
by hand.

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

Renaming an `operationId` while its method and path stay is a rename: grants
naming the old id hold under the new one. An operation that also moved to a
new path names what it takes over, `x-authz: { replaces: [getDFSPs] }`. A
grant naming a permission that was removed is dropped. The role's `Ready`
condition says which, and a name no catalog ever held is refused.

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
apiVersion: iam.mojaloop.io/v1
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
annotation. Until then it is not `Ready`, with reason `Waiting`.

When an `AuthzDocument` is applied, the IAM checks it with the same reader it
composes with and refuses a document that would not compose, giving the
reason. While the IAM is unavailable, applying any of its objects fails.

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
operator picks "participant dfsp1" once:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzResourceName
metadata:
  name: participant            # the name grants, assignments and services use
  namespace: ory
spec:
  label: Participant           # display text, or one per language: { en: ..., fr: ... }
  description: A financial institution connected to the hub
  members:
    - { service: mcm,        type: dfsps }
    - { service: reports,    type: participants }
    - { service: settlement, type: participants }
  source:                      # where the list of participants comes from
    url: http://moja-centralledger-service.mojaloop.svc.cluster.local/participants
    id: /name
```

The object's name is the resource name, unique across the cluster. Every type
a service uses must be a member of some resource name, and every member must
be a type its service declares. Otherwise the composition is refused. A member
whose service isn't deployed binds nothing until it is, and the object's
`Ready` message lists it. A `source` is read when a picker asks for the
resource name, an assignment names one of its ids, or the object changes,
never on a timer; a read that fails is answered by the last good one, marked
stale. A source whose answer doesn't match `list` and `id` refuses the object;
one that doesn't answer is named in its `Ready` message. `kubectl get
authzresourcenames` shows how many resources each name had when last listed.

## Roles and assignments

A role is an `AuthzRole` object, in any namespace, named once across the
cluster. A grant names a permission, at most once per role, and, for each
resource name the permission is scoped by, one of:

| The grant says | Meaning |
|---|---|
| `resources: { participant: $all }` | every participant, including future ones |
| nothing | left open, so each assignment names the participant |

A role names no participant by id: participants come and go with the
services that create them, and a grant naming one would outlive it. Which
participant a holding covers is the assignment's to say. Ids are named only
of the IAM's own resource names, `role` and `permission`.

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzRole
metadata:
  name: dfsp-operator          # leaves participant open
  namespace: ory
spec:
  title: DFSP operator
  description: Operates one DFSP in MCM
  grants:
    - { permission: mcm.getDFSPca }
    - { permission: mcm.setDFSPca }
    - { permission: mcm.getDFSPs, resources: { participant: $all } }
```

`status.open` lists the resource names an assignment must name. A role whose
services are all routed is applied as soon as it is written, and an edit
applies in place. A role naming a service no route serves yet is `Waiting`
and holds nothing until the service is routed. A role naming a permission its
service doesn't offer is refused when it is applied.

A role that leaves a resource name open is held once per resource. Someone
holding `dfsp-operator` for dfsp1 and for dfsp2 has two separate holdings. The
connection manager assigns `dfsp-operator` this way when it onboards a DFSP.

An operation no role grants can't be called by anyone.

### Assigning roles

Operators assign roles on the portal's role screen, which calls the IAM's
public API through the gateway. Every operation of that API is a permission
like any other service's, under the `iam` prefix. The subject is the identity
id for a person and the OAuth client id for a machine client.

```
GET    /catalog                              every permission, with its summary
GET    /resource-names                       the deployment's resource names
GET    /resources?resourceName=participant   what can be picked
GET    /roles                                the roles, and which resource names each leaves open
POST   /roles, PUT/DELETE /roles/<name>      roles composed on the screen
GET    /subjects                             the people and machine clients
GET    /subjects/<id>/assignments            what someone holds
POST   /subjects/<id>/assignments            { role, resources }
DELETE /subjects/<id>/assignments            { role, resources }
GET    /state                                what is applied, what waits, and what was refused
```

Nobody hands out access they don't hold, and nobody reaches past their own
scope. The IAM's role and assignment operations are scoped by `role` or
`permission` and by `$resources`, every resource name the deployment
declares. A grant either fixes such a name to `$all`, or leaves it to follow
its holder's own assignment: a DFSP administrator assigned over dfsp1 reaches
dfsp1.

Assigning a role is refused unless the assigner's `iam.assignRole` scope names
the role, whatever they hold, and reaches every resource the assignment names
or the assigner holds everything the role gives over the ones it doesn't. An
assignment may name `$all` where the assigner reaches every participant.
Composing or editing a role follows the same rule with `iam.createRole` and
`iam.updateRole` naming permissions; a resource name a composed grant leaves
open passes, since it gives nothing until someone assigns it. `GET /roles`
shows the roles the caller's scope names, and `GET /resources` the resources
it reaches. A role is deleted only once nobody holds it and no other role's
grants name it.

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzRole
metadata:
  name: dfsp-admin             # leaves participant open
  namespace: ory
spec:
  title: DFSP administrator
  description: Hands out dfsp-operator over the DFSPs it administers
  grants:
    - { permission: mcm.getDFSPs }
    - { permission: iam.listRoles, resources: { role: [dfsp-operator] } }
    - { permission: iam.listResources }                                  # its own DFSPs
    - { permission: iam.assignRole, resources: { role: [dfsp-operator] } } # over its own DFSPs
```

An administrator's role is therefore deployment data like any other: an
`AuthzRole` that names what its holders may hand out and over what.

The IAM's internal API serves the provisioning authority, the one client whose
job is creating resources and the identities that operate them: here the
connection manager, which onboards DFSPs and holds their Vault and PKI. When it
onboards a DFSP it records that the resource exists, creates the people and
machine clients that operate it, and assigns them roles named in its own
configuration. A regular service never calls the IAM; the IAM learns the
resources a service serves from the sources the deployment names:

```
POST   /provision                  { resourceName, id }
DELETE /provision                  { resourceName, id }   answers who is left holding nothing
POST   /accounts                   { email, name }        finds or creates a person, invites a new one
DELETE /accounts/<subject>                                once they hold no role
POST   /clients                    { id, name }           answers the secret once
POST   /clients/<subject>/secret                          a new secret, answered once
DELETE /clients/<subject>                                 once it holds no role
POST   /subjects/<id>/assignments  { role, resources }
DELETE /subjects/<id>/assignments  { role, resources }
```

The internal API authenticates nothing. Only the pods the chart's
`networkPolicy.internalCallers` names reach it.

## Separation of duties

Some permissions must not end up with the same person or client, however many
roles it takes to get there. An `AuthzSeparation` lists groups of permissions
nobody may hold across:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzSeparation
metadata:
  name: audit-exclusion
  namespace: ory
spec:
  description: Whoever moves funds does not audit the moving
  within: subject              # or resource, with resourceName
  groups:
    - [settlement.auditSettlement]
    - [settlement.positionFundsInOut, settlement.positionNDCEdit]
```

`within: subject`, the default, refuses anyone holding two groups whatever the
resources. `within: resource` with `resourceName: participant` refuses two
groups over the same participant only, a grant over `$all` meeting every other.

An assignment that would give someone two groups is refused, and the error
names the rule. A role whose own grants span two groups is refused when it is
applied. When a rule is added while holdings that break it already exist,
those holdings stay in place and the rule's `status.violations` lists the
subjects. The deployment decides which side to remove.

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
| A role names a service no route serves yet | The role waits, and goes live once the service is routed | The role: `Waiting` |
| A role names an operation its service doesn't have | The role is refused and holds nothing | The role: `Refused` |
| Two objects of one kind use the same name | The older one holds it, the newer is refused | The newer: `Refused` |
| An existing holding breaks a separation-of-duties rule | The holding stays | The rule: `status.violations` |

Waiting roles are normal during a fresh install. The IAM starts before the
applications, so roles such as `hub-admin` wait until the services they name
are routed. Nobody holds a role while it waits.

## Checking what is live

```bash
# problems the IAM found with a route
kubectl -n mcm describe httproute mcm-connection-manager-api

# every role, separation rule, resource name and document, and what became of it
kubectl get authz -A
kubectl get authzrole -A
# NAMESPACE   NAME            READY   REASON     OPEN
# ory         hub-admin       True    Accepted   []
# ory         dfsp-operator   True    Accepted   ["participant"]

# wait for a role to be applied
kubectl -n ory wait --for=condition=Ready authzrole/dfsp-operator

# the IAM's public API and its controller, through the Kubernetes API server
IAM=/api/v1/namespaces/<iam namespace>/services/ml-iam-services-api:80/proxy
CONTROLLER=/api/v1/namespaces/<iam namespace>/services/ml-iam-services-controller:80/proxy

kubectl get --raw $IAM/state                      # what was applied, waiting roles, holdings that break a rule
kubectl get --raw $IAM/catalog                    # every permission the deployment offers
kubectl get --raw $CONTROLLER/access-rules.yml    # the rules the gateway enforces
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
| resource name | The deployment's name for a real thing, such as participant, that services spell differently |
| grant | A permission in a role, with the resources it covers or left open |
| assignment | A person or machine client holding a role, with the resources the role leaves open |
| AuthzDocument | A document for a backend that doesn't serve its own. It takes effect when a route names it |
| held | A prefix kept at its last good state because something about it is wrong, while everything else publishes |
| pending | A role waiting for a service that no route serves yet |
