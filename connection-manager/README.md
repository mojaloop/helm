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

| Parameter | Default | Description |
|-----------|---------|-------------|
| `db.host` | `localhost` | Hostname of database |
| `db.user` | `root` | Username for authenticating to database |
| `db.password` | `changeme` | Password for `db.user` |
| `db.schema` | `tsp` | Name of database table |
| `db.port` | `3306` | TCP port to connect to database |
| `api.url` | `https://localhost` | Base URL used by frontend to connect to the API server |

If `api.oauth.enabled` is set to `"TRUE"` then the following fields must also be configured.
And also `ui.oauth.enabled` must be set to `"TRUE"`

| Parameter | Default | Description |
|-----------|---------|-------------|
| `api.oauth.issuer` | `https://localhost/oauth2/token` | OAuth2 Token issuer |
| `api.oauth.key` | `mysecretkey` | OAuth2 Client Key |
| `api.oauth.secret` | `mysecret` | OAuth2 Client Secret |
| `api.oauth.resetPassword.issuer` | `https://localhost/scim2/Users` | OAuth2 Reset password issuer |
| `api.oauth.resetPassword.user` | `myuser` | OAuth2 Reset password operation user |
| `api.oauth.resetPassword.pass` | `changeme` | OAuth2 Reset password operation password |

To configure an MCM environment declaratively, rather than by calling the API after server start,
configure the following fields:

| Parameter | Default | Description |
| `api.env.name` | `null` | If specified, an environment with this name will be created before server start |
| `api.env.{cn,c,l,o,ou,st}` | `null` | X509 attributes for the environment. All optional. |

## Developer/Debugging Configuration

The following table lists further configuration parameters of the Connection Manager. These parameters should __not__ be edited during normal operations. They are provided to aid developement and debugging only.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `ui.disabled` | Not set | If set to `true` this disabled the UI frontend |
| `api.disabled` | Not set | If set to `true` this disables the API backend |
| `api.auth_enabled` | `"FALSE"` | Enables authentication to the API.  Set to `"TRUE"` to enable. __MUST__ be a string. Must have the same value of `ui.auth_enabled` __WARNING__ Disabling authentication increases the chance of a success attack on your deployment. |
| `ui.auth_enabled` | `"FALSE"` | Enables authentication to the UI. Must have the same value of `api.auth_enabled` It cannot be one enabled and the other don't |
| `imagePullPolicy` | `ifNotPresent` | Container pull policy |
| `ui.image.name` | foo | name of UI frontend Docker Image |
| `ui.image.version` | Chart version specific | The version of the UI frontend Docker Image |
| `api.image.name` | foo | Name of API backend Docker Image |
| `api.image.version` | Chart version specific | The version of the API bakcend Docker Image |
| `ui.ports.containerPort` | `8080` | port the UI frontend runs on |
| `ui.ports.nodePort` | foo | NodePort used by Kubernetes |
| `api.ports.containerPort` | `8080` | port the API backend runs on |
| `api.ports.nodePort` | foo | NodePort used by Kubernetes |

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
