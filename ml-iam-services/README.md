# ml-iam-services

The Mojaloop IAM's own processes, one image run three ways:

| process | kind | reached by |
|---|---|---|
| `decision` | Deployment, `<fullname>-decision` | Oathkeeper, on every request |
| `controller` | Deployment, `<fullname>-controller`, and the Lease of the same name | the api; the API server on its admission port; its own replicas |
| `api` | Deployment, `<fullname>-api` and `<fullname>-api-internal` | people through the gateway; the provisioning authority, on the internal port, as `networkPolicy.internalCallers` names it |

Every controller replica composes and answers admission. The one holding the
`<fullname>-controller` Lease is the single writer of grants and memberships;
the others hand it the writes they receive and the composition the api reads.
A replica that stops releases the lease, so another takes it the moment it
changes; one that dies is replaced once the lease lapses.

The controller composes every keyed route's document, applies the
deployment's `AuthzRole`, `AuthzSeparation` and `AuthzResourceName` objects,
answers admission for the IAM's kinds and records the IAM's own roles and
permissions under `authz.service`. The api serves the public API on the route
below and the internal API to the callers `networkPolicy.internalCallers`
names.

## Values

| value | meaning |
|---|---|
| `gateway.*` | the api's public route: host, parentRefs, CORS, the Oathkeeper decision API |
| `authz.service` | the permission prefix the IAM's own operations answer under; required with the route |
| `controller.publishAs` | the ConfigMap the composed gateway rules and Keto model are published as |
| `controller.webhook.enabled` | admission for the IAM's kinds, with a cert-manager self-signed certificate |
| `controller.replicaCount`, `controller.pdb` | the controller's replicas, of which one writes |
| `controller.lease.*` | how the lease is held: its duration, how long a leader writes without a renewal landing, how often it renews; each value cites the measurement it comes from |
| `networkPolicy.gateway` | gateway proxy pods admitted to the public port |
| `networkPolicy.internalCallers` | pods admitted to the internal port |
| `networkPolicy.oathkeeper` | pods admitted to the decision endpoint |
| `<process>.env` | Keto, Kratos and Hydra addresses and ports |

The network rules are Admin-tier `ClusterNetworkPolicy` objects
(`policy.networking.k8s.io/v1alpha2`); the cluster needs that API.

## What outlives an uninstall

The controller writes two ConfigMaps in its namespace that the release does
not own, and an uninstall leaves both:

- `<fullname>-composition`, the composition's announcement the api reads,
  written again on the controller's next start;
- `<fullname>-history`, every permission ever composed, which tells a renamed
  permission from a removed one. It survives a reinstall so that a rename is
  still recognised across it.

Delete them by hand only to start the IAM over from nothing.
