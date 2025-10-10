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
| `api.clientUrl` | `http://localhost:3000/` | MCM UI URL for CORS and redirects |
| `api.switchFQDN` | `switch.example.com` | FQDN of the Mojaloop switch |
| `api.switchId` | `dummySwitchId` | Identifier for the switch |

### Authentication Configuration (Keycloak)

To enable Keycloak authentication, set `api.keycloak.enabled` to `true` and configure:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `api.keycloak.enabled` | `false` | Enable Keycloak authentication |
| `api.keycloak.baseUrl` | `http://localhost:8080` | Keycloak server base URL |
| `api.keycloak.discoveryUrl` | - | OIDC discovery URL |
| `api.keycloak.adminClientId` | `connection-manager-api-service` | Keycloak admin client ID |
| `api.keycloak.adminClientSecret` | `changeme` | Admin client secret (use secret reference for production) |
| `api.keycloak.dfspsRealm` | `dfsps` | Keycloak realm for DFSPs |
| `api.keycloak.autoCreateAccounts` | `true` | Auto-create user accounts |

### Authorization Configuration (Keto)

To enable Keto authorization, set `api.keto.enabled` to `true` and configure:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `api.keto.enabled` | `false` | Enable Keto authorization |
| `api.keto.writeUrl` | `http://localhost:4467` | Keto write API URL |

### OpenID Connect Configuration

To enable OpenID Connect, set `api.openid.enabled` to `true` and configure:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `api.openid.enabled` | `false` | Enable OpenID Connect |
| `api.openid.clientId` | `connection-manager-auth-client` | OIDC client ID |
| `api.openid.clientSecret` | `changeme` | OIDC client secret (use secret reference for production) |

## Developer/Debugging Configuration

The following table lists further configuration parameters of the Connection Manager. These parameters should __not__ be edited during normal operations. They are provided to aid development and debugging only.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `ui.disabled` | `false` | If set to `true` this disables the UI frontend |
| `api.disabled` | `false` | If set to `true` this disables the API backend |
| `imagePullPolicy` | `IfNotPresent` | Container image pull policy |
| `ui.image.name` | `ghcr.io/pm4ml/connection-manager-ui` | Name of UI frontend Docker Image |
| `ui.image.version` | `1.8.4` | The version of the UI frontend Docker Image |
| `api.image.name` | `docker.io/infitx/connection-manager-api` | Name of API backend Docker Image |
| `api.image.version` | `v2.14.0` | The version of the API backend Docker Image |
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
