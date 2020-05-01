# Prometheus & Grafana Monitoring for Mojaloop

**What?**
- **Prometheus**: Leading open-source instrumentation solution for monitoring
- **Grafana**: The open platform for beautiful analytics and monitoring

**Why?**
- Metric Instrumentation for Mojaloop
- Low overhead on nodejs (histograms + pull metric end-point)
- Real-time metric visualization for Performance and Health monitoring of the Mojaloop Stack

## Mojaloop Prometheus & Grafana Installation

### 1. Installation

Ensure that you have setup the Mojaloop Helm repository: `helm repo add mojaloop http://mojaloop.io/helm/repo/`

#### 1.1. Install Helm Chart: 

`helm install --namespace=monitoring --name=promfana mojaloop/promfana`

___Note that you are welcome to change the target namespace in the above command as required.___

#### 1.2. Configure Network Policy to allow for all Ingresses into the your Mojaloop environment from the Internal K8s Network:

Run the following command, taking note that the following parameters will need to be changed: `$NAME_SPACE`, `$IP_RANGE`
```YAML
    cat <<EOF | kubectl create -f -
    apiVersion: extensions/v1beta1
    kind: NetworkPolicy
    metadata:
      name: hn-nodes-custom
      namespace: $NAME_SPACE
    spec:
      ingress:
      - from:
        - ipBlock:
            cidr: $IP_RANGE
      podSelector: {}
      policyTypes:
      - Ingress
     EOF
``` 

Parameters that you will need to be configured:

1. Update the `$NAME_SPACE` to match your target Mojaloop namespace. Specifically the namespace where you have deployed Mojaloop.
2. Where the cidr should be updated to match your cluster's k8s virtual network range. e.g. `$IP_RANGE`=`10.42.0.0/24`.

__Note: this NetworkPolicy will need to be created for any Namespace that contains pods with Prometheus metric collection end-points. Failing to do so will results in Prometheus being unable to collect metrics from any pods within that namespace.__

### 2. Grafana Dashboard Credentials:

User: `kubectl -n monitoring get secrets/promfana-grafana -o 'go-template={{index .data "admin-user"}}' | base64 -D`
Password: `kubectl -n monitoring get secrets/promfana-grafana -o 'go-template={{index .data "admin-password"}}' | base64 -D`

### 3. Configure Grafana Data Source:

Login to the Grafana dashboard.

1. Create a new Data Source
2. Name: `Prometheus`
3. Type: `Prometheus`
4. Mark it as `default`
5. URL: `http://promfana-prometheus-server`

### 4. Import Dashboards

Instructions [Grafana Dashboard Installation](./dashboards/README.md)


## Alternative Manual Prometheus & Grafana without Mojaloop Helm Chart/Repository

### 1. Install Prometheus

`helm install --namespace=monitoring --name=prom stable/prometheus -f values.yaml`

__Where the values.yaml is the respective values file for the stable/prometheus chart__

### 2. Install Grafana

`helm install --namespace=monitoring --name=graf stable/grafana -f values.yaml`

__Where the values.yaml is the respective values file for the stable/grafana chart__

___Note: Please ensure that you configure the Ingress for Grafana & Prometheus as required in the values.yaml.___

___Note: Target namespace in the above command can be changed as required.___

### 3. Follow the above steps in "Mojaloop Prometheus & Grafana Installation" section 

- [Network Policy Configuration](#12-Configure-Network-Policy-to-allow-for-all-Ingresses-into-the-your-Mojaloop-environment-from-the-Internal-K8s-Network)
- [Grafana Dashboard Credentials](#2-Grafana-Dashboard-Credentials)
- [Configure Grafana Data Source](#3-Configure-Grafana-Data-Source)
- [Import Dashboards](#4-Import-Dashboards)

## Known issues

1. **Warning:** Prometheus does not have an authentication mechanism. To be addressed in future. It is not recommended that you expose this through Ingress publicly. 

2. Affinity and tolerations are not being set correctly by the Prometheus helm chart as when this was written. One must manually add this in the deployment template if desired until the issue has been resolved.

```JSON
        "affinity": {
          "nodeAffinity": {
            "requiredDuringSchedulingIgnoredDuringExecution": {
              "nodeSelectorTerms": [
                {
                  "matchExpressions": [
                    {
                      "key": "node-role-type",
                      "operator": "In",
                      "values": [
                        "controlplane"
                      ]
                    }
                  ]
                }
              ]
            }
          }
        },
        "tolerations": [
          {
            "key": "dedicated",
            "operator": "Equal",
            "value": "master",
            "effect": "NoSchedule"
          }
        ]
```

3. Grafana dashboards show an error 414 - Request-URI Too Large.

This is more than likely caused by default configuration of the Ingress Controller (or similiar proxy/routing device) not able to handle the length of the URI being requested by the Grafana dashboards.

This can be resolved by configuring your Ingress Controller to accept larger URIs.

The following example configuration for Ingress-Nginx Controller can be made to resolve this:

```YAML
  client-header-buffer-size: 16k
  large-client-header-buffers: 4 32k
```

Refer to the below links for more information:
- [client-header-buffer-size](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#client-header-buffer-size)
- [large-client-header-buffers](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#large-client-header-buffers)

4. MySQL Percona Xtra DB Cluster is not showing metrics on the datastore dashboards

Ensure that the MySQL Percona Xtra DB Cluster has been correctly annotated with the following:
- prometheus.io/port=9104
- prometheus.io/scrape=true

Example command to add the annotations to an existing deployment:
```bash
kubectl -n <NAMESPACE> annotate pods <RELEASE_NAME>-centralledger-mysql-0 prometheus.io/port=9104
kubectl -n <NAMESPACE> annotate pods <RELEASE_NAME>-centralledger-mysql-0 prometheus.io/scrape=true
```
