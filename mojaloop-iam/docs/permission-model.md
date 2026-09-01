# Permission model

What permissions, roles, and grants mean, who defines each, and how a decision
is made. `gateway-authz-architecture.md` covers the network and enforcement
path; this covers the model both are built on.

The one-sentence law: a service's API document is its entire authorization
surface, deployments compose roles and grants as data, and Keto evaluating
stored grants is the only thing that ever answers an authorization question.
Everything else asks, or moves bytes.

## Permissions are operations

One method on one endpoint pattern is one permission. GET and PUT on the same
path are different permissions. This is Kubernetes-verbs and AWS-actions
granularity: a mid-sized service advertises roughly one permission per API
operation, the catalog is long, and that is correct. Anonymous infrastructure
routes, health probes and CORS preflights, are not permissions and never
appear in a catalog.

A permission has two spellings and they are not interchangeable:

```
example.getWidgetCa   the permission id: the gateway rule id, the catalog key,
                      the name a role document references
getWidgetCa           the relation: what a stored tuple holds, what a check asks
```

The id is the relation prefixed with the service. The prefix keeps ids unique
across a deployment; the relation lives inside the service's own namespace and
needs no prefix. Anything reading the catalog and writing tuples has to
convert between them.

By default the relation is the `operationId`. An operation may pin a different
one, which is what lets a handler be renamed without rewriting every role that
references it.

## The API document is the only authored artifact

A service repository contains no rules file, no permission model, and no
roles. It contains its OpenAPI document, and the platform generates the rest
at deploy time.

`x-authz` accepts exactly four keys and rejects everything else at build
time — two at the document root, two on an operation:

```yaml
x-authz:
  service: example              # root: the namespace and id prefix
  resourceTypes: [widgets]      # root: every resource type the operations use

paths:
  /widgets/{widgetId}/ca:
    get:
      x-authz:
        permission: issueCert            # the relation, replacing the operationId
        scopedBy: [{ widgets: widgetId }] # the types scoping this answer
```

`resourceTypes` is the document's whole vocabulary, authored once and checked
both ways: an operation using a type outside it fails the build — which is
what catches the type one operation misspells among fifty — and a listed type
no operation uses fails the same way, so the list can never rot into
decoration. A document whose operations use no types declares nothing.

A `scopedBy` entry is one of two shapes, and a written list is the whole
truth. `type: parameter` binds that path parameter as the type's id, and the
parameter must exist on the path. A bare `type` declares the type unbound. A
bare entry naming a type the path binds is refused, because it would read as
bound and not be.

Two things are declared in native OpenAPI rather than in `x-authz`, because
OpenAPI already has words for them. `security: []` on an operation makes it
anonymous, and no permission exists for it. The security schemes an operation
lists become its authenticators: an `apiKey` in a cookie is a browser session,
an `http`/`bearer` JWT is a machine token.

```yaml
paths:
  /widgets/{widgetId}/ca:
    get:
      operationId: getWidgetCa
      summary: Returns the widget CA certificates   # shown in the role UI
      security:
      - session: []
      - machineToken: []
```

## `scopedBy` is the whole story

An operation declares which resource types its answer is scoped by. That
single declaration answers both authorization questions, so there is nothing
else to write.

**What is checked.** If the path binds an id for a declared type, the
operation is authorized against `<type>/<id>`. If it does not, the operation
is authorized against the service singleton.

**What the caller may see.** Every declared type appears in the `X-Scope`
header, carrying the resources of that type named by the role that admitted
the request.

```
GET  /widgets/{widgetId}/ca      [widgets]  check widgets/{widgetId}   X-Scope: widgets=…
GET  /widgets                    [widgets]  check __self__             X-Scope: widgets=…
POST /external/certs             [widgets]  check __self__             X-Scope: widgets=…
GET  /hub/endpoints/ips/{epId}   []         check __self__             X-Scope: none
```

The second row is a collection listing: the type has no bound id, so the
check asks whether the caller may call the listing at all, and the scope says
which rows come back. The third row is an operation that needs to know who the
caller is in its own vocabulary; the scope answers that without any identity
claim travelling to the service. The fourth is a path whose outer id is not
something anyone is granted, an item inside a hub-owned list, so it declares
no types.

An omitted `scopedBy` derives from the path: the literal segment preceding
the outermost path parameter names the type, and the parameter carries its
id, so `/widgets/{widgetId}/ca` derives `[{widgets: widgetId}]`. Parameters
deeper in the path are business data inside an already-authorized resource,
protected by the containment they live in, so they derive nothing. An
operation writes `scopedBy` when the path does not say it — a collection, an
operation about the caller's own resources, `[]` to declare none — and what
it writes is explicit: bindings as `type: parameter` pairs, unbound types
bare.

**Multiple types.** A check addresses exactly one object, so an operation
declaring two types that both have bound ids emits one check per type, in
capture order, and all must pass.
`/reports/{reportId}/widgets/{widgetId}` checks `reports/{reportId}` and
`widgets/{widgetId}` together, and its scope carries both types.

The generator writes a derivation table alongside the rules: one line per
operation stating what it concluded. It is reviewed once per service and
diffed on every build, so a wrong derivation shows up as a changed line rather
than a 403 in staging.

## The object vocabulary

Keto has no objectless tuple. Every stored edge and every check is
`(namespace, object, relation, subject)`, so an operation about nothing in
particular still has to name an object. Three shapes cover every case, fixed
platform-wide because they live in stored tuples:

```
widgets/w7        one resource
widgets/__all__   every resource of that type, present and future
__self__          the service itself
```

```
example:widgets/w7#getWidgetCa@Role:auditor#members
    role auditor may call getWidgetCa, on widget w7

example:__self__#getWidgets@Role:hub-operator#members
    role hub-operator may call getWidgets
```

`__self__` is what an operation with no bound id is authorized against. It is
a real grant point, not a placeholder: for a collection listing it answers
"may you call this endpoint", which is a different question from "which rows
come back". A caller holding `widgets/w7#getWidgetCa` has a non-empty visible
set without holding `getWidgets`, and must not reach the listing.

`__all__` is an ordinary object, not a structural link. The decision endpoint
checks it as a second object whenever the first one misses, which is what
makes "grant over everything" one tuple instead of a traversal, and what makes
it collapse a scope to `*`.

A resource object always contains a slash and `__self__` never does, so the
two cannot collide. Within a type, `__all__` is a reserved id. Keto accepts
any string as an object, so the write path is what enforces both.

## The Keto model

```ts
import { Namespace } from "@ory/keto-namespace-types"

export class User implements Namespace {}

export class Role implements Namespace {
  // @ts-ignore TS2564: OPL declaration, never instantiated
  related: {
    members: User[]
  }
}

export class Resource implements Namespace {}

export class example implements Namespace {}
```

That is the whole model: three shared classes and one empty class per service.
It is this small because of what Keto actually enforces, verified against
`ory/keto` v26.2.0 rather than inferred.

A service name is a class name, so it is checked against what a class may be
called. A hyphen would produce a file Keto cannot parse, and a file it cannot
parse takes the whole staged model with it.

**Namespaces are enforced.** A write to an undeclared namespace is rejected
with `404 Unknown namespace`. This is the only reason the file exists.

**Relations are not.** A write naming a relation the namespace never declared
is accepted with `201`. Permission names therefore need no declaration, and a
service adding an operation needs no model change.

**Role indirection resolves with no permit.** A check for
`example:widgets/w7#getWidgetCa` by `user-1` passes when the stored tuples are
`example:widgets/w7#getWidgetCa@Role:auditor#members` and
`Role:auditor#members@user-1`. Subject-set traversal is part of evaluation,
not something a permit switches on.

`User` and `Role` are declared byte-identical in every service's file, because
Keto reads one concatenated file and keeps the last declaration of a
duplicated name.

Keto does not enforce subject types. The invariant that a grant's subject is
always a role's member set is therefore held by the write path, which refuses
a `subject_id` on any grant, and audited by the decision endpoint, which
reports a direct user grant as a policy violation rather than hiding it.

## What the generator emits

Per service, from the one document:

| file | consumer |
|---|---|
| `oathkeeper-rules.yml` | the gateway |
| `keto-namespaces.ts` | Keto, concatenated with every other service's |
| `catalog.json` | the IAM, for the role UI |
| `derivation.txt` | humans, reviewed and diffed |

Every rule is the same skeleton; only the payload varies. Rules never name
infrastructure: no remote URL, no header lists, no per-rule handler
configuration beyond the payload. The decision endpoint's address and the
forwarded headers are global platform configuration.

```yaml
- id: example.getWidgetCa
  match:
    url: <http|https>://api.example.test/api/widgets/<(?<widgetId>[^/]+)>/ca<$>
    methods: [GET]
  authenticators:
    - handler: cookie_session
    - handler: jwt
  authorizer:
    handler: remote_json
    config:
      payload: '{"namespace":"example","object":"widgets/{{ printIndex .MatchContext.RegexpCaptureGroups 1 }}","relation":"getWidgetCa","subject_id":"{{ print .Subject }}","scope":["widgets"]}'
  mutators:
    - handler: header
```

Matches must be mutually disjoint or Oathkeeper answers 500, so a templated
segment competing with literal siblings at the same position carries a
computed negative lookahead listing them.

The payload has two forms, plus `scope` which carries the declared types and
appears on both:

```
one type bound:   {"namespace":…,"object":"widgets/{{ capture }}","relation":…,"subject_id":…,"scope":["widgets"]}
two types bound:  {"allOf":[ {first check}, {second check} ],"scope":["reports","widgets"]}
none bound:       {"namespace":…,"object":"__self__","relation":…,"subject_id":…,"scope":["widgets"]}
no types at all:  {"namespace":…,"object":"__self__","relation":…,"subject_id":…,"scope":[]}
```

The decision endpoint rejects anything that does not parse as this schema, and
a rejection is a denial.

## What reaches the service

One header, written by the gateway on allow and stripped from the inbound
request first so it cannot be forged.

```
X-Scope   the caller's visible resources, per declared type
```

A service never learns who the caller is. It reads no other authorization
input and calls no authorization API. Who did what is answered by the decision
endpoint's record, which carries the subject, the checks, the verdict and the
scope for every request, in one place a service can neither skip nor forge.

The IAM is the exception, and only for questions about the caller themselves,
such as which of their own permissions they hold. Its own routes forward the
subject; nothing else does.

## The decision path

```
request -> gateway route -> ExternalAuth -> Oathkeeper rule
        -> rendered payload -> POST decide -> Keto -> allow / deny
```

The decision endpoint is owned by the IAM service and deployed as its own
process: stateless, holding read-only Keto access, with no gateway route. It
is the single audit point, writing one record per decision either way.

It evaluates in two steps.

**The checks.** One check, or every check under `allOf`. A check passes if the
subject holds the relation on the object, or on that object's `__all__` form.
The singleton has no `__all__` form. Any check failing is a denial.

**The scope.** For each type in `scope`, the visible set is computed from the
roles that carried the checks, and returned in `X-Scope`. A declared type
resolving to an empty set is a denial: on a listing an empty filter reads as
"no restriction" in a query layer and returns the whole table, and on any
other operation an empty set means the caller has no standing in that type at
all. An empty `scope` array yields `X-Scope: none` and denies nothing.

Verdicts come only from Keto. The decision endpoint composes results; it never
produces one.

## Scope: how it is computed

Visibility is defined as holding any grant on the resource. That is exactly
what the enumeration finds, so the header and a per-resource check can never
disagree, and it gives "whoever may change a thing may see it" without a
separate implication mechanism.

```
X-Scope: widgets=*
X-Scope: widgets=w7,w11
X-Scope: reports=monthly,quarterly;widgets=w1,w4
X-Scope: none
```

Computing it is a walk, because Keto has no subject-first index. Both
evaluation entry points take the object: `Engine.CheckRelationTuple` needs a
full tuple, and `Engine.BuildTree` expands the subjects of a given
`object#relation`. The query endpoint returns stored tuples matching a flat
filter, with no traversal at all. So:

```
GET /relation-tuples?namespace=Role&relation=members&subject_id=<subject>
    -> the caller's roles

for each role:
GET /relation-tuples?namespace=<service>&subject_set.namespace=Role
                    &subject_set.object=<role>&subject_set.relation=members
    -> every grant that role holds, kept together

keep the roles holding the checked object, or its "<type>/__all__" form, under
the relation the request asked for; the others granted something else and say
nothing about this request

within those, keep objects under "<type>/"; "<type>/__all__" among them
collapses that type's answer to "*"
```

A further query for tuples written directly to the subject finds only grants
that bypassed a role. Those are reported as policy violations rather than
merged into the answer.

A scope exceeding the size cap is an operational alarm, a deployment granting
by enumeration where it should have granted `all`, never a truncation.

A service does not implement this format. `@mojaloop/authz` holds it, in both
directions: the decision endpoint renders the header with it and every service
reads the header with it, so the two cannot disagree about what a value means.
A service that read an empty list as "no restriction" instead of "nothing" would
be a silent data leak in that service rather than a parse error anyone notices,
which is why one round-trip test guards the format rather than each team
guarding their own copy.

What a service supplies is the name of its own resource type:

```js
const { INTERNAL, idsInScope } = require('@mojaloop/authz')

const ids = idsInScope(req.scope, 'widgets')
if (ids !== undefined) query.whereIn('widgets.id', ids)
```

`undefined` is no restriction, an empty array is nothing visible, and a call
carrying no scope at all raises rather than defaulting open, so a read with no
gateway in the path says so by name with `INTERNAL`.

That clause is the service's entire authorization footprint. It knows its own
resource type and its own row ids; it knows no permissions, no roles, no
subjects. Aggregation endpoints apply scope to their inputs, GraphQL services
apply it in resolvers; the depth is theirs, the data is the header's.

Scope is enforced in the owner's query or at the gateway, never by fetching
rows and discarding: data a caller may not see does not travel. A pass-through
whose upstream cannot be asked a scoped question declares its listings
`scopedBy: []` — who may call them whole is the deployment's granting decision
— while its path-bound routes stay checked per id at the gateway.

## Roles, assignments, and grants

Roles are deployment data, composed in the UI or in gitops from the
permissions services advertise. Both paths write the same documents through
the same IAM APIs.

```yaml
roles:
  hub-operator:
    grants:
      - permission: example.getWidgets
        bind: { widgets: all }
      - permission: example.getWidgetCa
        bind: { widgets: all }
  west-auditor:
    grants:
      - permission: example.getWidgetCa
        bind: { widgets: [w7, w11] }
  widget-operator:
    params: [widgetId]
    grants:
      - permission: example.getWidgetCa
        bind: { widgets: $widgetId }
      - permission: example.issueCert
        bind: { widgets: $widgetId }

assignments:
  - { subject: <identity id>, role: widget-operator, args: { widgetId: w7 } }
```

A grant names a permission from the catalog and binds its types. Every type
the permission's path **binds an id for** must be bound, because that is what
the check addresses. Every other type the permission **declares** may be
bound, and those are the resources the operation may touch once it runs. A
binding is `all`, an explicit id list, or a role parameter left open until
assignment; binding a type the permission does not declare is rejected, since
it would write a tuple nothing ever reads.

The catalog states both sets, so a role author reads rather than guesses:
`scopedBy` is what the operation declares, and `bound` is the subset the path
carries an id for.

```
getWidgetCa  resources [widgets]              bound [widgets]  widgets/<id>#getWidgetCa
getWidgets   resources [widgets]              bound []         __self__#getWidgets
                                                               widgets/<id>#getWidgets
getReport    resources [reports,participants] bound [reports]  reports/<id>#getReport
                                                               participants/<id>#getReport
getRegions   resources []                     bound []         __self__#getRegions
```

The checked object comes first and the rest follow, all under the same
relation, so holding one is what it means to see it and a single query answers
both questions.

A scope comes from the role that admitted the request, and from no other role
the caller happens to hold. Within that role it is the union over every
resource the role names in that type, whether it named it by binding the scope
type on this grant or by holding another grant on the same resource: a role
granting `getWidgets` on `__self__` and `getWidgetCa` on `widgets/w7` produces
a listing scoped to `w7` either way. A role granting the listing and naming
nothing shows the caller nothing, and the empty-set rule turns that into a
denial rather than a silently empty page.

Keeping the scope inside the admitting role is what lets one role say "this
report, for this participant" while another says "that report, for that
participant", without the two combining into all four pairs. A role is one
statement about one operation over one set of resources, and merging two of
them would invent access neither granted.

A role with open parameters instantiates per argument tuple: the grants
materialize against `Role:widget-operator@widgetId=w7`, and the assignment
adds the subject to that instance's `members`. Assignment and revocation stay
one membership edge, which is the property that makes revocation immediate and
auditable. Revocation asks nothing of the resource, so a grant on a widget
that has since been retired can still be taken away.

The IAM serves what an operator needs to make that choice and the write that
records it:

```
GET  /catalog                        every service's permissions, with their summaries
GET  /roles                          the roles, and which arguments each one asks for
GET  /resources?type=widgets         the widgets that exist, to choose among
GET  /subjects/<id>/assignments      what someone holds, one entry per instance
POST /subjects/<id>/assignments      { role, args }
DELETE /subjects/<id>/assignments    { role, args }
GET  /state                          what this deployment applied, and when
```

An assignment naming a role that takes different arguments, or an argument
naming a resource that does not exist, is refused before anything is written.

`/state` answers the catalog it validated against, the roles and exclusions it
read, and the record of applying them: how many tuples, which role instances
were refreshed, which were retired, and every holding that breaks an exclusion.
It is what an operator reads to see whether the roles in git are the roles in
Keto, without being handed a Keto client to go looking.

Every grant is written through the IAM: by a human in the UI, by deployment
defaults shipped as editable seed data, or by a service acting as a governed
subject, holding deployment-granted IAM permissions with the acting human
recorded on-behalf-of. Nothing grant-shaped ships in a service artifact, and
nothing but the IAM holds Keto write access.

### Provisioning a resource

A service that creates a resource does not create the roles over it. It tells
the IAM the resource now exists and who its principals are, and the IAM
instantiates whichever parameterized roles the deployment defined over that
type.

```
POST /provision
{ "args": { "dfspId": "dfsp7" },
  "principals": { "admin": "<identity id>", "machine": "dfsp7" } }
```

A parameterized role declares which principal it is granted to when its
resource appears, which is deployment policy and so lives beside the grants:

```yaml
dfsp-operator:
  params: [dfspId]
  onProvision: admin       # the human who administers the resource
  grants: [...]
dfsp-client:
  params: [dfspId]
  onProvision: machine     # the resource's own machine client
  grants: [...]
```

The IAM instantiates every role whose parameters the arguments cover and whose
`onProvision` principal was supplied, then adds that principal to the
instance's members. A role without `onProvision` is never instantiated this
way; it waits for an explicit assignment.

A resource with no principals at all is ordinary. A report exists to be
granted rather than to be owned, and a resource type no parameterized role
covers still has to be offerable the day it appears, so provisioning always
records that the resource exists:

```
Resource:reports/dfspSettlement#exists@__registry__
```

That row grants nothing — its own namespace, a relation no rule checks, a
subject that is not a principal — and it is what lets the role UI offer a
report by name before anybody holds it. Deprovisioning removes it.

Deprovisioning removes those instances and answers with the subjects left
holding no role at all, so the caller can retire an identity that operates
nothing else without ever reading the graph itself.

This is the only reason a service ever talks to the IAM's write side, and it
still writes no tuple: it names a resource and its principals, and the IAM
decides what that means.

Evaluation is union over grants. There is no deny rule and no subtraction, so
access flowing through a role is revoked by editing the role or the
membership, and the UI shows the path each permission flows through.

### Separation of duties

Some permissions must not end up in one pair of hands, however many roles it
takes to get there: whoever moves funds must not also audit the moving. That
is a statement about two permissions and one person, not about a resource — it
holds in a deployment with a single participant, and neither grant is wrong on
its own.

```yaml
exclusions:
  - name: audit-exclusion
    a: [settlement.auditSettlement]
    b: [settlement.positionFundsInOut, settlement.positionNDCEdit]
```

Every pair across the two sides is refused. It is checked where a holding is
written and nowhere else. Applying a deployment's roles refuses one that
carries both sides, and reports every subject whose existing roles already
combine them; an assignment is refused when the roles the subject would then
hold reach both sides, naming the rule. A combination that is never written needs no check when a request
arrives, and a check there would report the problem to the person least able to
do anything about it.

The two grants typically arrive months apart from different administrators, so
the graph is the only place their union is ever visible. That is the whole
reason the platform holds this rather than a review process.

Rules are deployment data like roles: a deployment that declares none is never
refused anything. Refusing is all the platform does — it never revokes what is
already held, since deciding which half of a violation to take away is the
deployment's call.

Grant-level conditions do not exist. Every need raised so far decomposed into
a resource binding, an authenticator on the operation, or a service business
rule. If an irreducible case appears, the decision endpoint is the one place a
condition could be evaluated, and it gets priced against that concrete case.

## Resource names: one noun, many services

Services keep their own vocabularies. The same real-world thing is `widgets`
in one document, `components` in another, `parts` in a third, and the ids are
the same strings because they are the same thing. A deployment declares that
once:

```yaml
resourceNames:
  Component:
    label: Component
    members:
      - { service: example,   type: widgets }
      - { service: reporting, type: components }
      - { service: finance,   type: parts }
```

A grant binds a type per service, so a role covering all three writes
`example:widgets/c7`, `reporting:components/c7` and `finance:parts/c7`. What
the name adds is that an operator picks "Component: c7" once and the role UI
knows those three bindings are the same choice, rather than offering three
unrelated pickers over the same ids.

It is deployment data because no service can hold it. For `example` to say
its `widgets` are `reporting`'s `components`, it would have to know
`reporting` exists, which is the one thing a component may never know about
its peers. The deployment is the only layer that sees both.

The vocabulary is total, and composition checks it in both directions: every
type every service is about must appear here under some noun — a grantable
kind the deployment never named is a rollout that stops — and every member
here must be a type its service really is about, so a typo stops the rollout
instead of producing a picker whose choices bind nothing. A service arriving
while the deployment runs is held to the same rule: a new type it declares is
refused until the deployment names it.

The values an operator picks from are the registry the IAM already keeps:
provisioning records `Resource:<type>/<id>#exists` when a service creates a
resource, and `GET /resources?type=` answers from it. A deployment whose
authoritative list lives somewhere the platform is never told about — a
service that predates it, or one nobody can change — names it, and says what
comes back:

```yaml
    source:
      url: http://central-ledger/participants   # the listing, read in-cluster
      id: /name                # JSON Pointer to the id within each item
      list: /data/items        # optional: to the array; omitted, the body is the array
      label: /displayName      # optional: display text, for consumers that render rows
```

The pointers are RFC 6901, so `list: /data/items` and `id: /attributes/code`
reach into whatever shape the listing already answers with, and a bare array
of `{ name }` needs only `id: /name`. Nothing is inferred: a source whose
pointers do not resolve is a rollout that stops, because a syncer guessing at
a response shape would populate the picker with whatever it happened to find.

Each id the source lists is recorded under every member type of its noun,
which is the noun's own assertion: one real thing, one id, several spellings.
Sourced rows carry their own registry marker, `__source__` beside
provisioning's `__registry__`, so reconciling them can never remove a row a
service provisioned, and every reader of the registry accepts either.

Only the ids ever enter the platform: they are what grants bind, so they are
what the registry records. Everything else about a row is the owning service's
data, and a consumer that renders rows — a picker showing names beside ids —
reads them from that service through the gateway, under its own authorization.

The vocabulary itself is served whole at `GET /resource-names`: every noun
with its label, description, members and source, exactly as the deployment
declared it, for any consumer to take the fields it needs. A noun's `label`
and `description` are a string or a language-keyed map; the nouns are
deployment-invented, so the deployment is the only place their translations
can come from.

Provisioning calls it on an interval and writes the same registry rows a
service would have provisioned, so the picker still reads one place and a
resource can never be offered that no grant could be materialized against. A
listing that pages is out of scope: the operation must answer the whole set,
and one that cannot is a service that should provision its resources instead.

## What never ships in a service

No role, no tier, no persona, no named set of permissions. The litmus: if a
construct would force a deployment to take permissions it did not individually
choose, it is a role wearing the service's clothes, and it does not ship. This
is also why nothing a service ships can widen an existing grant on upgrade; a
new operation is held by nobody until a deployment grants it.

The catalog's browsing tree comes from the ids: service, then operation.
Purely presentational, derived, never grantable.

## The catalog

Derived, never authored. The generator emits it from the same intermediate
form as the rules, in the same run, so the two cannot describe different
permissions. Each entry carries the id, the relation, the summary, the method
and path, the declared resource types, the subset of those the path binds an
id for, and whether the operation is deprecated. The IAM aggregates every service's catalog and serves the result
to the role UI. A conformance check compares the rule ids the gateway actually
loaded against the catalog, which is what catches a stale artifact reaching a
cluster.

## Failure is always closed

An unmatched path is a 404 at the gateway. A payload that does not parse is a
denial. An unreachable Keto is a denial. A declared type with an empty visible
set is a denial. Two rules matching one request is a 500, which is why matches
are kept disjoint.

## Conformance, checked in CI

Every build verifies, against the service's API document and the generated
artifacts:

- `x-authz` carries only the four permitted keys, at the permitted levels
- every operation declares `security` explicitly, and every non-anonymous
  operation has a summary, since the summary is what a human reads in the role
  UI
- a typed document authors `x-authz.resourceTypes`, and it equals the set its
  operations use — a type one operation misspells fails the build naming the
  operation, a listed type nothing uses fails the same way
- a written `scopedBy` is explicit: a binding names a parameter the path has,
  and a bare type is one the path does not bind
- every type every document is about appears in the deployment's resource
  names. A service may be about a type it serves no route for — a reporting
  service returns participant rows while routing no `/participants` — which is
  why the deployment, the only level that sees every vocabulary, holds the map
- a GET returning an array whose path binds no resource id declares
  `scopedBy` explicitly, naming the row type or `[]`. This is the one place
  silence is dangerous rather than merely undeclared: such an operation
  returns rows that nothing scopes, and the gateway cannot tell a reference
  list from a tenant's data. Where the path does bind an id, containment
  already answers it and no declaration is required.
- permission ids are unique within a service and across the deployment
- every operation is covered by exactly one rule, no orphans in either
  direction, and all matches are mutually disjoint
- `allOf` checks appear in capture order, each index pointing at the capture
  group whose name matches its type
- `noop` appears only on anonymous routes
- shared `User` and `Role` declarations are byte-identical across services
- a throwaway Keto boots against the concatenated model and `GET /namespaces`
  lists every expected namespace, guarding the parser's silent-drop failure
  mode
- a functional probe grants a permission through a role and through `__all__`
  and expects both to pass, and asserts the resulting `X-Scope`

## Open decision

**Whether a permission can refuse `all`.** Some operations should never be
grantable over every resource at once, credential issuance being the standing
example. `__all__` is an ordinary object, so nothing currently prevents a
deployment from granting one. A refusal would have to be declared on the
operation and enforced by the IAM write path, which means a new `x-authz`
key, and it is the only candidate for one.
