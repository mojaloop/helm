# Mojaloop-TTK-Simulators Helm Chart

Helm Chart for deploying Simulators that are based on an [SDK-Scheme-Adapter](https://github.com/mojaloop/sdk-scheme-adapter) with a [Testing-Toolkit](https://github.com/mojaloop/ml-testing-toolkit) backend.

## Overview

N/A

## Sub-Charts

- [chart-sim1](./chart-sim1) - Test FSP Sim1
- [chart-sim2](./chart-sim2) - Test FSP Sim2
- [chart-sim3](./chart-sim3) - Test FSP Sim3

## Deployment

### Pre-requisites

The following-backend dependencies are required for each of the following services.

1. Kafka - used as a persistent state store, and for correlating async-to-sync requests/responses using the pub-sub mechanisms.

   An example for installing the [Bitnami Kafka Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/kafka) can be done as follows:

   ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm -n <DESTINATION_NAMESPACE> install <KAFKA_INSTALL_NAME> bitnami/kafka --set persistence.enabled=false --set zookeeper.persistence.enabled=false
   ```

   _IMPORTANT: The above command includes config changes to deploy a single instance with disable persistence, etc which is not recommended for Production grade installations. Please refer to the [Bitnami Kafka values.yaml](https://github.com/bitnami/charts/blob/master/bitnami/kafka/values.yaml) for available configuration parameters._

2. Redis - used for pub-sub all Domain and Command events.

   An example for installing the [Bitnami Redis Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/redis) can be done as follows:

   ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm -n <DESTINATION_NAMESPACE> install <REDIS_INSTALL_NAME> bitnami/redis --set architecture=standalone --set master.persistence.enabled=false --set auth.enabled=false
   ```

   _IMPORTANT: The above command includes config changes to deploy a single instance with disable persistence, etc which is not recommended for Production grade installations. Please refer to the [Bitnami Redis values.yaml](https://github.com/bitnami/charts/blob/master/bitnami/kafka/values.yaml) for available configuration parameters._

Ensure that you configure the appropriate configurations to match the above in the [values.yaml](./values.yaml):

   ```yaml
   global:
     kafka:
       host: <KAFKA_INSTALL_NAME>-kafka
       port: 9092

     redis:
       host: <REDIS_INSTALL_NAME>-redis-master
       port: 6379
   ```

Or alternatively one can install the chart by adding the following `--set` parameters:

   ```bash
   helm <NAMESPACE> install <INSTALL_NAME> . --set global.kafka.host=<KAFKA_INSTALL_NAME>-kafka --set global.redis.host=<REDIS_INSTALL_NAME>-redis-master
   ```
#### Helm

The [Example-Mojaloop-Backend](../example-mojaloop-backend/README.md) can be used to deploy the necessary backends as follows:

```bash
helm -n moja3 install backend ./example-mojaloop-backend --set "centralledger-mysql.enabled=false" --set "account-lookup-mysql.enabled=false" --set "centralledger-obj.enabled=false" --set "cep-mongodb.enabled=false" --set "kafka-console.enabled=false" --set "ttksims-redis.enabled=true" --set "kafka.enabled=true"
```

_Note: Take note that all the unnecessary backends are disabled in the above example command, except for Kafka and Redis_

### Validation

#### Helm

Ensure you enable the following value configs are set when deploying via the main [Mojaloop Helm Chart](../mojaloop/Chart.yaml):

- mojaloop-bulk.enabled: true <-- Enables deployment of core Mojaloop Bulk Services
- mojaloop-ttk-simulators.enabled: true <-- Enables deployment of TTK-based SIMs
- ml-ttk-test-val-bulk.tests.enabled=true <-- Handles standard Bulk Test-case collection
- ml-ttk-test-setup-sdk-bulk.tests.enabled=true <- Handles provisioning of TTK-based SIMs
- ml-ttk-test-val-sdk-bulk.tests.enabled=true <-- Handles the Functional Validation of the SDK Bulk Test-case collection

This can either be set as a parameter when running the `helm install` command line, or set directly on a customized [../mojaloop/values.yaml](../mojaloop/values.yaml) file.

#### Manual

<!-- TODO: UPDATE TO POINT TO MASTER BRANCH -->
- Open TTK UI for SIM1 on http://ttksim1.ttk1.test.mojaloop.live/admin/outbound_request
- Open TTK UI for SIM2 for monitoring the inbound requests as receiver http://ttksim2.ttk1.test.mojaloop.live/admin/monitoring
- Download the following test cases
  https://github.com/mojaloop/sdk-scheme-adapter/blob/mvp/feat/%232809-local-end-to-end-func-tests/test/func/ttk-testcases/bulk-happy-path.json
- Import the test cases in TTK SIM1
- Edit the first test case `TC-BHP1. Happy Path`
- Goto `Editor` tab on each request and deselect the checkbox `Override with Custom URL`
- Run the test cases by clicking on the `Send` button at the top right corner
- You should see all tests passed
