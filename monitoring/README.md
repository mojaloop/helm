## Value files to setup Prometheus & Grafana


## Install Prometheus

`helm install --namespace=monitoring --name=prom stable/prometheus -f prom-perf1-values.yaml`

## Install Grafana

`helm install --namespace=monitoring --name=graf stable/grafana -f grafana-perf1-values.yaml`

