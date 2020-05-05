# Log Monitoring for Mojaloop

**What?**
- **ElasticSearch**: Elasticsearch is a distributed, RESTful search and analytics engine. 
- **FluentD**: Open source data collector for unified logging layer, with ingestions into Elasticsearch.
- **Kibana**: Kibana lets you visualize your Elasticsearch data and navigate the Elastic Stack.
- **APM**: Application Performance Monitoring lets you visualize your Tracing information.

**Why?**
- Central location and storage of all Mojaloop log files
- Management of log data (persistence, long-term storage, etc)
- Management of alert/events based on log data
- Assist with tracing & trouble shooting Mojaloop’s distributed micro-service logs
- Produces real-time metrics or alerts to Prometheus
- Provides Tracing monitoring and visualization

## EFK Installation

### 1. Installation

Ensure that you have setup the Mojaloop Helm repository: `helm repo add mojaloop http://mojaloop.io/helm/repo/`

#### 1.1. Install Helm Chart: 

`helm install --namespace=logging --name=efk mojaloop/efk -f values.yaml`

__Where the values.yaml is the respective values file for the stable/grafana chart__

___Important: Do not change the name above. If you do so please create your own values.yaml file for the efk chart and update it accordingly.___

___Note: Please ensure that you configure the Ingress for Kibana as required in the values.yaml.___

___Note: Target namespace in the above command can be changed as required.___

### 2. Kibana Setup

1. Create Index pattern
    - Click "Discover" on the top left
    - Enter `fluentd*`, then click `Next step`
    - Select `@timestamp` from the drop down, then click `Create index pattern`

### 3. Custom Dashboard



## Known issues

1. **Warning:** Kibana does not have an authentication mechanism. To be addressed in future. It is not recommended that you expose this through Ingress publicly.
 