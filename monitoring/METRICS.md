# Metrics for Mojaloop

## Prometheus Metrics for Mojaloop

Mojaloop transaction metrics that have been instrumented through Prometheus:


| Metric        | Type (e.g. Quotes, Transfers, etc)          | Description  | Labels  |
| ------------- | ------------- | ----- | ----- |
| moja_tx_transfer | Transfers | Mojaloop financial transfer transaction representing the end-to-end transfer (receiving transfer prepare, and sending out the final notification on fulfilment) | serviceName, success |
| moja_tx_transfer_prepare | Transfers | Mojaloop financial transfer transaction representing the end-to-end transfer for Prepare leg (receiving transfer prepare, and sending out the prepare notification) | serviceName, success  |
| moja_tx_transfer_fulfil | Transfers | Mojaloop financial transfer transaction representing the end-to-end transfer for Fulfil leg (receiving transfer fulfiment, and sending out the fulfil notification) | serviceName, success  |
| moja_notification_event_delivery | Transfers | Notification delivery, resonse codes (result), error rates & error codes | serviceName, success, status, action  |

Mojaloop component metrics that have been instrumented through Prometheus:

| Metric        | Component           | Description  | Labels  |
| ------------- | ------------- | ----- | ----- |
| moja_transfer_prepare | ML-API-Adapter | Produce a transfer prepare message to transfer prepare kafka topic | serviceName, success |
| moja_transfer_fulfil | ML-API-Adapter | Produce a transfer fulfil message to transfer fulfil kafka topic | serviceName, success  |
| moja_notification_event | ML-API-Adapter | Consume a notification message from the kafka topic and process it accordingly | serviceName, success, action, type  |
| moja_transfer_prepare | Central-Ledger | Consume a prepare transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_transfer_position | Central-Ledger | Consume a prepare transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_transfer_fulfil | Central-Ledger | Consume a fulfil transfer message from the kafka topic and process it accordingly | serviceName, success, fspId  |
| moja_sim_request | Simulator | Histogram for http operation | success, fsp, operation, source, destination  |
