# Metrics for Mojaloop

## Prometheus Metrics for Mojaloop

Mojaloop metrics that have been instrumented through Prometheus:
 

| Metric        | Component           | Description  | Labels  |
| ------------- | ------------- | ----- | ----- |
| moja_transfer_prepare | ML-API-Adapter | Produce a transfer prepare message to transfer prepare kafka topic | serviceName, success |
| moja_transfer_fulfil | ML-API-Adapter | Produce a transfer fulfil message to transfer fulfil kafka topic | serviceName, success  |
| moja_notification_event | ML-API-Adapter | Consume a notification message from the kafka topic and process it accordingly | serviceName, success  |
| moja_transfer_prepare | Central-Ledger | Consume a prepare transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_transfer_position | Central-Ledger | Consume a prepare transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_transfer_fulfil | Central-Ledger | Consume a fulfil transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_sim_http_request | Simulator | Histogram for http operation | success, fsp, operation, source, destination  |

