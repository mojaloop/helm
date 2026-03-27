# Promfana

This chart is a Mojaloop wrapper around `kube-prometheus-stack`.

## What this chart does

- Installs Prometheus and Grafana through `kube-prometheus-stack`
- Keeps defaults minimal
- Packages Grafana dashboards as part of the Helm release
- Preserves Grafana folders using ConfigMap annotations
- Avoids hardcoding the namespace by rendering namespaced URLs dynamically
- Supports a Grafana admin secret managed by this chart

## Included by default

- Prometheus: enabled
- Grafana: enabled
- kube-state-metrics: enabled
- node-exporter: enabled
- Prometheus Operator: enabled
- Alertmanager: disabled
- Grafana ingress: disabled
- Persistence: disabled
- Dashboards: enabled

## Dashboard folders

Place dashboard JSON files in:

- `dashboards/application/`
- `dashboards/datastore/`
- `dashboards/messaging/`
- `dashboards/kubernetes/`

These map to the following Grafana folders by default:

- `Mojaloop - Application`
- `Mojaloop - Datastore`
- `Mojaloop - Messaging`
- `Mojaloop - Kubernetes`

## Install

Add the chart repository and install with the default release name `promfana`:

```bash
helm repo add mojaloop https://mojaloop.github.io/charts/repo
helm repo update

helm install promfana mojaloop/promfana   --namespace monitoring   --create-namespace
```

You can install into any namespace by changing `--namespace`:

```bash
helm install promfana mojaloop/promfana   --namespace observability   --create-namespace
```

> Namespace is fully dynamic in this chart. Resources created by this chart use `{{ .Release.Namespace }}` and the Prometheus datasource URL is rendered with the install namespace.

## Access Grafana from your local machine

Grafana ingress is disabled by default, so the easiest local access method is port-forwarding the Grafana service.

### 1) Find the Grafana service name

```bash
kubectl get svc -n monitoring   -l app.kubernetes.io/name=grafana,app.kubernetes.io/instance=promfana
```

### 2) Port-forward Grafana to your local machine

```bash
kubectl port-forward -n monitoring   svc/$(kubectl get svc -n monitoring   -l app.kubernetes.io/name=grafana,app.kubernetes.io/instance=promfana   -o jsonpath='{.items[0].metadata.name}')   3000:80
```

Then open:

```text
http://localhost:3000
```

## Access Grafana through an ingress URL

If you want a browser-friendly URL instead of port-forwarding, enable ingress in `values.yaml`:

```yaml
kps:
  grafana:
    ingress:
      enabled: true
      ingressClassName: nginx
      hosts:
        - grafana.mojaloop.local
      tls: []
    grafana.ini:
      server:
        root_url: https://grafana.mojaloop.local
```

Then point the hostname to your ingress IP using DNS or `/etc/hosts`.

## Get the Grafana admin password

This chart creates a secret by default:

- Secret name: `promfana-grafana-admin`
- User key: `admin-user`
- Password key: `admin-password`

### Get the admin username

```bash
kubectl get secret promfana-grafana-admin -n monitoring   -o jsonpath='{.data.admin-user}' | base64 --decode && echo
```

### Get the admin password

```bash
kubectl get secret promfana-grafana-admin -n monitoring   -o jsonpath='{.data.admin-password}' | base64 --decode && echo
```

If you change the secret name or keys in `values.yaml`, use those values instead.

## Good practice for credentials

This chart keeps the Secret resource in the chart, but you should still override the default placeholder password in real environments.

Example:

```yaml
grafanaAdminSecret:
  enabled: true
  name: promfana-grafana-admin
  username: admin
  password: "replace-this-in-your-own-values-file"

kps:
  grafana:
    admin:
      existingSecret: promfana-grafana-admin
      userKey: admin-user
      passwordKey: admin-password
```

For more advanced environments, you can point Grafana at a different existing secret by overriding:

```yaml
kps:
  grafana:
    admin:
      existingSecret: my-external-grafana-secret
      userKey: admin-user
      passwordKey: admin-password
```

## Alertmanager

Alertmanager is disabled by default to keep the install minimal.

Enable it only when needed:

```yaml
kps:
  alertmanager:
    enabled: true
```

Notification receivers are intentionally left empty by default. Users can override them with Slack, email, webhook, or other receiver configuration as needed.

## Prometheus datasource

This chart provisions a Grafana datasource named `Prometheus`.

By default it points Grafana at:

```text
http://prometheus-operated.<install-namespace>.svc:9090
```

If your environment uses a different Prometheus service, override:

```yaml
prometheusDatasource:
  serviceName: your-prometheus-service
  servicePort: 9090
```

## Important notes

- Keep Prometheus internal by default. Do not expose it publicly unless you have a specific reason and appropriate access controls.
- If you enable Grafana ingress with HTTPS, also set `kps.grafana.grafana.ini.server.root_url` and consider setting `kps.grafana.grafana.ini.security.cookie_secure: true`.
- If you install with a release name other than `promfana`, also override:
  - `grafanaAdminSecret.name`
  - `kps.grafana.admin.existingSecret`

## Package / template locally

```bash
helm dependency update monitoring/promfana
helm template promfana ./monitoring/promfana --namespace monitoring
```
