# Mojaloop Helm Charts

[![Git Commit](https://img.shields.io/github/last-commit/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/commits/master)
[![Git Releases](https://img.shields.io/github/release/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/releases)
[![CircleCI](https://circleci.com/gh/mojaloop/helm.svg?style=svg)](https://circleci.com/gh/mojaloop/helm)

## Quick Links

- [http://mojaloop.io/helm/repo/](http://mojaloop.io/helm/repo/index.yaml) Mojaloop Published Helm Repo
- [Documentation - Deploying Mojaloop](https://docs.mojaloop.io/legacy/deployment-guide)
- [Helm v3 Docs](https://docs.helm.sh/)
- Changelogs
  - [release-v15.0.0.md](./.changelog/release-v15.0.0.md)
  - [release-v14.1.1.md](./.changelog/release-v14.1.1.md)
  - [release-v14.1.0.md](./.changelog/release-v14.1.0.md)
  - [release-v14.0.0.md](./.changelog/release-v14.0.0.md)
  - [release-v13.1.0.md](./.changelog/release-v13.1.0.md)
  - [release-v13.0.2.md](./.changelog/release-v13.0.2.md)
  - [release-v13.0.1.md](./.changelog/release-v13.0.1.md)
  - [release-v13.0.0.md](./.changelog/release-v13.0.0.md)

## Pre-requisites

1. Add Helm dependency repositories:

    ```bash
    helm repo add stable https://charts.helm.sh/stable
    helm repo add incubator https://charts.helm.sh/incubator
    helm repo add kiwigrid https://kiwigrid.github.io
    helm repo add kokuwa https://kokuwaio.github.io/helm-charts
    helm repo add elastic https://helm.elastic.co
    helm repo add codecentric https://codecentric.github.io/helm-charts
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo add mojaloop-charts https://mojaloop.github.io/charts/repo 
    helm repo add redpanda-console https://packages.vectorized.io/public/console/helm/charts/
    ```

### Configure remote Mojaloop Helm repo on your Helm Client

1. Add Mojaloop repo

    `helm repo add mojaloop http://mojaloop.io/helm/repo/`

2. Keep your local Mojaloop repo up to date

    `helm repo update`

## Deployment

### Deploying Backend Dependencies

It is recommended and it is a best practice that you deploy each External Backend Dependencies (i.e. MySQL, Kafka, MongoDB, etc) as a separate deployment as to ensure that each deployment is operationally isolated and maintainable.

We have provided an example Helm Wrapper chart that packages all dependencies, called the [example-mojaloop-backend](./example-mojaloop-backend/README.md) Helm chart. The [example-mojaloop-backend](./example-mojaloop-backend/README.md) is provided purely for convenience and should only be used for PoC environments, and for testing purposes. You can also use this as a reference to determine which External Dependency Helm charts can be utilized for this purpose, and how to potentially configure them.

Refer to [example-mojaloop-backend/README.md#installation](./example-mojaloop-backend/README.md#installation) on how to deploy the `example-mojaloop-backend`.

The following Helm Charts have the following external dependencies:

|  Chart   |  Dependency   |  Notes   |
| --- | --- | --- |
|  Account-Lookup-Service   |  MySQL   |     |
|   Quoting-Service  |  MySQL   |     |
|  ML-API-Adapter   |  Kafka   |     |
|  Central-Ledger  |   Kafka, MySQL, MongoDB  |     |
|  Central-Settlements   |  MySQL   |     |
|  Central-Event-Processor   |  Kafka, MongoDB   |     |
|  Transaction-Request-Service   |   N/A  |     |
|  Thirdparty Auth-Service   |   Redis, MySQL  |     |
|   Thirdparty Consent Oracle  |   MySQL  |     |
|  Thirdparty SDK  |   N/A  |     |
|  Simulator   |   N/A  |     |
|   Mojaloop-Simulator  |  Redis   |   There is a dependency on Redis, however due to the dynamic nature of the Mojaloop-Simulator, a Redis container will be created dynamically for each configured Simulator.  |
|  Mojaloop-Testing-Toolkit   |   MongoDB  |     |
|  Mojaloop-TTK-Simulators   |   Redis, MongoDB  |     |
|  SDK-Scheme-Adapter   |   Redis, Kafka  |    |
|   Bulk-API-Adapter  |   Kafka, MongoDB  |     |
|     |     |     |

### Deploying Mojaloop Helm Charts

1. Deploy the Mojaloop chart

    This chart is a "Wrapper" chart that packages the core Mojaloop components that one would use as a base "Switch" deployment. It includes all the components that one needs for executing and testing the Discovery, Quoting, and Transfer phases of the FSPIOP API specification, as well as supporting components for Bulk, and Settlement Processing.

    *Warning: This will deploy all core Mojaloop charts with default backends configurations. See [#deploying-backend-dependencies](#deploying-backend-dependencies) on how to deploy them using the [example-mojaloop-backend/README.md](./example-mojaloop-backend/README.md) Helm chart.*

    - `helm --namespace <namespace> install <release_name> mojaloop/mojaloop`

    e.g. `helm --namespace moja install dev mojaloop/mojaloop`

2. Deploy Mojaloop with Bulk-API-Adapter

    *Warning: This will deploy all core Mojaloop charts.* and the Bulk-API-Adapter

    - `helm --namespace <namespace> install <release_name> mojaloop/mojaloop --set mojaloop-bulk.enabled=true --set ml-ttk-test-val-bulk.tests.enabled=true `

    e.g. `helm --namespace moja install dev mojaloop/mojaloop --set mojaloop-bulk.enabled=true --set ml-ttk-test-val-bulk.tests.enabled=true `

3. Deploy Mojaloop with Thirdparty components

    Refer to [thirdparty/README.md](./thirdparty/README.md) for more information on what pre-requisites are required to enable Thirdparty components and how to  manually deploy backend dependencies.

4. Deploy Mojaloop with Bulk-API-Adapter and SDK-TTK Bulk simulators

    *Warning: This will deploy all core Mojaloop charts.*, the Bulk-API-Adapter and additional SDK+TTK simulators

    - `helm --namespace <namespace> install <release_name> mojaloop/mojaloop --set mojaloop-bulk.enabled=true --set ml-ttk-test-val-bulk.tests.enabled=true `

    e.g. `helm --namespace moja install dev mojaloop/mojaloop --set mojaloop-bulk.enabled=true --set ml-ttk-test-val-bulk.tests.enabled=true --set mojaloop-ttk-simulators.enabled=true --set global.kafka.host=<MOJALOOP_INSTALL_NAME>-kafka --set global.redis.host=<REDIS_INSTALL_NAME>-redis-master --set ml-ttk-test-val-sdk-bulk.tests.enabled=true`

5. Deploy specific chart

    *Warning: This will deploy a single Mojaloop charts. You will need to ensure that you have met all pre-requisites for that chart (e.g. external dependencies such as MySQL, Kafka, AND internal dependencies such as the Central-Ledger API Service). This can be done by customization the values.yaml of each chart to suite your environment.*

   - `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> -f {custom-values.yaml}`

   e.g. `helm --namespace moja install dev mojaloop/centralledger -f ./values.yaml`

   Refer to the following default chart config file for configurable values: http://mojaloop.io/helm/<chart_name>/values.yaml

   Alternatively one can set specific values via cli arguments based on the config file above:
   - `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> --set foo=bar --set {key.subkey.subsubkey}={value}`

6. Deploy specific version for a chart

   - `helm --namespace <namespace> install <release_name> mojaloop/<chart_name> --version {version}`

   e.g. `helm --namespace moja install dev mojaloop/centralledger --version v1.0.0`

   Refer to the following default chart config file for values: http://mojaloop.io/helm/<chart_name>/values.yaml

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

2. Deploy the Mojaloop chart

    *Warning: This will deploy all core Mojaloop charts with default backends. See [#deploying-backends](#deploying-backends) on how to disabled the default backends and deploy them using the [example-mojaloop-backend/README.md](./example-mojaloop-backend/README.md) Helm chart.*

    - `helm --namespace <namespace> install <release_name> mojaloop`

    e.g. `helm --namespace mojaloop install dev ./mojaloop`

## Upgrading Deployments from Source

- `helm --namespace <namespace> upgrade <release-name> <chart_folder>`

e.g. `helm --namespace mojaloop upgrade dev ./centralenduserregistry`

## Testing Deployments

### Validation

_Note: This is currently only supported by Helm v3._

Mojaloop Helm deployments currently include the following tests:

| Helm Test | Test Cases | Enabled by default? | Notes |
|---------|----------|----------|----------|
| ml-ttk-test-setup.tests | [hub/provisioning](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/provisioning) | Yes | Required as a pre-requisite for all tests. |
| ml-ttk-test-val-gp | [hub/golden_path](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/golden_path)  | Yes | Previously named `ml-ttk-test-validation` prior to v13.1.0 release. |
| ml-ttk-test-val-bulk | [hub/other_tests/bulk_transfers](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/other_tests/bulk_transfers) | No | `mojaloop-bulk.enabled=true` must be set to deploy the Bulk-API-Adapter components. |

1. Ensure Tests are enabled

    Ensure the following properties are set in your values file:

    - `ml-ttk-test-setup.tests.enabled=true`
    - `ml-ttk-test-val-gp.tests.enabled=true`
    - `ml-ttk-test-val-bulk.tests.enabled=true` (_Note: only applicable if `mojaloop-bulk.enabled=true` is set_)
    - `ml-ttk-test-val-sdk-bulk.tests.enabled=true` (_Note: only applicable if `mojaloop-bulk.enabled=true`, `mojaloop-ttk-simulators.enabled=true` is set_)

    Or alternatively add `--set` for each of the above parameters on the install command:

    `helm install ... --set ml-ttk-test-setup.tests.enabled=true --set ml-ttk-test-val-gp.tests.enabled=true --set ml-ttk-test-val-bulk=true --set ml-ttk-test-val-bulk.tests.enabled=true`

2. Run Tests

    Run tests:
    `helm test <RELEASE_NAME>`

    Run tests with logs:

    `helm test <RELEASE_NAME> --logs`

### Ingress

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
