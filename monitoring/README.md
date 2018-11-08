## Value files to setup Prometheus & Grafana


## Install Prometheus

`helm install --namespace=monitoring --name=prom stable/prometheus -f prom-perf1-values.yaml`

## Install Grafana

`helm install --namespace=monitoring --name=graf stable/grafana -f grafana-perf1-values.yaml`

## Install Heapster

`helm install --namespace=monitoring --name=heap stable/heapster -f heapster-values.yaml`

Note that the affinity and tolerations are not being set correctly by the helm chart. One must manually set this in the deployment if desired until the issue is resolved.

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
```

```YAML
        "tolerations": [
          {
            "key": "dedicated",
            "operator": "Equal",
            "value": "master",
            "effect": "NoSchedule"
          }
        ]
```

## Add Network Policy to allow for all Ingresses into the Perf1 Test environment from the Internal K8s Network

`kubectl create -f k8s-network-policy.yaml` 
