## Value files to setup Prometheus & Grafana


## Install Prometheus

`helm install --namespace=monitoring --name=prom stable/prometheus -f prom-perf1-values.yaml`

## Install Grafana

`helm install --namespace=monitoring --name=graf stable/grafana -f grafana-perf1-values.yaml`

## Install Heapster

`helm install --namespace=monitoring --name=heap stable/heapster -f heapster-values.yaml`

## Add Network Policy to allow for all Ingresses into the Perf1 Test environment from the Internal K8s Network

`kubectl create -f k8s-network-policy.yaml` 
