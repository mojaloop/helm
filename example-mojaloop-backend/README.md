# Example Mojaloop Backend

| Note: This is Helm Wrapper chart should be used purely as an example to deploy External Backend dependencies for Mojaloop for local developer and PoC environments.
| It is strongly recommended that all External Backend Dependencies should be deployed independently, and managed as such with regard to their maintenance (i.e. upgrades, etc)

## Pre-requisites

Run `helm dep up .`

Or run the [update-charts-dep.sh](../update-charts-dep.sh) from the root folder.

## Installation

### Backends

```bash
helm -n mojaloop install backend ./example-mojaloop-backend
```

Or from the Helm repo:

```bash
helm -n mojaloop install backend mojaloop/example-mojaloop-backend
```

## Mojaloop Configuration

The default CONFIG header section on the [mojaloop/values.yaml](../mojaloop/values.yaml) header has been configured to work with the backend dependencies deployed by this Helm wrapper chart.

Several backends are shared between services, specifically:

- MySQL - Specific Database are created to isolate the schemas for each service, however the same common password is used for convenience.
- Kafka - No special configuration are made here.
- Redis
  - ttksims - A unique namespace is used for each TTK Simulator to isolate the key-space.

It includes backends for the following services:


|  Chart   |  Dependency   |  Notes   |
| --- | --- | --- |
|  Account-Lookup-Service   |  MySQL   |     |
|   Quoting-Service  |  MySQL   |     |
|  ML-API-Adapter   |  Kafka   |     |
|  Central-Ledger  |   Kafka, MySQL, MongoDB  |     |
|  Central-Settlements   |  MySQL   |     |
|  Central-Event-Processor   |  Kafka, MongoDB   |     |
|  Transaction-Request-Service   |   N/A  |     |
|  Thirdparty Auth-Service   |   Redis, MySQL  |     |
|   Thirdparty Consent Oracle  |   MySQL  |     |
|  Thirdparty SDK  |   N/A  |     |
|  Simulator   |   N/A  |     |
|   Mojaloop-Simulator  |  N/A   |   There is a dependency on Redis, however due to the dynamic nature of the Mojaloop-Simulator, a Redis container will be created dynamically for each configured Simulator.  |
|  Mojaloop-Testing-Toolkit   |   MongoDB  |     |
|  Mojaloop-TTK-Simulators   |   Redis, MongoDB  |     |
|  SDK-Scheme-Adapter   |   N/A  |  There is a dependency on Redis, however this chart is not deployed directly, but rather used in wrappers like the Mojaloop-TTK-Simulators.   |
|   Bulk-API-Adapter  |   Kafka, MongoDB  |     |
|     |     |     |
