# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-10-23 | 0 | Initial draft
 2023-10-xx | 1 | Initial release

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 0. Summary

Minor enhancements for [v15.1.0 Release](https://github.com/mojaloop/helm/blob/master/.changelog/release-v15.1.0.md), which includes the following changes:

1. Nodejs version of core and supporting services upgraded to v18.17.1 LTS
2. Performance improvements and metrics around some core services: ALS, Central Ledger, Quoting Service based on characterisation and fixes, enhancements done
3. General maintenance and bug fixes

## 1. New Features

1. **Performance fixes, enhancements and maintenance:**  
   * **mojaloop/#3396**  Performance Maintenance characterisation for ALS - Add instrumentation ([account-lookup-service/pull/457](https://github.com/mojaloop/account-lookup-service/pull/457)), closes [mojaloop/#3396](https://github.com/mojaloop/project/issues/3396)  
   * **mojaloop/#3432** Adds quoting service Performance characterization upgrades and dashboards([quoting-service/pull/#311](https://github.com/mojaloop/quoting-service/pull/311), [quoting-service/pull/313](https://github.com/mojaloop/quoting-service/pull/313), [quoting-service/pull/31]), closes [mojaloop/#3432](https://github.com/mojaloop/project/issues/3432)
   * **mojaloop/#3537** Performance Characterise Quotes ([quoting-service/pull/#313](https://github.com/mojaloop/quoting-service/pull/313), [quoting-service/pull/#315](https://github.com/mojaloop/quoting-service/pull/315)), closes [mojaloop/#3537](https://github.com/mojaloop/project/issues/3537)  
   * **mojaloop/#3470** Profile ML-API-Adapter Notification Handler ([ml-api-adapter/pull/510](https://github.com/mojaloop/ml-api-adapter/pull/510), [ml-api-adapter/pull/512](https://github.com/mojaloop/ml-api-adapter/pull/512), ), closes [mojaloop/#3470](https://github.com/mojaloop/project/issues/3470)
   * **mojaloop/#3419** Perform benchmark tests ([central-ledger/pull/961](https://github.com/mojaloop/central-ledger/pull/961), )
   * **mojaloop/3565** Re-enable caching on ([quoting-service/#318](https://github.com/mojaloop/quoting-service/pull/318)), closes [mojaloop/#3565](https://github.com/mojaloop/project/issues/3565)
   * **mojaloop/#3564** Quoting Service stalls on large concurrent requests/loads ([quoting-service/319](https://github.com/mojaloop/quoting-service/pull/319)), closes [mojaloop/#3564](https://github.com/mojaloop/project/issues/3564)
   * **mojaloop/3264** SDK - Implement restart functionality for Bulk related outbound requests after PM4ML onboarding ([sdk-scheme-adapter](https://github.com/mojaloop/sdk-scheme-adapter/pull/454)), closes [mojaloop/3264](https://github.com/mojaloop/project/issues/3264)
   * **mojaloop/2928** Upgrade Mojaloop Simulator Logging ([mojaloop-simulator/#2928](https://github.com/mojaloop/mojaloop-simulator/pull/148)), closes [mojaloop/#3564](https://github.com/mojaloop/project/issues/3564)

2. **NodeJS upgrades:**  
   * **mojaloop/#3435** Account Lookup Service NodeJs Upgrade ([account-lookup-service/pull/462](https://github.com/mojaloop/quoting-service/pull/309)), closes [mojaloop/#3435](https://github.com/mojaloop/project/issues/3432)  
   * **mojaloop/#3438** Quoting Service NodeJS Upgrade ([quoting-service/pull/309](https://github.com/mojaloop/quoting-service/pull/309)), closes [mojaloop/#3438](https://github.com/mojaloop/project/issues/3438)  
   * **mojaloop/#3425** ML-API-Adapter NodeJS Upgrade ([ml-api-adapter/pull/513](https://github.com/mojaloop/ml-api-adapter/pull/513), [ml-api-adapter/pull/514](https://github.com/mojaloop/ml-api-adapter/pull/514)), closes [mojaloop/#3425](https://github.com/mojaloop/project/issues/3425)
   * **mojaloop/#3433** Central-Ledger NodeJS Upgrade ([central-ledger/pull/#964](https://github.com/mojaloop/central-ledger/pull/964)), closes [mojaloop/#3433](https://github.com/mojaloop/project/issues/3433)
   * **mojaloop/3434** Central-Settlement NodeJS Upgrade ([central-settlement/pull/394](https://github.com/mojaloop/central-settlement/pull/394), [central-settlement/pull/395](https://github.com/mojaloop/central-settlement/pull/395)), closes [mojaloop/#3434](https://github.com/mojaloop/project/issues/3434)
   * **mojaloop/3439** Transaction-Request-Service NodeJS Upgrade ([transaction-request-service](https://github.com/mojaloop/transaction-requests-service/pull/97)), closes [mojaloop/#3434](https://github.com/mojaloop/project/issues/3439)
   * **mojaloop/3443** event-sidecar NodeJS Upgrade ([event-sidecar/pull/54](https://github.com/mojaloop/event-sidecar/pull/54), [event-sidecar/pull/55](https://github.com/mojaloop/event-sidecar/pull/55)), closes [mojaloop/#3443](https://github.com/mojaloop/project/issues/3443)
   * **mojaloop/3440** Auth-Service NodeJS Upgrade ([auth-service/pull/133](https://github.com/mojaloop/auth-service/pull/133)), closes [mojaloop/#3440](https://github.com/mojaloop/project/issues/3440)
   * **mojaloop/3437** ALS-Consent-Oracle NodeJS Upgrade ([als-consent-oracle/pull/30](https://github.com/mojaloop/als-consent-oracle/pull/30)), closes [mojaloop/#3437](https://github.com/mojaloop/project/issues/3437)
   * **mojaloop/3521** Thirdparty-API-Service NodeJS Upgrade ([thirdparty-api-service/pull/91](https://github.com/mojaloop/thirdparty-api-svc/pull/91), [third-party-api-svc/pull/92](https://github.com/mojaloop/thirdparty-api-svc/pull/92)), closes [mojaloop/#3521](https://github.com/mojaloop/project/issues/3521)
   * **mojaloop/3386** SDK-Scheme-Adapter NodeJS Upgrade ([sdk-scheme-adapter/pull/453](https://github.com/mojaloop/sdk-scheme-adapter/pull/453), [sdk-scheme-adapter/pull/454](https://github.com/mojaloop/sdk-scheme-adapter/pull/454), [sdk-scheme-adapter/pull/455](https://github.com/mojaloop/sdk-scheme-adapter/pull/455))
   * **mojaloop/3444** Mojaloop-Simulator NodeJS Upgrade ([mojaloop-simulator/pull/168](https://github.com/mojaloop/mojaloop-simulator/pull/168)), closes [mojaloop/#3444](https://github.com/mojaloop/project/issues/3444)
   * **mojaloop/3447** Bulk-Api-Adapter NodeJS Upgrade ([bulk-api-adapter/pull/99](https://github.com/mojaloop/bulk-api-adapter/pull/99), [bulk-api-adapter/pull/100](https://github.com/mojaloop/bulk-api-adapter/pull/100))

## 2. Bug Fixes

1. **mojaloop/#3474** CL Cache expiration values higher than default causes transfer to fail ([central-ledger/pull/966](https://github.com/mojaloop/central-ledger/pull/966)), closes [mojaloop/#3474](https://github.com/mojaloop/project/issues/3474)
2. **mojaloop/#3529** CL high latency in transfer processing([central=ledger](https://github.com/mojaloop/central-ledger/pull/981)), closes [mojaloop/#3529](https://github.com/mojaloop/project/issues/3529)
3. **mojaloop/3580** fix missing toDestination on handling the fspiop source/destination ([central-ledger/pull/982](https://github.com/mojaloop/central-ledger/pull/982)), closes [mojaloop/3580](https://github.com/mojaloop/project/issues/3580)
4. **mojaloop/2734** Failures in daily cronjob GP tests ([mojaloop-simulator](https://github.com/mojaloop/mojaloop-simulator/pull/146)), closes [mojaloop/2734](https://github.com/mojaloop/project/issues/2734)
5. **mojaloop/3589** Bulk API Adapter failing due to object-lib-store bug ([bulk-api-adapter/pull/102](https://github.com/mojaloop/bulk-api-adapter/pull/102))
6. **mojaloop/3579** Provisioning and GP test failing because of Funds In timing problems ([testing-toolkit-test-cases/pull/129](https://github.com/mojaloop/testing-toolkit-test-cases/pull/129))

## 3. Application versions

1. ml-api-adapter: v14.0.0 -> [v14.0.4](https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.4) ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v14.0.0...v14.0.4))
2. central-ledger: v17.0.3 -> [v17.3.0]((https://github.com/mojaloop/central-ledger/releases/tag/v17.3.0)) ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.0.3...v17.3.0))
3. account-lookup-service: 14.1.0 -> [v14.2.5](https://github.com/mojaloop/account-lookup-service/releases/tag/v14.2.5) ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v14.1.0...v14.2.5))
4. quoting-service: v15.0.2 -> [v15.4.0](https://github.com/mojaloop/quoting-service/releases/tag/v15.4.0) ([Compare](https://github.com/mojaloop/quoting-service/compare/v15.0.2...v15.4.0))
5. central-settlement: v15.0.0 -> [v15.0.4](https://github.com/mojaloop/central-settlement/releases/tag/v15.0.4) ([Compare](https://github.com/mojaloop/central-settlement/compare/v15.0.0...v15.0.4))
6. bulk-api-adapter: v15.0.3 -> [v16.0.1](https://github.com/mojaloop/bulk-api-adapter/releases/tag/v16.0.1) ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v15.0.3...v16.0.1))
7. central-event-processor: [v12.0.0](https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
8. email-notifier: [v12.0.0](https://github.com/mojaloop/email-notifier/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
9. als-oracle-pathfinder: [v12.0.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0)
10. transaction-requests-service: v14.1.0 -> [v14.1.1](https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.1.1) ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.1.0...v14.1.1))
11. finance-portal-ui: [v10.4.3](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3) *(DEPRECATED)*
12. finance-portal-backend-service: [v15.0.2](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2) *(DEPRECATED)*
13. settlement-management: [v11.0.0](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0) *(DEPRECATED)*
14. operator-settlement: [v11.0.0](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0) *(DEPRECATED)*
15. event-sidecar: v12.0.0 -> [v13.0.1](https://github.com/mojaloop/event-sidecar/releases/tag/v13.0.1) ([Compare](https://github.com/mojaloop/event-sidecar/compare/v12.0.0...v13.0.1))
16. event-stream-processor: [v12.0.0-snapshot.7](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7)
17. simulator: [12.0.0](https://github.com/mojaloop/simulator/releases/tag/v12.0.0)
18. mojaloop-simulator: v14.0.1 -> [v15.0.0](https://github.com/mojaloop/mojaloop-simulator/releases/tag/v15.0.0) ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.0.1...v15.0.0))
19. sdk-scheme-adapter: v23.0.1 -> [v23.1.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v23.1.1) ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v23.0.1...v23.1.1))
20. ml-testing-toolkit: v16.1.1 -> [v17.0.0](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v17.0.0) ([Compare](https://github.com/mojaloop/sml-testing-toolkit/compare/v16.1.1...v17.0.0))
21. ml-testing-toolkit-ui: [v15.4.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.3.0)22. ml-testing-toolkit-client-lib: [v1.2.0](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.0)
23. ml-testing-toolkit-client-lib: v1.2.0 -> [v1.2.1](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.1)  ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v1.2.0...v1.2.1))
24. auth-service: v14.0.0 -> [v14.0.1](https://github.com/mojaloop/auth-service/releases/tag/v14.0.1) ([Compare](https://github.com/mojaloop/auth-service/compare/v14.0.0...v14.0.1))
25. als-consent-oracle: v0.2.0 -> [v0.2.1](https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.1) ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v0.2.0...v0.2.1))
26. thirdparty-api-svc: v13.0.2 -> [v13.0.4](https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.4) ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v13.0.2...v13.0.4))
27. thirdparty-sdk: v15.1.0 -> [v15.1.1](https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.1) ([Compare](https://github.com/mojaloop/thirdparty-sdk/compare/v15.1.0...v15.1.1))


## 4. API Versions

This release supports the following versions of the [Mojaloop family of APIs](https://docs.mojaloop.io/api):

| API         | Supported Versions                                                                                                                                    | Notes |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| FSPIOP      | [v1.1](https://docs.mojaloop.io/api/fspiop/v1.1/api-definition.html), [v1.0](https://docs.mojaloop.io/api/fspiop/v1.0/api-definition.html) |       |
| Settlements | [v2.0](https://docs.mojaloop.io/api/settlement)                                                                                            |       |
| Admin       | [v1.0](https://docs.mojaloop.io/api/administration/central-ledger-api.html)                                                                |       |
| Oracle      | [v1.0](https://docs.mojaloop.io/legacy/api/als-oracle-api-specification.html)                                                              |       |
| Thirdparty  | [v1.0](https://docs.mojaloop.io/api/thirdparty)                                                                                           |       |

## 5. Breaking changes

1. Backend dependencies have been externalized, see [deploying-backend-dependencies](https://github.com/mojaloop/helm/blob/v15.0.0/README.md#deploying-backend-dependencies) for an example on how to deploy backend dependencies, and refer to the [upgrade-strategy-guide](https://docs.mojaloop.io/technical/deployment-guide/upgrade-strategy-guide.html) for best practices on deployment topologies.
2. The `central-event-processor` and `email-notifier` services are no longer packaged as part of the main Mojaloop Helm chart, but can be deployed independently:

   1. `central-event-processor` - Refer to [centraleventprocessor/values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/centraleventprocessor/values.yaml) for configuration options.

        Pre-requisites:

        - The `central-event-processor` has a dependency on a `MongoDB` datastore.
        - Refer to [example-mojaloop-backend](https://github.com/mojaloop/helm/blob/v15.0.0/example-mojaloop-backend/README.md) for an example on how to deploy this dependency. This can be enabled in the [example-mojaloop-backend/values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/example-mojaloop-backend/values.yaml)  by setting `cep-mongodb.enabled` to `true`.

        Use the following command to deploy `central-event-processor` :

        ```bash
        helm -n <NAMESPACE> install mojaloop/centraleventprocessor -v <VERSION> -f <CUSTOMIZED_VALUES.yaml>
        ```

   2. `email-notifier` - Refer to [emailnotifier/values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/emailnotifier/values.yaml) for configuration options.

        Pre-requisites:

        - The `email-notifier` has a dependency on `Kafka`.
        - Refer to [example-mojaloop-backend](https://github.com/mojaloop/helm/blob/v15.0.0/example-mojaloop-backend/README.md) for an example on how to deploy this dependency. This can be enabled in the [example-mojaloop-backend/values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/example-mojaloop-backend/values.yaml)  by setting `kafka.enabled` to `true`.

        Use the following command to deploy `email-notifier`:

        ```bash
        helm -n <NAMESPACE> install mojaloop/emailnotifier -v <VERSION> -f <CUSTOMIZED_VALUES.yaml>
        ```

3. The `central` wrapper chart has been removed and the child charts have been flattened to the project root folder. This means the following charts are now configured at a root level for the [mojaloop/values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/mojaloop/values.yaml):
    - `centralledger`
    - `centralsettlements`
4. Charts have been re-factored for consistency, which will impact the following value configs. These are not necessarily breaking changes, but you will need to ensure any customized values files are updated to reflect these changes:
    - Image, Command definitions have been made consistent, with "debug" added.
    - InitContainers definitions have been made consistent.
    - Service definitions have been made consistent.
    - "config" and "config_files" are being used for consistency. This mainly impacts ML-Testing-Toolkit-Backend and ThirdParty Services.
        - "config" is used for general configurations.
        - "config_files" are used for actual config files as per the name.
5. The following services no longer support a "Connection URL" for backend configurations to support Password Injection via Env Vars. You will now explicitly configure the Host, User, Pass, DB, Port, etc instead.
     - Central-Ledger for MongoDB. (Ref: [central-ledger/pull/945](https://github.com/mojaloop/central-ledger/pull/945))
     - Bulk-API-Adapter for MongoDB. (Ref: [bulk-api-adapter/pull/95](https://github.com/mojaloop/bulk-api-adapter/pull/95))
     - ML-Testing-Toolkit-Backend for MongoDB. (Ref: [ml-testing-toolkit/pull/237](https://github.com/mojaloop/ml-testing-toolkit/pull/237))
     - Auth-Service for MySQL. (Ref: [auth-service/pull/132](https://github.com/mojaloop/auth-service/pull/132))
6. Several ML-Testing-Toolkit Backend Dependencies are no longer needed as the associated functionality has been deprecated
     - removed deprecated dependencies: Keycloak, Connection-Manager
7. Migrations `tableName` for the Thirdparty Auth-Svc has changed from `auth-svc` to `migration` for consistency. If you have an existing migrated/seeded database, ensure that you rename this table to `migration` or otherwise manually customize your configuration ([values.yaml](https://github.com/mojaloop/helm/blob/v15.0.0/mojaloop/values.yaml)) to use `"tableName": "auth-svc",` instead of `"tableName": "migration"`.
8. Thirdparty Kubernetes Services ports were standardized to port `80` for the following components: `tp-api-svc`, `auth-svc` & `consent-oracle`.
9. The following Thirdparty Kubernetes Services are incorrectly deployed as a [headless service](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services) in v14.x releases:

    1. `tp-api-svc`
    2. `auth-svc`
    3. `consent-oracle`

    [Headless services](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services) cannot be used for load-balancing purposes, and thus the service would be unavailable if scaled-up.

    *NOTE: This DOES not impact new installations!*

    To fix this going forward one must manually re-create (delete & create) the affected services prior to the upgrade by removing the following JSON keys:

   - `.spec.clusterIP`
   - `.spec.clusterIPs`

    *NOTE: Modifying the existing Kubernetes definition will NOT take effect, thus the need to completely re-create the Kubernetes service by deleting it and then creating it!*

    Alternatively, you can execute the following commands against your existing v14.x deployment - copy and paste them in to your terminal or save them to an executable bash script.

    Ensure you update the exported env variables prior to execution:

    - `SERVICE_NS` - Namespace of the deployment
    - `SERVICE_NAME` - Name of the Service to be re-created. If you are running this against v14.x or earlier, no change is necessary.

    Pre-requisites:

    - [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) - Kubernetes command-line tool, with configured access to your target Kubernetes cluster.
    - [jq](https://stedolan.github.io/jq/) - A lightweight and flexible command-line JSON processor.

    Script to execute:

    ```bash
    export SERVICE_NS="<NAMESPACE>";

    export SERVICE_NAME="tp-api-svc"; \
    echo "Re-creating the $SERVICE_NS/$SERVICE_NAME"; \
    export K8_DESCRIPTOR=$(kubectl -n $SERVICE_NS get svc/$SERVICE_NAME -o json | jq 'del(.spec.clusterIP) | del(.spec.clusterIPs)') && \
    kubectl -n $SERVICE_NS delete svc/$SERVICE_NAME && \
    echo $K8_DESCRIPTOR | kubectl create --save-config -f -;

    export SERVICE_NAME="auth-svc"; \
    echo "Re-creating the $SERVICE_NS/$SERVICE_NAME"; \
    export K8_DESCRIPTOR=$(kubectl -n $SERVICE_NS get svc/$SERVICE_NAME -o json | jq 'del(.spec.clusterIP) | del(.spec.clusterIPs)') && \
    kubectl -n $SERVICE_NS delete svc/$SERVICE_NAME && \
    echo $K8_DESCRIPTOR | kubectl create --save-config -f -;

    export SERVICE_NAME="consent-oracle"; \
    echo "Re-creating the $SERVICE_NS/$SERVICE_NAME"; \
    export K8_DESCRIPTOR=$(kubectl -n $SERVICE_NS get svc/$SERVICE_NAME -o json | jq 'del(.spec.clusterIP) | del(.spec.clusterIPs)') && \
    kubectl -n $SERVICE_NS delete svc/$SERVICE_NAME && \
    echo $K8_DESCRIPTOR | kubectl create --save-config -f -;
    ```

## 6. Deprecations

The following components have been deprecated from the packaged Mojaloop Helm chart release and have been with [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs), which can be deployed by the official [BoF Helm Chart](https://github.com/mojaloop/charts/tree/master/mojaloop/bof):

- [finance-portal](https://github.com/mojaloop/helm/tree/master/finance-portal) Helm Chart
  - [finance-portal-ui](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3)
  - [finance-portal-backend-service](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2)
- [finance-portal-settlement-management](https://github.com/mojaloop/helm/tree/master/finance-portal-settlement-management) Helm Chart
  - [settlement-management](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0)
  - [operator-settlement](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0)

> *Note these Helm Chart are still available for deployment in the [Mojaloop Helm Repo (http://mojaloop.io/helm/repo/)](http://mojaloop.io/helm/repo/index.yaml).*

This is due to the underlying services having been deprecated by the Micro-Services provided by the [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs) for Financial Management and Reporting.

More information can be found here:

- https://github.com/mojaloop/business-operations-framework-docs.

[BOF Helm charts](https://github.com/mojaloop/charts/tree/master/mojaloop/bof) to deploy the [Business Operation Framework](https://github.com/mojaloop/business-operations-framework-docs) can be found here:

- https://github.com/mojaloop/charts/tree/master/mojaloop/bof

## 7. Testing notes

1. This release has been validated against the following Dependency Test Matrix:

    | Dependency | Version |  Notes   |
    | ---------- | ------- | --- |
    | Kubernetes | v1.28 | [AWS EKS](https://aws.amazon.com/eks/), [AWS EKS Supported Version Notes](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)  |
    | containerd  |  v1.6.19  |  |
    | Nginx Ingress Controller | [helm-ingress-nginx-4.7.0](https://github.com/kubernetes/ingress-nginx/releases/tag/helm-chart-4.7.0) / [ingress-controller-v1.8.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.8.0) |     |
    |  Amazon Linux   |  v2   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v15.2.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.2.0)   |     |
    |  example-mojaloop-backend   |  v15.0.0   |  [README](https://github.com/mojaloop/helm/blob/master/example-mojaloop-backend/README.md)   |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases) (See above Dependency Test Matrix for exact version required for this release) Golden Path collections expects:
    - the Quoting service operating mode to be set quoting-service.config.simple_routing_mode_enabled=true (in helm mojaloop/values.yaml under quoting-service config). If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter **SIMPLE_ROUTING_MODE_ENABLED** ( in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues) to match.
    - the **on-us transfers** (in mojaloop/values.yaml "enable_on_us_transfers: false" under centralledger-handler-transfer-prepare -> config and  cl-handler-bulk-transfer-prepare -> config) configuration to be disabled. The test-case environment variable parameter (**ON_US_TRANSFERS_ENABLED** (in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues), the same name used on postman collections) must similarly match this value.

4. Simulators
    - We recommend using Testing Toolkit instead of Postman which is better suited for the async nature of the Mojaloop API specification (see above)
    - [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used for single transfers usually and three more specific to bulk).
    - Ensure that correct Postman Scripts are used if you wish to test against the Mojaloop-Simulators:
        - Setup Mojaloop Hub: [MojaloopHub_Setup](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopHub_Setup.postman_collection.json)
        - Setup Mojaloop Simulators for testing : [MojaloopSims_Onboarding](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopSims_Onboarding.postman_collection.json)
        - Golden path tests: [Golden_Path_Mojaloop](https://github.com/mojaloop/postman/blob/v12.0.0/Golden_Path_Mojaloop.postman_collection.json)
    - Legacy Simulators are still required and deployed by default; disabling this will cause issues since there is Account Lookup directory mocking functionality in this service.

5. Thirdparty Testing Toolkit Test Collections are not repeatable. Please refer to the following issue for more information [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717). It is possible to manually cleanup persistent data to re-run the test if required.

6. Bulk API Helm Tests

    Refer to the [Testing Deployments](https://github.com/mojaloop/helm/blob/master/README.md#testing-deployments) section in the main README for detailed information on how to enable bulk-api-adapter tests.

7. Thirdparty API Helm Tests

    Refer to [thirdparty/README.md#validating-and-testing-the-3p-api](https://github.com/mojaloop/helm/blob/master/thirdparty/README.md#validating-and-testing-the-3p-api) on how to enabled and execute Thirdparty verification tests.

8. Testing the new Bulk functionality (sdk-scheme-adapter)

    For details regarding deployment and validation of simulators needed for bulk (for adoption provided in sdk-scheme-adapter) refer to [deploying Mojaloop TTK simulators](https://github.com/mojaloop/helm/blob/master/mojaloop-ttk-simulators/README.md).

## 8. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2892 - Disabled DFSP showing getParty info](https://github.com/mojaloop/project/issues/2892)
5. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
6. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2845 - QA: Replace Legacy-Simulator as a NORESPONSE_SIMPAYEE in Testing-Toolkit Goden Path Test-Suite](https://github.com/mojaloop/project/issues/2845)
    3. [#3027 - QA: Mojaloop Helm v14.1.0 Release - Bulk Tests fail on first run](https://github.com/mojaloop/project/issues/3027)
    4. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)
    5. [#3164 - GP Tests fail intermitantly when upgrading a release from v14.1.1 to v15 due to WS issues between TTK and SDKs](https://github.com/mojaloop/project/issues/3164)

## 9. Contributors

- Organizations: BMGF, InFiTX
- Individuals: @chris-me-law , @dfry , @elnyry-sam-k , @PaulGregoryBaker , @mdebarros , @vijayg10 , @aaronreynoza , @oderayi

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v15.1.0...v15.2.0