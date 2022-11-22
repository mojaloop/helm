# SDK-Scheme-Adapter Helm Chart

Helm Chart for the [SDK-Scheme-Adapter](https://github.com/mojaloop/sdk-scheme-adapter) service.

## Overview

The [SDK-Scheme-Adapter](https://github.com/mojaloop/sdk-scheme-adapter) provides an interoperable connector (i.e. a Mojaloop-Connector) hosted by a DFSP (Digital Financial Service Provider) between the DFSP's Backend and the Mojaloop Switch, simplifying API interactions for synchronous request-response patterns.

It comprises of three distinct micro-services:

1. API-SVC - The standard SDK-Scheme-Adapter offering two APIs
   1. Outbound - API used by the DFSP's Backend to make outgoing requests
   2. Inbound - API used for receiving incoming requests from a Mojaloop Switch
2. Outbound-Domain-Event-Handler - Handles and reacts to any Domain Events - Optional, required for Bulk-Transacts.
3. Outbound-Command-Event-Handler - Process any Command Events - Optional, required for Bulk-Transactions.

## Sub-Charts

- [chart-service](./chart-service/) - Template Service to use for all SDK-Scheme-Adapter deployments

## Deployment

### Pre-requisites

The following-backend dependency are required for each of the following services.

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

### Validation

Not available at this time.
