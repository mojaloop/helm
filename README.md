# Mojaloop Helm Charts
[![Git Commit](https://img.shields.io/github/last-commit/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/commits/master)
[![Git Releases](https://img.shields.io/github/release/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/releases)
[![CircleCI](https://circleci.com/gh/mojaloop/helm.svg?style=svg)](https://circleci.com/gh/mojaloop/helm)

## Quick Links
- [http://mojaloop.io/helm/repo/](http://mojaloop.io/helm/repo/index.yaml) Mojaloop Published Helm Repo
- [Documentation - Deploying Mojaloop](https://docs.mojaloop.io/documentation/deployment-guide)
- [Helm v3 Docs](https://docs.helm.sh/)

## Pre-requisites

1. Add Helm dependency repositories:
```bash
 helm repo add stable https://charts.helm.sh/stable
 helm repo add incubator https://charts.helm.sh/incubator
 helm repo add kiwigrid https://kiwigrid.github.io
 helm repo add elastic https://helm.elastic.co
 helm repo add bitnami https://charts.bitnami.com/bitnami
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

```bash
# lint all parent charts and ensure they conform to Helm's standards
./lint-charts.sh


# Update all charts, and their respective dependencies (requirements).
./update-charts-dep.sh

# Package all charts, and created an index.yaml in ./repo directory
./package.sh
```

## Monitoring Mojaloop

Refer to [Monitoring Documentation](./monitoring/README.md)
