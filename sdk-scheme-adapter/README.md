# SDK-Scheme-Adapter Helm Chart

Helm Chart for the [SDK-Scheme-Adapter](https://github.com/mojaloop/sdk-scheme-adapter) service.

## Overview

The [SDK-Scheme-Adapter](https://github.com/mojaloop/sdk-scheme-adapter) provides an interoperable connector (i.e. a Mojaloop-Connector) hosted by a DFSP (Digital Financial Service Provider) between the DFSP's Backend and the Mojaloop Switch, simplifying API interactions for synchronous request-response patterns.

It compromises of three distinct micro-services:

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

1. Redis - used as a persistent state store, and for correlating async-to-sync requests/responses using the pub-sub mechanisms.
2. Kafka - used for pub-sub all Domain and Command events.

<!-- TODO: provides instructions on how to deploy/configure -->

### Validation

Not available at this time.
