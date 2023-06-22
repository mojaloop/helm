# Example Mojaloop Backend

| Note: This is Helm Wrapper chart should be used purely as an example to deploy External Backend dependencies for Mojaloop for local developer and PoC environments.
| It is strongly recommended that all External Backend Dependencies should be deployed independently, and managed as such with regard to their maintenance (i.e. upgrades, etc)

## Pre-requisites

### Configure remote Mojaloop Helm repo on your Helm Client

Ensure that you [add the published repo to your Helm client](../README.md#configure-remote-mojaloop-helm-repo-on-your-helm-client) prior to running the above command.

### Setup local GIT repo

Run `helm dep up .`

Or run the [update-charts-dep.sh](../update-charts-dep.sh) from the root folder.

## Installation

### Backends

from the published Helm repo:

```bash
helm -n mojaloop install backend mojaloop/example-mojaloop-backend
```

## Mojaloop

The default CONFIG header section on the [mojaloop/values.yaml](../mojaloop/values.yaml) header has been configured to work with the backend dependencies deployed by this Helm wrapper chart.

Several backends are defined as follows:

|  Backend   |  Description   |  Notes   |
| --- | --- | --- |
|  MysqlDb   |  Shared MySQL server   |  Specific Databases are created to isolate the schemas for each service, however the same common password is used for convenience.   |
|  Kafka  |  Shared Kafka server   |     |
|  cl-mongodb   |  MongoDB Object Store by the Bulk-API-Adapter, Central-Ledger for Bulk Processing   |     |
|  cep-mongodb   |  MongoDB Object Store used by the Central-Event-Processor   |     |
|  ttk-mongodb   |  MongoDB Object Store used by the Mojaloop Testing Toolkit (TTK)   |     |
|  ttksim-redis   |  Shared Redis instance for TTK based Simulators   |     |
|  auth-svc-redis   |  Redis instance for the Thirdparty Auth-Service   |     |
|     |     |     |
