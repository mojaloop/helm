# Dashboard Installation

## Grafana - Operational Dashboards

### Pre-requisites

- Refer to the following instructions for [Installing Prometheus and Grafana](../README.md)
- Ensure that you have created a Prometheus data source named `Prometheus` and set as `default`

### Instructions

Login to Grafana and create the following folders:
- `Mojaloop - Application`
- `Mojaloop - Datastore` 
- `Mojaloop - Messaging`
- `Mojaloop - Kubernetes`

Import the corresponding dashboards:

Application
- [ML API Adapter Dashboard](./mojaloop/dashboard-ml-adapter.json) 
- [Central Services Dashboard](./mojaloop/dashboard-central-services.json)
- [Central Services Characterization Dashboard](./mojaloop/dashboard-central-services-characterization.json)
- [NodeJS Application Dashboard](./mojaloop/dashboard-NodeJSApplication.json) 
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

## ElasticSearch

### Pre-requisites

- Refer to the following instructions for [Installing EFK - ElasticSearch FluendtD, Kabana & APM Monitoring for Mojaloop](../README.md)

### Instructions

Login to Kibana, navigate to `Management` screen, and select `Saved Objects`:
- Click `Import` button and select the [TransactionOverview.ndjson](./efkapm/TransactionOverview.ndjson) file.
- On `Dashboard` screen, select the `Transaction Overview` dashboard.

## JMeter

General JMeter Dashboard to visualize metrics captured by InfluxDB. These are used for Performance & Load Testing applications of the Mojaloop stack.

### Pre-requisites

- Runing InfluxDB, with connectivity to Grafana (see instruction below to install a scalable environment with JMeter, InfluxDB and Grafana)
- Refer to the following instructions for [Installing JMeter](../README.md)
- Ensure that your JMeter test scripts contains a [Backend Listener](https://jmeter.apache.org/usermanual/component_reference.html#Backend_Listener) using the `InfluxdbBackendListenerClient` implementation, with an appropriate configuration.

### Instructions

Login to Grafana and import the corresponding dashboards:
- [JMeter Metrics](./jmeter/dashboard-JMeterMetricTemplate.json)
- Run JMeter test scripts with the pre-configured Backend Listener, and monitor metrics
