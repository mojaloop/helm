# mojaloop-common

Shared templates for Mojaloop Helm charts.

## Installation

```yaml
# Chart.yaml
dependencies:
  - name: mojaloop-common
    version: 0.1.0
    repository: https://mojaloop.github.io/helm/repo
```

Charts maintained in the Mojaloop helm repository reference it with
`repository: file://../mojaloop-common`.

## Access control

Render the service's route with the shared template:

```yaml
# templates/httproute.yaml
{{ include "mojaloop-common.httproute" (dict "context" . "fullname" (include "my-service.fullname" .)) }}
```

```yaml
# values.yaml
authz:
  service: ""       # the permission prefix, set by the deployment
```

The route is protected when the deployment turns the IAM on
(`global.iam.enabled`) and sets `authz.service`.

For a user interface, also set `operationId`, `title` and `summary` under
`authz`; access to the UI is then a single permission.

## Other templates

- Liveness and readiness probes
- Init containers that wait for Kafka, MongoDB or MySQL
