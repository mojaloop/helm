# Example Mojaloop Backend

| Note: This is Helm Wrapper chart should be used purely as an example to deploy External Backend dependencies for Mojaloop for local developer and PoC environments.
| It is strongly recommended that all External Backend Dependencies should be deployed independently, and managed as such with regard to their maintenance (i.e. upgrades, etc)

## Pre-requisites

Run `helm dep up .`

Or run the [update-charts-dep.sh](../update-charts-dep.sh) from the root folder.

## Installation

### Backends

```bash
helm -n mojaloop install backend .
```

## Mojaloop Configuration

Ensure you modify the CONFIG section on the [mojaloop/values.yaml](../mojaloop/values.yaml) header by commenting out the sections under `FOR default` and uncommenting the lines under `FOR example-mojaloop-backend`.

And ensure that all backends are disabled [mojaloop/values.yaml](../mojaloop/values.yaml):

- `central.centralledger.mysql.enabled=false`
- `central.centralledger.kafka.enabled=false`
- `account-lookup-service.mysql.enabled=false`
- `centraleventprocessor.mongodb=false`
- `mojaloop-bulk.mongodb.enabled=false`

This can be set by using the `--set` parameter when running the `helm install` command:

```bash
helm install moja ./mojaloop --set "central.centralledger.mysql.enabled=false" --set "central.centralledger.kafka.enabled=false" --set "account-lookup-service.mysql.enabled=false" --set "centraleventprocessor.mongodb=false" --set "mojaloop-bulk.mongodb.enabled=false"
```
