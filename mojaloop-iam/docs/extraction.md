# Dozvil: the component's own identity

The generic authorization operator carries a name of its own, **Dozvil**, so it
can graduate out of Mojaloop later the way Envoy left Lyft and Prometheus left
SoundCloud. A component named `mojaloop-authz` could never leave; a component
named Dozvil moves from `mojaloop/dozvil` to `dozvil/dozvil` with no rename, no
broken links and no re-education of its users.

Дозвіл is Ukrainian for *permission* — the thing the system issues. Mojaloop is
itself Swahili (*moja*, one), so a name from another language is the
foundation's own convention rather than a departure from it. Kubernetes is Greek
for helmsman, Istio is Greek for sail, Kyverno is Greek for govern.

## What is claimed

| Surface | State |
| --- | --- |
| `dozvil.io` | held |
| npm `dozvil` | published, `0.1.0` |
| npm org `@dozvil` | held, owner `kirgene` |
| GitHub org `dozvil` | held, no repos |
| `dozvil.com` | held by a domain broker, listed near $400, optional |

The npm claim is a package that functions rather than a placeholder, because
npm's terms treat a package published only to reserve a name as squatting and
remove it on complaint. The GitHub org is under the same rule and needs a repo
in it — a `dozvil/.github` profile README satisfies that.

## The published package

`~/mojaloop/dozvil/` holds `dozvil@0.1.0`: a CLI that reads the authorization
surface a document declares.

```
npx dozvil validate ./openapi.yaml
```

It is `cli.js` (51 lines) over a copy of `packages/authz/document.js` (221
lines, unchanged, Apache-2.0, needs only `yaml`). It prints the service, every
operation with its permission and `scopedBy` scopes, and exits 1 when a document
cannot be read — so it gates CI as it stands. It exists to hold the name
honestly and is replaced by the real package at extraction.

## What extraction costs

Twelve references to the consumer exist in `ml-iam-services/src`, which is the
whole reason extraction is cheap:

**Identity, six lines.** `cli.ts:31` (command name and description),
`iam/api.yaml:3` and `decision/api.yaml:3` (document titles), `cluster.ts:95`
and `cluster.ts:118` (`managed-by` labels), plus the name in `package.json`.

**The CRD API group, one line.** `cluster.ts:34` declares `group: 'mojaloop.io'`.
Kubernetes convention is an API group on a DNS domain you control, so this
becomes `dozvil.io`. Changing it renames the `AuthzDocument` CRD's API group,
which means the CRD and every existing custom resource are recreated — the only
part of the extraction that touches a running cluster.

**Import paths, four lines.** `@mojaloop/authz/document` in `derive.ts`,
`@mojaloop/authz/gateway` in `decision/server.ts` and `decide.ts`, and
`@mojaloop/authz/document` in `operator/server.ts`. These follow the client
guard package when it is renamed.

**Comments, two lines.** `reconcile.ts:44` and `compose.ts:47` use DFSP and
`dfsp1` as examples. Consumer vocabulary in a generic component; replace with
neutral examples.

Nothing else in the tree knows who deploys it.

## What is not done

The proposal to the foundation has not been written or raised. Until it is:

- Do not rename anything in `ml-iam-services`. The name is claimed externally,
  not adopted internally, and renaming first presents the governance decision as
  already made.
- Do not publish further packages under the name.
- The repo stays `mojaloop/ml-iam-services`.

The proposal needs to carry four things: that the operator is generic
infrastructure (the twelve references above are the evidence), that it extracts
to `mojaloop/dozvil` with a deliberately non-Mojaloop identity so it can
graduate, why the name is Dozvil, and that Yevhen Kyriukha is named creator and
lead maintainer.

The foundation owns the work. Graduation means the project moving to its own
org or foundation, not to private ownership; `dozvil.io` is held with the intent
to transfer on adoption, and the proposal should say so.
