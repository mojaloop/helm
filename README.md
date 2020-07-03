# Mojaloop Helm Charts
[![Git Commit](https://img.shields.io/github/last-commit/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/commits/master)
[![Git Releases](https://img.shields.io/github/release/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/releases)
[![CircleCI](https://circleci.com/gh/mojaloop/helm.svg?style=svg)](https://circleci.com/gh/mojaloop/helm)

Mojaloop published Helm Repo: http://mojaloop.io/helm/repo/

Mojaloop deployment documentation: https://docs.mojaloop.io/documentation/deployment-guide

Refer to Helm docs for more information: https://docs.helm.sh/

## Pre-requisites

1. Add Helm dependency repositories:
```bash
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator;
helm repo add kiwigrid https://kiwigrid.github.io;
helm repo add elastic https://helm.elastic.co
```

## Configure remote Mojaloop Helm repo on your Helm Client

1. Add Mojaloop repo 

`helm repo add mojaloop http://mojaloop.io/helm/repo/`

2. Keep your local Mojaloop repo up to date

`helm repo up mojaloop`

## Deployment from remote Mojaloop repo

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo <chart_name>`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo centralledger`

2. Deploy specific chart overriding values

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo -f <values_file> <chart_name>`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo -f ./values.yaml centralledger`

Refer to the following default chart config file for values: http://mojaloop.io/helm/<chart_name>/values.yaml

3. Deploy Mojaloop components

*Warning: This will deploy all charts.*

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo mojaloop`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo mojaloop`

## Upgrading Deployments from Repo

`helm upgrade --debug <release-name> --repo=http://mojaloop.io/helm/repo <chart_name>`

e.g. `helm upgrade --debug dev --repo=http://mojaloop.io/helm/repo centralenduserregistry`

## Update Chart Dependencies for Source for local repo deployments

Note: Please ensure that you update the Chart dependencies in the order show below.

- `helm dep up centralkms`
- `helm dep up forensicloggingsidecar`
- `helm dep up centralledger`
- `helm dep up centralenduserregistry`
- `helm dep up centralsettlement`
- `helm dep up central`
- `helm dep up ml-api-adapter`
- `helm dep up mojaloop`

We are quitely waiting on recursive updates: https://github.com/kubernetes/helm/issues/2247

Alternatively please use the helper script `sh ./update-charts-dep.sh`. 

This script will ensure the correct order is maintained.

## Deployment from Source for local repo deployments

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> <chart_directory>`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./centralledger`

2. Deploy mojaloop componenets

*Warning: This will deploy all charts.*

- `helm install --debug --namespace=<namespace> --name=<release-name> ./mojaloop`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./mojaloop`

3. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> ./kube-public/ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> ./kube-public/ingress-nginx`

## Upgrading Deployments from Source

`helm upgrade --debug <release-name> <chart_directory>`

e.g. `helm upgrade --debug dev ./centralenduserregistry/`

## Testing Deployments

1. Add the following to your hosts file and ensure you have installed Ingress Controller on your Kubernetes Cluster:

`<ip-of-k8s-node-ingress>	 ml-api-adapter.local central-ledger.local account-lookup-service.local quoting-service.local central-settlement.local moja-simulator.local`

2. Curl Health End-points for ML-API-Adapter

`curl http://ml-api-adapter.local/health`

Expected output:

`{"status":"OK"}`

3. Curl Health End-points for Central Ledger

`curl http://central-ledger.local/health`

Expected output:

`{"status":"OK"}`

## Removing Deployments

`helm del --purge <release-name>`

e.g. `helm del --purge dev`

## Debugging Charts

1. Execute a dry-run to display all the Kubernetes deployment files

 `helm install --dry-run --debug --namespace=<namespace> --name=<release-name> <chart_directory>`

2. Use Helm Linter to check for any issues

`helm lint --strict <chart_directory>`

## Helper scripts

### Lint Helm Charts
1.) Lint charts

This will Lint all parent charts to ensure they conform to Helm standards

`lint-charts.sh`

### Update Helm Charts for Local usage
1.) Update charts

Update all charts, and their respective dependencies (requirements).

`update-charts-dep.sh`

### Package Helm Charts into Local repo
1.) Package charts

Package all charts, and created an index.yaml in ./repo directory

`sh package.sh`

## Monitoring Mojaloop

Refer to [Monitoring Documentation](./monitoring/README.md)
