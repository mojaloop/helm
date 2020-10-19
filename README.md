# Mojaloop Helm Charts
[![Git Commit](https://img.shields.io/github/last-commit/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/commits/master)
[![Git Releases](https://img.shields.io/github/release/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/releases)
[![CircleCI](https://circleci.com/gh/mojaloop/helm.svg?style=svg)](https://circleci.com/gh/mojaloop/helm)

Mojaloop published Helm Repo: http://mojaloop.io/helm/repo/

Mojaloop deployment documentation: https://docs.mojaloop.io/documentation/deployment-guide

Refer to Helm v3 docs for more information: https://docs.helm.sh/

## Pre-requisites

1. Add Helm dependency repositories:
```bash
   helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
   helm repo add kiwigrid https://kiwigrid.github.io	   helm repo add kiwigrid https://kiwigrid.github.io
   helm repo add elastic https://helm.elastic.co	   helm repo add elastic https://helm.elastic.co
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm repo add stable https://kubernetes-charts.storage.googleapis.com/
   helm repo add codecentric https://codecentric.github.io/helm-charts
```

## Configure remote Mojaloop Helm repo on your Helm Client

1. Add Mojaloop repo 

`helm repo add mojaloop http://mojaloop.io/helm/repo/`

2. Keep your local Mojaloop repo up to date

`helm repo update`

## Deployment

1. Deploy specific chart

- `helm --namespace <namespace> install <release_name> mojaloop/<chart_name>`

e.g. `helm --namespace moja install dev mojaloop/centralledger`

Alternative directly from remote repo:

- `helm --namespace <namespace> install <release_name> --repo=http://mojaloop.io/helm/repo <chart_name>`

2. Deploy specific chart overriding values

- `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> -f {custom-values.yaml}`

e.g. `helm --namespace moja install dev mojaloop/centralledger -f ./values.yaml`

Refer to the following default chart config file for values: http://mojaloop.io/helm/<chart_name>/values.yaml

Alternatively one can set specific values via cli arguments based on the config file above:
- `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> --set foo=bar --set {key.subkey.subsubkey}={value}`

3. Deploy specific version for a chart

- `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> --version {version}`

e.g. `helm --namespace moja install dev mojaloop/centralledger --version v1.0.0`

Refer to the following default chart config file for values: http://mojaloop.io/helm/<chart_name>/values.yaml

4. Deploy Mojaloop components

*Warning: This will deploy all core Mojaloop charts.*

- `helm --namespace <namespace> install <release_name> mojaloop/mojaloop`

e.g. `helm --namespace moja install dev mojaloop/mojaloop`

### Deploying development versions

1. To deploy the latest development version, use the `--devel` flag:

- `helm --namespace <namespace> install <release_name> mojaloop/mojaloop --devel`

    This is useful if you've had some work merged into master but it has not yet been released.

    The `--devel` flag can also be supplied to `helm search` and `helm upgrade` commands.

    Development versions can be specified in a `requirements.yaml` file if you're using Mojaloop as a child chart.

## Upgrading Deployments from Repo

`helm --namespace <namespace> upgrade <release-name> mojaloop/<chart_name>`

e.g. `helm --namespace moja upgrade dev mojaloop/centralenduserregistry`


## Deployment from Source for local repo deployments

### Update Chart Dependencies for Source for local repo deployments (i.e. from the cloned github repository)

Run the following script `sh ./update-charts-dep.sh` in the helm root folder. 

This script will ensure that all dependencies and child-dependencies are updated correctly. This is temporary until recursive updates is supported in future: https://github.com/kubernetes/helm/issues/2247.

### Deployment

1. Deploy specific chart

- `helm --namespace <namespace> install <release_name> <chart_folder>`

e.g. `helm --namespace mojaloop install dev ./centralledger`

2. Deploy mojaloop componenets

*Warning: This will deploy all core Mojaloop charts.*

- `helm --namespace <namespace> install <release_name> mojaloop`

e.g. `helm --namespace mojaloop install dev ./mojaloop`


## Upgrading Deployments from Source

- `helm --namespace <namespace> upgrade <release-name> <chart_folder>`

e.g. `helm --namespace mojaloop upgrade dev ./centralenduserregistry`

## Testing Deployments

1. Add the following to your hosts file and ensure you have installed Ingress Controller on your Kubernetes Cluster:

`<ip-of-k8s-node-ingress>	 ml-api-adapter.local central-ledger.local account-lookup-service.local quoting-service.local central-settlement.local moja-simulator.local`

2. Curl Health End-points for ML-API-Adapter

- `curl http://ml-api-adapter.local/health`

Expected output:

`{"status":"OK"}`

3. Curl Health End-points for Central Ledger

- `curl http://central-ledger.local/health`

Expected output:

`{"status":"OK"}`

## Removing Deployments

- `helm --namespace <namespace> del <release-name>`

e.g. `helm --namespace mojaloop del dev`

## Debugging Charts

1. Execute a dry-run to display all the Kubernetes deployment files

- `helm --namespace <namespace> install <release_name> <chart_folder> --dry-run`

2. Enable debug to display raw configurations that will be injected into Helm templates

- `helm --namespace <namespace> install <release_name> <chart_folder> --dry-run --debug`

3. Use Helm Linter to check for any issues

- `helm lint --strict <chart_folder>`

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
