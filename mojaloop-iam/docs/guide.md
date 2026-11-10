# Mojaloop IAM guide

This guide explains how to place services and user interfaces under the access
control of the Mojaloop IAM, and how to operate it. It is written for service
developers, chart authors, UI developers, operators and devops engineers; each
part starts with the reader it is for. `permissions-guide.md` is the detailed
reference behind it.

## How it works

1. A service describes its API in an OpenAPI 3.1 document.
2. Each operation in that document becomes a permission.
3. Operators group permissions into roles and assign roles to people and
   machine clients.
4. Every request is checked at the gateway before it reaches the service. A
   request without the required permission is rejected, and the service is
   not invoked.
5. For data that belongs to participants, the service receives the
   participants the caller may see and restricts its queries to them.

## Terms

| Term | Meaning |
|---|---|
| Permission | The right to call one operation of an API |
| Prefix | The name a deployment gives a service's permissions, such as `myService` in `myService.getDFSPs` |
| Role | A named set of permissions, such as "DFSP operator" |
| Assignment | A person or machine client holding a role, over the participants the role leaves open |
| Administrator | A person who defines roles and assigns them |
| Participant | A DFSP or other organisation connected to the hub |
| Resource name | The deployment's single name for something services spell differently, such as `participant` |

## Responsibilities

The IAM handles sign-in, sessions and tokens. A service does not implement
them, does not define roles or permissions in its code or chart, and does not
call the IAM. Roles, resource names and assignments are the deployment's,
managed by its operators and administrators.

---

# For service developers

## 1. Describing your API

Every operation needs an `operationId` and a `summary`. The `operationId`
names the permission; the `summary` is what an administrator reads when
granting it.

```yaml
paths:
  /dfsps/{dfspId}/ca:
    get:
      operationId: getDFSPca
      summary: Returns the DFSP's certificate authority
```

When the API is served under a base path such as `/api`, declare it:

```yaml
servers:
  - url: /api
```

### Data that belongs to participants

The IAM restricts data by the resource types your operations are about.

**An identifier in the path.** `/dfsps/{dfspId}/ca` is about one DFSP: the
segment before the outermost path parameter names the type, and the gateway
checks the caller may reach that DFSP. Nothing needs to be written.
Parameters deeper in the path, such as an enrollment id under a DFSP, are
data inside that DFSP and add no check.

**A collection.** An operation that returns rows of several participants,
with no identifier in its path, declares the type of its rows. Your service
then restricts its query (section 2):

```yaml
  /dfsps:
    get:
      operationId: getDFSPs
      summary: Lists DFSPs
      x-authz:
        scopedBy: [dfsps]
```

**Data that belongs to no participant.** An operation whose rows belong to
nobody in particular, such as hub-wide configuration, declares none:

```yaml
      x-authz:
        scopedBy: []
```

A `GET` that returns an array and has no identifier in its path must declare
`scopedBy`, the row type or `[]`; the document is rejected otherwise.

**Declaring the types.** List every type your operations use once, at the
root of the document:

```yaml
x-authz:
  resourceTypes: [dfsps]
```

Use your API's own word for the type (`dfsps`, `participants`). The
deployment maps it to the platform's participant (section 11).

### Internal operations

Operations called only from inside the cluster, such as health checks and
metrics, are excluded from the gateway:

```yaml
  /health:
    get:
      operationId: getHealth
      summary: Reports whether the service is up
      x-authz:
        internal: true
```

### Renaming operations

Renaming an `operationId` while keeping its method and path preserves
existing access. When the path changes as well, declare the operation it
replaces:

```yaml
      operationId: listDFSPs
      x-authz:
        replaces: [getDFSPs]
```

## 2. Integrating your service

Add the library:

```bash
npm install @mojaloop/authz
```

Create the guard from your OpenAPI document at startup, serve the document,
and make the guard available to your handlers:

```js
import { createGuard } from '@mojaloop/authz';

const authz = await createGuard('src/api/openapi.yaml');

app.use(authz.expose());
app.use((req, res, next) => { req.authz = authz; next(); });
```

In a handler, ask for the caller's access and pass it to the code that reads
the data:

```js
router.get('/dfsps', async (req, res) => {
  const dfsps = req.authz(req, 'dfsps');
  res.json(await listDFSPs(dfsps));
});
```

The data layer restricts its query. Data the caller may not see is never
read:

```js
async function listDFSPs(dfsps) {
  // ids is empty when the caller may see every participant, so check restricted first
  const [rows] = dfsps.restricted
    ? await db.query('SELECT * FROM dfsps WHERE dfsp_id IN (?)', [dfsps.ids])
    : await db.query('SELECT * FROM dfsps');
  return rows;
}
```

When a request names a participant outside the path, for example in its
body, check it with `dfsps.allows(id)`.

### Errors

- A caller who may see no participant of the type is refused: the guard
  throws `Forbidden`, which carries `status: 403`. Your error handler returns
  it.
- Asking the guard about a type the operation does not declare raises an
  error. Declare the type on the operation.
- Code that runs outside a request, such as a scheduled job, passes
  `EVERYTHING` where an access is expected:

  ```js
  import { EVERYTHING } from '@mojaloop/authz';

  await listDFSPs(EVERYTHING);
  ```

### Other frameworks

`authz.expose()` is a handler for express and a bare Node `http` server. A
framework that routes the document itself serves it on `authz.path`, either
returning `authz.document` or writing `authz.published.body` with
`authz.published.etag` as the `ETag`:

```js
server.route({ method: 'GET', path: authz.path, handler: () => authz.document });   // hapi
```

## 3. Testing

Create callers with the access a test requires:

```js
import { caller } from '@mojaloop/authz/testing';

const dfspUser = caller().reaching('dfsps', ['dfsp1']);
const hubUser = caller().reachingAll('dfsps');

await fetch(`${url}/dfsps`, dfspUser.request);   // through your service's guard: dfsp1 only
await listDFSPs(hubUser.access('dfsps'));        // the data layer directly: every participant
```

To call a handler directly, set `req.authz` to a caller's guard:

```js
await handler({ ...req, authz: dfspUser.guard }, res);
```

## 4. Running locally

Requests sent directly to your service, without the gateway, carry no
caller, so operations restricted by participant return `403`. Use the test
callers from section 3 to exercise them.

---

# For chart authors

## 5. Helm chart

Declare the shared chart as a dependency:

```yaml
# Chart.yaml
dependencies:
  - name: mojaloop-common
    version: 0.1.0
    repository: https://mojaloop.github.io/helm/repo
```

Charts maintained in the Mojaloop helm repository reference it with
`repository: file://../mojaloop-common`.

Render the route with the shared template:

```yaml
# templates/httproute.yaml
{{ include "mojaloop-common.httproute" (dict "context" . "fullname" (include "my-service.fullname" .)) }}
```

```yaml
# values.yaml
gateway:
  enabled: false
  host: ""
  parentRefs: []
  cors: {}          # required when a UI on another host calls this API

authz:
  service: ""       # the permission prefix, set by the deployment
```

The route is protected when the deployment turns the IAM on
(`global.iam.enabled`) and sets `authz.service`. The template then marks the
route for the IAM with an annotation naming your backend and its prefix:

```yaml
metadata:
  annotations:
    iam.mojaloop.io/my-service.service: myService
```

If your service listens on several ports, define your own HTTPRoute, add the
shared annotations to its metadata and the shared filters to each rule:

```yaml
metadata:
  name: {{ $name }}
  {{- include "mojaloop-common.authz.annotations" (dict "context" . "backend" $name "authz" .Values.authz) | nindent 2 }}
spec:
  rules:
    - filters:
        {{- include "mojaloop-common.httproute.filters" . | nindent 8 }}
```

## 6. Backends that cannot serve a document

A third-party image or a static bundle cannot serve its own document.
Describe it in an `AuthzDocument` instead:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzDocument
metadata:
  name: partner-api
  namespace: my-namespace          # the namespace of the route that names it
spec:
  document:
    openapi: 3.1.0
    info: { title: Partner API, version: '1.0' }
    paths:
      /orders:
        get:
          operationId: listOrders
          summary: Lists orders
          x-authz:
            scopedBy: []
```

and name it on the route, beside the backend's `.service` annotation
(section 5):

```yaml
    iam.mojaloop.io/partner-api.schema: partner-api
```

The document follows the same rules as a served one (section 1). It is
checked when applied, and refused with the reason if invalid. An
`AuthzDocument` that no route names has no effect. For a UI, the values in
section 7 render both for you.

---

# For UI developers

## 7. User interfaces

### Access to the UI

Access to a UI is a single permission. Declare it in the chart:

```yaml
authz:
  service: ""
  operationId: view
  title: My Service UI
  summary: Opens My Service
```

Only users holding the permission can load the UI. A browser without a
session is redirected to the sign-in page.

### Permissions in the UI

The signed-in user's permissions are in their session, read from the
session endpoint the deployment configures:

```json
{
  "identity": {
    "metadata_public": {
      "permissions": {
        "myService.getDFSPs": { "participant": "$all" },
        "myService.getDFSPca": { "participant": ["dfsp1"] }
      }
    }
  }
}
```

A listed permission is held, together with the participants it covers
(`$all` denotes every participant). Build permission names from the prefix
the deployment supplies in the UI's runtime configuration. Hiding controls
improves usability but does not enforce access; the API checks every call,
so the UI must handle a `403` response.

### Session changes

When an administrator changes a user's access, the user's sessions end, and
the next sign-in carries the updated permissions. To sign a user out,
redirect to the sign-out address supplied in the UI's runtime configuration.

## 8. Administration screens

Role and assignment management is available as ready-made components in
`@mojaloop/authz-ui`:

```html
<script type="module">
  import '@mojaloop/authz-ui/elements/define';
</script>

<iam-roles api-base="https://iam.example.org"></iam-roles>
```

| Element | Purpose |
|---|---|
| `<iam-roles>` | Lists roles; creates and edits them |
| `<iam-subjects>` | Lists users and machine clients, with the roles they hold |
| `<iam-role-editor>` | Edits a single role |
| `<iam-assignment-editor>` | Edits the roles one user or client holds |

---

# For operators and devops

## 9. Turning the IAM on

The IAM is one switch in the deployment's values:

```yaml
global:
  iam:
    enabled: true
```

On, the IAM is installed and every chart that integrates with it uses it.
Off, nothing of it is deployed, and the deployment protects its endpoints by
its own means.

Give each protected service its prefix in that service's values:

```yaml
my-service:
  authz:
    service: myService
```

A prefix belongs to one service. Two services never share one, including two
versions of the same application (`myServiceV1`, `myServiceV2`).

## 10. Roles

A role is an `AuthzRole` object. Each grant names a permission and, for each
resource name the permission is scoped by, either covers every resource
(`$all`) or leaves it open for the assignment to name:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzRole
metadata:
  name: dfsp-operator
  namespace: ory
spec:
  title: DFSP operator
  description: Operates one DFSP
  grants:
    - { permission: myService.getDFSPca }                                   # the assignment names the DFSP
    - { permission: myService.setDFSPca }
    - { permission: myService.getDFSPs, resources: { participant: $all } } # every DFSP
```

A role is applied as soon as it is written, and an edit applies in place. A
role names no participant by id; which participant someone operates is the
assignment's to say. An operation that no role grants can be called by
nobody.

Administrators assign roles on the portal's role screen, naming the
participant for every resource the role leaves open. Someone holding
`dfsp-operator` for dfsp1 and for dfsp2 holds two separate assignments.
Nobody hands out access they do not hold: an administrator's own role says
which roles they may assign, and over which participants.

Roles written on the role screen belong to the IAM; roles applied from the
deployment's configuration are read-only there.

## 11. Resource names

Services spell the same thing differently: one calls a DFSP `dfsps`, another
`participants`. An `AuthzResourceName` declares that they are one thing, so
one grant covers every service's spelling:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzResourceName
metadata:
  name: participant
  namespace: ory
spec:
  label: Participant
  description: A financial institution connected to the hub
  members:
    - { service: myService,    type: dfsps }
    - { service: otherService, type: participants }
  source:                    # where the list of participants comes from
    url: http://participant-registry.example.svc.cluster.local/participants
    id: /name
```

Every type a service uses must belong to a resource name; a service declaring
an unmapped type is refused until the deployment maps it. The `source` is
the list administrators pick participants from.

## 12. Separation of duties

Some permissions must not end up with the same person, however many roles it
takes. An `AuthzSeparation` lists groups that nobody may hold across:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzSeparation
metadata:
  name: payout-maker-checker
  namespace: ory
spec:
  description: Whoever creates a payout does not also approve it
  within: subject
  groups:
    - [payouts.createPayout]
    - [payouts.approvePayout]
```

`within: subject` compares everything a person holds; `within: resource`,
with a `resourceName`, compares holdings over the same participant only. An
assignment that would break a rule is refused, naming the rule. A rule added
while holdings already break it lists those people on its status and takes
nothing away; which side to remove is the deployment's decision.

## 13. The first administrator, and roles everyone holds

A fresh deployment needs one administrator to sign in with:

```yaml
global:
  iamAdmin:
    email: admin@example.org
    role: hub-admin
```

The IAM creates that identity, places it in the role and invites it by email
to set a password. An empty email creates nobody, for deployments that sign
in through their own identity provider; `passwordSecret` sets the password
from a Kubernetes secret, for deployments without a mail path.

A role that every signed-in person should hold, such as opening a portal, is
marked `heldBy: authenticated`. It is never assigned, and it covers every
resource it grants:

```yaml
apiVersion: iam.mojaloop.io/v1
kind: AuthzRole
metadata:
  name: signed-in
  namespace: ory
spec:
  heldBy: authenticated
  grants:
    - permission: myPortal.view
```

## 14. Machine clients

Applications call APIs with a token instead of a session. A machine client is
created through the IAM, gets its token with its client id and secret, and
holds roles like a person. The services that onboard participants create
their clients; administrators assign them roles.

## 15. Checking what is live

```bash
# every role, separation rule, resource name and document, and what became of it
kubectl get authz -A

kubectl get authzrole -A
# NAMESPACE   NAME            READY   REASON     OPEN
# ory         hub-admin       True    Accepted   []
# ory         dfsp-operator   True    Accepted   ["participant"]

# wait for a role to be applied
kubectl -n ory wait --for=condition=Ready authzrole/dfsp-operator

# problems the IAM found with a route
kubectl -n <namespace> describe httproute <route>
```

Each object reports in its `Ready` condition: `Accepted`, `Waiting` for a
service that is not deployed yet, or `Refused` with the reason. Roles are
`Waiting` during a fresh install until the services they name are routed,
and nobody holds a role while it waits.

---

# Troubleshooting

| Symptom | Meaning | Where to look |
|---|---|---|
| `401` | The request is not authenticated. Browsers are redirected to sign-in | |
| `403` | The caller lacks the permission, or holds it for other participants | The caller's roles on the role screen |
| `404` | The path is not an operation in the service's document, or is internal | The service's API document |
| A role is `Waiting` | A service it names is not routed yet | `kubectl get authzrole -A` |
| A role is `Refused` | It names a permission no service offers, or breaks a separation rule | The role's `Ready` message |
| A document is `Refused` | It could not be read; the service keeps its last good rules | `kubectl get authzdocument -A`, the route's events |
| A route reports a backend without a prefix | Nothing that backend serves is authorized | The route's events |
| A route reports a rule without the check | Requests on that rule are not checked | The route's events |

# Checklists

**Service developers**

- [ ] Every operation has an `operationId` and a `summary`.
- [ ] Collections declare `scopedBy`, and the root lists `resourceTypes`.
- [ ] Health and metrics operations are marked `internal`.
- [ ] The guard is mounted and available to handlers.
- [ ] Queries are restricted by the caller's access, never filtered after
      reading.
- [ ] Tests use callers from `@mojaloop/authz/testing`.

**Chart authors**

- [ ] The chart depends on `mojaloop-common` and renders its route.
- [ ] A backend that cannot serve its document has an `AuthzDocument`.

**UI developers**

- [ ] The UI declares its permission in the chart.
- [ ] Permission names are built from the configured prefix.
- [ ] `403` responses are shown as "not allowed".

**Operators**

- [ ] `global.iam.enabled` is on, and each service has its prefix.
- [ ] Every type the services use belongs to a resource name.
- [ ] Roles and separation rules are applied, and `Ready`.
- [ ] The first administrator is configured.
