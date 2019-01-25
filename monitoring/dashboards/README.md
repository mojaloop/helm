# Grafana Dashboard Installation

## Pre-requisites

- Refer to the following instructions for [Installing Prometheus and Grafana](../README.md)
- Ensure that you have created a Prometheus data source named `Prometheus` and set as `default`

## Instructions

Login to Grafana and create the following folders:
- `Mojaloop - Application`
- `Mojaloop - Datastore` 
- `Mojaloop - Messaging`
- `Mojaloop - Kubernetes`

Import the corresponding dashboards:

Application
- [Central Services Dashboard](./mojaloop/dashboard-central-services.json)
- [ML API Adapter Dashboard](./mojaloop/dashboard-ml-adapter.json) 
- [Simulator Dashboard](./mojaloop/dashboard-simulators.json) 

Datastore
- [MySQL Overview](./datastore/dashboard-MySQL%20Overview.json)
- [PXC Galera Overview](./datastore/dashboard-PXC_Galera%20Cluster%20Overview.json)
- [PXC Galera Graphs](./datastore/dashboard-PXC_Galera%20Graphs.json)

Messaging
- [Kafka Cluster Overview](./messaging/dashboard-Kafka%20-%20Cluster%20Overview.json)
- [Kafka Topic Overview](./messaging/dashboard-Kafka%20-%20Topic%20Overview.json)

Kubernetes:
- [Clusters](./kubernetes/Kubernetes%20Cluster.json)
- [Deployments](./kubernetes/Kubernetes%20Deployment.json)
