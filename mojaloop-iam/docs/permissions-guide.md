# Mojaloop Permissions Guide

How a service gets its permissions, how roles grant them, and how to see what
the gateway is enforcing. For service owners, deployment operators, and whoever
writes the roles. The full model is in `permission-model.md`; how a route's
document is found is in `discovery.md`.

## The whole picture

Three people each own one part, and none of them writes authorization rules by
hand:

| Part | What it is | Owner |
|---|---|---|
| API document | An OpenAPI 3.1 document describing the service's operations | Service owner |
| HTTPRoute annotation | Names the permission prefix for each backend the route sends to | Deployment |
| Roles | Group permissions; assigned to people and machine clients | Deployment / role UI |

From those, the IAM operator generates everything else: the Oathkeeper rules the
gateway checks each request against, the Keto model the grants live in, and the
catalog the role UI offers. It reads the cluster continuously, so a new route or
a changed document takes effect without redeploying the IAM.

Ory stays behind the IAM the way Envoy stays behind Istio. Nobody writes an
Oathkeeper rule or a Keto tuple directly.

## Permissions

**One operation is one permission**: one HTTP method on one path pattern.
`GET` and `PUT` on the same path are two permissions. A service with 80
operations has 80 permissions, and that is intended.

A permission's id is the route's prefix for the service plus the operation's
`operationId`:

```
mcm.getDFSPs                     # prefix mcm (from the route), operationId getDFSPs (from the document)
mcm.createDFSPInboundEnrollment
settlement.getSettlementWindows
```

Renaming an `operationId` retires one permission and introduces another. A
rollout that would leave existing grants pointing at a permission that no longer
exists is refused until the deployment's migrations say where those grants go.

CORS preflights carry no credentials and are answered before authorization, so
they are not permissions.

## Protecting a service

A service is protected by its HTTPRoute, the object every app already has.
Nothing in the route's spec changes. Two things are added:

- The `ExternalAuth` filter on every rule, which sends each request to the
  gateway's authorization check. Charts built on `mojaloop-common` render it.
- An annotation per backend, keyed by the backend's name in `backendRefs`.

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
        - type: ExternalAuth              # sends every request to the gateway's check
          # ...
      backendRefs:
        - name: mcm-connection-manager-api  # the name the annotation is keyed by
          port: 3001
```

### Where the document comes from

| Case | Annotations | Document |
|---|---|---|
| Your own service | `<backend>.service` | The service serves it at `/.authz/openapi` through `@mojaloop/authz`; the IAM fetches it through the Service |
| Third-party image, or one you can't change | `<backend>.service` and `<backend>.schema` | An `AuthzDocument` in the route's namespace, named by `.schema` |

```yaml
apiVersion: mojaloop.io/v1
kind: AuthzDocument
metadata:
  name: hubble-ui
  namespace: cilium            # same namespace as the route that names it
spec:
  document:                    # the OpenAPI 3.1 document, written as YAML
    openapi: 3.1.0
    info: { title: Hubble UI, version: '1.0' }
    paths:
      /:
        get:
          operationId: view
          summary: Opens the UI  # what an operator reads when granting it
          x-authz: { scopedBy: [] }
```

An `AuthzDocument` no route names does nothing. The route is what makes it
count, so a chart cannot grant itself permissions by shipping a document.

An `AuthzDocument` that would never compose is refused when it is applied, with
the reason: an admission webhook in the IAM runs the same reader the
composition uses. It fails closed, so while the IAM is down no document is
stored unchecked.

A UI, or any surface that is "allowed in or not", needs no document of its own.
Charts built on `mojaloop-common` generate one from values:

```yaml
ui:
  authz:
    service: mcmUi        # the prefix: the deployment's to set
    operationId: view     # the chart's: one permission over the whole UI
    title: Mojaloop Connection Manager UI
    summary: Opens the connection manager
```

### Rules for prefixes

- **A prefix belongs to one Kubernetes Service.** Several routes, in any
  namespaces, may send traffic to the same Service under the same prefix. The
  same prefix on a second Service is a conflict, and that prefix is held until
  it is resolved.
- **Different Services get different prefixes**, even two versions of one app
  (`mcmv1`, `mcmv2`): different APIs, different permissions.
- **A prefix has one document**, and every host it answers on is sent the same
  paths.
- **A rule only matches what the route sends that backend.** A route sending
  `/participants` to one Service and `/quotes` to another keeps a grant on the
  first from ever reaching the second.
- A prefix is letters, digits, `_` and `-`, starting with a letter or digit.
  The Keto namespace is the prefix itself when it is an identifier
  (`portalShell`); a hyphen is encoded (`portal-shell` → `portal_2d_shell`).
  The catalog lists each service's namespace.
- A backend name is at most 55 characters, so the annotation key fits
  Kubernetes' 63-character limit.

## Scoping by resource

Most permissions are about something: a DFSP, a report. A document says which
types its operations are about with `x-authz`, which has exactly two keys:

```yaml
x-authz:
  resourceTypes: [dfsps]               # root: every type the operations use

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
        scopedBy: [dfsps]              # about DFSPs, no id in the path
```

That one declaration decides both what is checked and what the service is told:

| Operation | Checked against | Service receives |
|---|---|---|
| `GET /dfsps/{dfspId}/ca` | that DFSP | the DFSPs the caller holds |
| `GET /dfsps` | the service as a whole | the DFSPs the caller holds, to filter the list |
| `GET /hub/endpoints` (`scopedBy: []`) | the service as a whole | nothing |

An operation returning a list must say what its rows are scoped by, or declare
`scopedBy: []` for rows everyone holding the permission may see. Leaving it out
is refused.

The service reads what the caller may see through `@mojaloop/authz`. It never
parses the gateway's header itself.

## Resource names

Services spell the same thing differently: MCM calls a DFSP `dfsps`, the
reporting services call it `participants`. The deployment declares once that
these are the same thing, so one grant covers every service's spelling and an
operator picks "Participant: dfsp1" once:

```yaml
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

Every type a service is about must appear under some resource name, and every
member must be a type its service really declares, so a typo stops the rollout
instead of producing a picker whose choices bind nothing. A member whose service
is not running in this deployment is reported, not an error.

## Roles and assignments

Roles are deployment data, written in gitops (and, later, in the role UI). A
grant names a permission and, for each resource name the permission is scoped
by, one of:

| Grant says | Meaning |
|---|---|
| `resources: { Participant: all }` | every participant, now and future |
| `resources: { Participant: [dfsp1, dfsp2] }` | exactly these |
| nothing | left open: each assignment names the participant |

```yaml
roles:
  hub-admin:                   # names everything: one role for the whole hub
    grants:
      - { permission: mcm.getDFSPs, resources: { Participant: all } }
      - { permission: mcmUi.view }
  dfsp-operator:               # leaves Participant open
    grants:
      - { permission: mcm.getDFSPca }
      - { permission: mcm.setDFSPca }

assignments:
  - { subject: <identity id>, role: hub-admin }
  - { subject: <identity id>, role: dfsp-operator, resources: { Participant: dfsp1 } }
```

A role leaving a resource name open is a separate role per resource:
`dfsp-operator` for dfsp1 and for dfsp2 never merge. MCM assigns it this way
when it onboards a DFSP.

At runtime, assignments go through the IAM's API, which the role UI and
services call:

```
GET    /catalog                              every permission, with its summary
GET    /roles                                the roles, and which resource names each leaves open
GET    /resources?resourceName=Participant   what can be picked
GET    /subjects/<id>/assignments            what someone holds
POST   /subjects/<id>/assignments            { role, resources }
DELETE /subjects/<id>/assignments            { role, resources }
GET    /state                                what is applied, and what is waiting
```

An operation nobody grants is reachable by nobody.

## Separation of duties

Some permissions must never end up in one pair of hands, however many roles it
takes to get there:

```yaml
exclusions:
  - name: audit-exclusion
    a: [settlement.auditSettlement]
    b: [settlement.positionFundsInOut, settlement.positionNDCEdit]
```

An assignment that would give someone both sides is refused, naming the rule.
Holdings that already break a newly added rule are reported, never silently
revoked: which half to take away is the deployment's decision.

## When something is wrong

One broken service never takes the rest down; each prefix stands on its own.

| Situation | What happens | Where you see it |
|---|---|---|
| A document can't be read or is invalid | That prefix keeps its last good rules; the rest publish | Event on the route; `AuthzDocument` state `Refused` |
| One prefix on two Services, or read from two documents | That prefix is held | Event on the route |
| A backend with no annotation | Nothing it serves is authorized | Event on the route |
| A rule without `ExternalAuth` | Reported: the gateway is not asked | Event on the route |
| Two prefixes matching the same request | Nothing publishes until fixed | IAM log |
| A permission removed that grants still use | Nothing publishes until a migration names where the grants go | IAM log |
| A role naming a service not routed yet | The role waits, then goes live when the service arrives | `/state` → `pending` |
| A role naming an operation its service doesn't have | The install stops | IAM log |

Waiting roles are normal during a fresh install. The IAM comes up before the
apps, so roles like `hub-admin` wait until MCM, the portal and the rest are
routed, then go live on their own. Until then nobody holds them, which is the
safe direction.

## Checking what is live

```bash
# problems the IAM found with a route
kubectl -n mcm describe httproute mcm-connection-manager-api

# every AuthzDocument, and whether it is in force
kubectl get authzdoc -A
# NAMESPACE     NAME        SERVICE                              STATE
# cilium        hubble-ui   hubbleUi                             Accepted
# mojaloop      intapi      intapiSettlements,lookup,quotes,...  Accepted

# what the IAM applied, and which roles are still waiting
curl http://<iam>/state
# every permission the deployment offers
curl http://<iam>/catalog
```

`Unreferenced` means no route names that document yet.

## Worked example: the operator machine API

The `intapi.int` host gives operator tools one address for five of the switch's
services, dispatched by path. None of those images serves a document for this
surface, so one `AuthzDocument` describes it: one permission per HTTP verb over
whatever the route sends.

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
prefix's rules match only its own paths: `lookup.view` covers `/participants`
and `/parties`, never `/quotes`. Central settlement also answers on its own
route as `settlement` with the document it serves, so its mount here is a prefix
of its own.

The `intapi-client` role grants the five verbs on each prefix. A machine client
gets in by creating its Hydra client and being assigned that role.

## Not built yet

- **Reserved roles `$everyone` and `$authenticated`**, for operations open to
  all callers or all signed-in callers (health probes, "who am I").
- **Writing roles from the UI.** Roles come from gitops; `/roles` is read-only.
- **A rule splitting traffic across two Services** (a canary) is refused.

## Terms

| Term | Meaning |
|---|---|
| prefix | The name a route gives a backend's permissions, set by `iam.mojaloop.io/<backend>.service`. One prefix, one Kubernetes Service |
| permission | `<prefix>.<operationId>`: one method on one path |
| resource name | The deployment's name for a real thing (Participant) that services spell differently |
| grant | A permission in a role, with the resources it covers or left open |
| assignment | A person or machine client holding a role, with the resources the role leaves open |
| AuthzDocument | A document for a backend that doesn't serve its own; counts only when a route names it |
| held | A prefix kept at its last good state because something about it is wrong; everything else still publishes |
| pending | A role waiting for a service no route has brought yet |
