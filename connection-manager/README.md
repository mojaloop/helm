# Connection Manager

Connection Manager simplifies a DFSP connecting to a Mojaloop Hub.

One of the largest challenges that faces any DFSP is connecting to the Hub, then installing and maintaining the certificates required to connect to and validate other DFSPs. Connection Manager from ModusBox aims to simplify that whole process by providing a pre-configured environment that has already tested:

- End Points for Connectivity - automatically configured and negotiated with the Hub
- Key Exchange and Management for connectivity to the Hub and Other DFSPs
  - JWS
  - X509
  - ILP Condition management

## Configuration

The following table lists the parameters you are expected to edit for your deployment of the Connection Manager.

### Database Configuration

| Parameter | Default | Description |
|-----------|---------|-------------|
| `db.host` | `localhost` | Hostname of database |
| `db.user` | `mcm` | Username for authenticating to database |
| `db.password` | `changeme` | Password for `db.user` (use `db.passwordSecret` for production) |
| `db.passwordSecret` | - | Secret name containing database password |
| `db.passwordSecretKey` | - | Key in secret containing database password |
| `db.schema` | `mcm` | Name of database schema |
| `db.port` | `3306` | TCP port to connect to database |
| `db.sslEnabled` | `false` | Enable SSL for database connection |

### API Configuration

| Parameter | Default | Description |
|-----------|---------|-------------|
| `api.url` | `https://localhost` | Base URL for API ingress |
| `api.switchFQDN` | `switch.example.com` | FQDN of the Mojaloop switch |
| `api.switchId` | `dummySwitchId` | Identifier for the switch |

### IAM

MCM uses the IAM only when `global.iam.enabled` is on: it records each DFSP it
onboards, creates its accounts and machine client, and assigns their roles
through the IAM's internal API. Its routes key their backends for the IAM and
carry the ExternalAuth filter under the same switch.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `global.iam.enabled` | - | Use the IAM |
| `global.iam.provisioningUrl` | - | The IAM's internal API, required with the IAM on |
| `iam.autoCreateAccounts` | `true` | Create the DFSP's accounts and machine client at onboarding |
| `iam.dfspClientAudience` | `connection-manager-api` | Audience the DFSP's machine client is issued tokens for |
| `iam.dfspResourceName` | - | The deployment's resource name for a DFSP |
| `iam.dfspAdminRole` | - | Role the invited DFSP admin is assigned over the DFSP |
| `iam.dfspClientRole` | - | Role the DFSP's machine client is assigned over the DFSP |
| `api.authz.service` | - | Permission prefix the API route keys its backend under |
| `ui.authz.service` | - | Permission prefix the UI route keys its backend under |

## Developer/Debugging Configuration

The following table lists further configuration parameters of the Connection Manager. These parameters should __not__ be edited during normal operations. They are provided to aid development and debugging only.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `ui.disabled` | `false` | If set to `true` this disables the UI frontend |
| `api.disabled` | `false` | If set to `true` this disables the API backend |
| `imagePullPolicy` | `IfNotPresent` | Container image pull policy |
| `ui.image.name` | `mojaloop/connection-manager-ui` | Name of UI frontend Docker Image |
| `ui.image.version` | `v1.10.0` | The version of the UI frontend Docker Image |
| `api.image.name` | `mojaloop/connection-manager-api` | Name of API backend Docker Image |
| `api.image.version` | `v3.0.2` | The version of the API backend Docker Image |
| `ui.ports.containerPort` | `8080` | Port the UI frontend runs on |
| `ui.ports.nodePort` | `31627` | NodePort used by Kubernetes |
| `api.ports.containerPort` | `3001` | Port the API backend runs on |
| `api.ports.nodePort` | `31057` | NodePort used by Kubernetes |
| `api.ports.metricsServerPort` | `9100` | Port for metrics server |

## Updating this Chart

There are 2 reasons to update this chart:

1. There is a new version of one of the microservices used by this chart
2. There is an edit needed for this chart

For either case please follow the below process.

### New Microservice Version

Using standard new feature process update the following files:

- [values.yaml](values.yaml)
  - Edit either `api.image.version` or `ui.image.version` with the latest version
- [Chart.yaml](Chart.yaml)
  - Increment `appVersion` as appropriate
  - Increment `version`

Updates to `version` are to be done in the following manner:

- Increment the patch level if no changes to the Chart is needed
- Increment the minor level if a new field is added to the Chart
- Increment the major level if any field is removed

### Edit the Chart

Using standard new feature process update the Chart as necessary. Then update the `version` field in [Chart.yaml](Chart.yaml).

Updates to `version` are to be done in the following manner:

- Increment the patch level if no changes to the Chart is needed
- Increment the minor level if a new field is added to the Chart
- Increment the major level if any field is removed
