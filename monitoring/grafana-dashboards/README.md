# Grafana Dashboard Installation

## Pre-requisites

- Refer to the following instructions for [Installing Prometheus and Grafana](../README.md)
- Ensure that you have created a Prometheus data source named `Prometheus` and set as `default`

## Instructions

Login to Grafana and create the following folders:
- `Mojaloop - Application`
- `Mojaloop - Datastore` 
- `Mojaloop - Messaging`

Import the corresponding dashboards:

Application
- [Central Services Dashboard](./grafana-dashboards/mojaloop/dashboard-central-services.json)
- [ML API Adapter Dashboard](./grafana-dashboards/mojaloop/dashboard-ml-adapter.json) 
- [Simulator Dashboard](./grafana-dashboards/mojaloop/dashboard-simulators.json) 

Datastore
- [MySQL Overview](./grafana-dashboards/datastore/dashboard-MySQL%20Overview.json)
- [PXC Galera Overview](./grafana-dashboards/datastore/dashboard-PXC_Galera%20Cluster%20Overview.json)
- [PXC Galera Graphs](./grafana-dashboards/datastore/dashboard-PXC_Galera%20Graphs.json)

Messaging
- [Kafka Cluster Overview](./grafana-dashboards/messaging/dashboard-Kafka%20-%20Cluster%20Overview.json)
- [Kafka Topic Overview](./grafana-dashboards/messaging/dashboard-Kafka%20-%20Topic%20Overview.json)
