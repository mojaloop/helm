# Prometheus & Grafana Monitoring for Mojaloop

## Mojaloop Prometheus & Grafana Installation

### 1. Install Prometheus & Grafana

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

### 3. Follow the above steps in "Mojaloop Prometheus & Grafana Installation" section 

- [Network Policy Configuration](#12-Configure-Network-Policy-to-allow-for-all-Ingresses-into-the-your-Mojaloop-environment-from-the-Internal-K8s-Network)
- [Grafana Dashboard Credentials](#2-Grafana-Dashboard-Credentials)
- [Configure Grafana Data Source](#3-Configure-Grafana-Data-Source)
- [Import Dashboards](#4-Import-Dashboards)

## Known issues

Affinity and tolerations are not being set correctly by the Prometheus helm chart as when this was written. One must manually add this in the deployment template if desired until the issue has been resolved.

```YAML
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
