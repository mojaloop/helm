# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-02-20 | 0 | Initial draft
 2023-03-23 | 0 | Initial release
 2023-03-24 | 1 | Fix [mojaloop/#3178](https://github.com/mojaloop/project/issues/3178) applied
 2023-03-29 | 2 | Fix [mojaloop/#3254](https://github.com/mojaloop/project/issues/3254),[mojaloop/#3255](https://github.com/mojaloop/project/issues/3254),[mojaloop/#3256](https://github.com/mojaloop/project/issues/3254) applied
 2023-04-04 | 3 | Fix [mojaloop/#2845](https://github.com/mojaloop/project/issues/2845),[mojaloop/#3176](https://github.com/mojaloop/project/issues/3176) applied

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 0. Summary

Major updates with this release include:

1. Externalize Backend Dependencies for services including TTK, 3PPI services - which helps make maintenance of Mojaloop easier (and reduces breaking changes)
2. Utilize externalized secrets for user/password management (and removing plain text passwords in config files)
3. Support sub-scenarios for transfers and thereby use-cases that are enabled by this field

Refer to full feature and bug fix list below for more info; and testing improvements listed separately.

## 1. New Features

1. **mojaloop/#2887** Externalize Backend Dependencies ([helm/pull/535](https://github.com/mojaloop/helm/pull/535), [helm/pull/551](https://github.com/mojaloop/helm/pull/551)), closes [mojaloop/#2887](https://github.com/mojaloop/project/issues/2887)
2. **mojaloop/#3083** Externalize Backend Dependencies for Thirdparty Helm Charts ([helm/pull/538](https://github.com/mojaloop/helm/pull/538), [helm/pull/551](https://github.com/mojaloop/helm/pull/551)), closes [mojaloop/#3083](https://github.com/mojaloop/project/issues/3083)
3. **mojaloop/#3091** Externalize Backend Dependencies for TTK Helm Charts ([helm/pull/538](https://github.com/mojaloop/helm/pull/538), [helm/pull/551](https://github.com/mojaloop/helm/pull/551)), closes [mojaloop/#3091](https://github.com/mojaloop/project/issues/3091)
4. **mojaloop/#3082** Utilize externalized secrets for user/password management ([helm/pull/538](https://github.com/mojaloop/helm/pull/538), [helm/pull/551](https://github.com/mojaloop/helm/pull/551)), closes [mojaloop/#3082](https://github.com/mojaloop/project/issues/3082)
5. **mojaloop/#3078**: get /trans callback is wrong for exp trans ([central-ledger/pull/938](https://github.com/mojaloop/central-ledger/pull/938)), closes [mojaloop/#3078](https://github.com/mojaloop/project/issues/3078)
6. **mojaloop/#3129**: separate mongodb uri config ([central-ledger/pull/945](https://github.com/mojaloop/central-ledger/pull/945)), closes [mojaloop/#3129](https://github.com/mojaloop/project/issues/3129)
7. **mojaloop/#3131**: separate mongodb uri config ([bulk-api-adapter/pull/95](https://github.com/mojaloop/bulk-api-adapter/pull/95)), closes [mojaloop/#3131](https://github.com/mojaloop/project/issues/3131)
8. **mojaloop/#3139**: rework config to accept env variables for DB ([auth-service/pull/132](https://github.com/mojaloop/auth-service/pull/132)), closes [mojaloop/#3131](https://github.com/mojaloop/project/issues/3139)
9. **mojaloop/3023:** align ttk func tests from ttk testcases repo ([sdk-scheme-adapter/issues/#425](https://github.com/mojaloop/sdk-scheme-adapter/issues/425)) ([sdk-scheme-adapter/commit/973faa7](https://github.com/mojaloop/sdk-scheme-adapter/commit/973faa7bd09e69608b324fb754c20d2a0719da85))
10. **mojaloop/#3074:** sync DFSP backend api with api-snippets ([sdk-scheme-adapter/issues/#428](https://github.com/mojaloop/sdk-scheme-adapter/issues/428)) ([sdk-scheme-adapter/commit/edf601e](https://github.com/mojaloop/sdk-scheme-adapter/commit/edf601ea407c5d8624c3cc2d8ff96e012805a71e)), closes [mojaloop/#3074](https://github.com/mojaloop/project/issues/3074)
11. **mojaloop/#3053:** add support for subscenarios to backend, outboud and ilp ([sdk-scheme-adapter/issues/#430](https://github.com/mojaloop/sdk-scheme-adapter/issues/430)) ([sdk-scheme-adapter/commit/f6c739a](https://github.com/mojaloop/sdk-scheme-adapter/commit/f6c739a93ab6e64a0bd824ed31fc45e1ec56c948)), closes [mojaloop/#3053](https://github.com/mojaloop/project/issues/3053)
12. **mojaloop/#2928:** upgrade logger to central-services-logger ([mojaloop-simulator/issues/#148](https://github.com/mojaloop/mojaloop-simulator/issues/148)) ([mojaloop-simulator/commit/8a1573e](https://github.com/mojaloop/mojaloop-simulator/commit/8a1573ec984d994777de773a678024476dc0fb35), [6583dec](https://github.com/mojaloop/mojaloop-simulator/commit/6583dec2e76ec45bd100650813bee905eb94ca9a)), closes [mojaloop/#2928](https://github.com/mojaloop/mojaloop-simulator/issues/2928)
13. **chore**: update backend simulator api ([mojaloop-simulator/issues/#156](https://github.com/mojaloop/mojaloop-simulator/issues/156)) ([mojaloop-simulator/commit/ff253a5](https://github.com/mojaloop/mojaloop-simulator/commit/ff253a5c9199de8aa1cdfa32740c08b64d348f35))
14. **mojaloop/#3053:** update sdk backend api ([mojaloop-simulator/issues/#159](https://github.com/mojaloop/mojaloop-simulator/issues/159)) ([mojaloop-simulator/commit/165e08a](https://github.com/mojaloop/mojaloop-simulator/commit/165e08ac10e5dbf119b917e443b628f9ace5279e)), closes [mojaloop/#3053](https://github.com/mojaloop/mojaloop-simulator/issues/3053)
15. **mojaloop/#2740:** add test currencies to api ([mojaloop-simulator/issues/#154](https://github.com/mojaloop/mojaloop-simulator/issues/154)) ([mojaloop-simulator/commit/64c80a1](https://github.com/mojaloop/mojaloop-simulator/commit/64c80a12559276da74617b6cdeff5a27e10c9e81)), closes [mojaloop/#2740](https://github.com/mojaloop/mojaloop-simulator/issues/2740)
16. **mojaloop/#3130**: alter db config and allow password env setting ([ml-testing-toolkit/pull/237](https://github.com/mojaloop/ml-testing-toolkit/pull/237)), closes [mojaloop/#3130](https://github.com/mojaloop/project/issues/3130)
17. **mojaloop/#3133** add report name customization and saving option ([ml-testing-toolkit-ui/pull/171](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/171)), closes [mojaloop/#3133](https://github.com/mojaloop/project/issues/3133)
18. **mojaloop/#3133** add option to specify report name saved to TTK backend ([ml-testing-toolkit-client-lib/pull/6](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/6)), closes [mojaloop/#3133](https://github.com/mojaloop/project/issues/3133)
19. **mojaloop/#3176** add option for no callback in callback/validation rules ([ml-testing-toolkit-ui/pull/176](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/176)), closes [mojaloop/#3176](https://github.com/mojaloop/project/issues/3176)
20. **mojaloop/#3176** add no response callback option ([ml-testing-toolkit/pull/240](https://github.com/mojaloop/ml-testing-toolkit/pull/240)), closes [mojaloop/#3176](https://github.com/mojaloop/project/issues/3176)

## 2. Bug Fixes

1. **mojaloop/#3163**: Thirdparty Helm Charts are not scalable due to the Kubernetes Service being a headless service ([helm/pull/551](https://github.com/mojaloop/helm/pull/551)), closes [mojaloop/#3163](https://github.com/mojaloop/project/issues/3163)
2. **mojaloop/#3171**: cronjob support for k8s v1.25 ([helm/pull/559](https://github.com/mojaloop/helm/pull/559)), closes [mojaloop/#3171](https://github.com/mojaloop/project/issues/3171)
3. **mojaloop/#3178**: ml-ttk-test-cleanup is failing ([helm/pull/560](https://github.com/mojaloop/helm/pull/560)), closes [mojaloop/#3178](https://github.com/mojaloop/project/issues/3178)
4. **mojaloop/#3152**: initial open settlementWindow is failing on clean install ([central-ledger/pull/946](https://github.com/mojaloop/central-ledger/pull/946)), closes [mojaloop/#3152](https://github.com/mojaloop/project/issues/3152)
5. **mojaloop/#3020**: add checks for when mongodb is disabled ([central-ledger/pull/927](https://github.com/mojaloop/central-ledger/pull/927)), closes [mojaloop/#3020](https://github.com/mojaloop/project/issues/3020)
6. **mojaloop/#2644**: missing error-code for the transfer in the central-ledger db ([central-ledger/pull/929](https://github.com/mojaloop/central-ledger/pull/929)), closes [mojaloop/#2644](https://github.com/mojaloop/project/issues/2644)
7. **mojaloop/#3096**: unable to upgrade knex dependency on centralLedger ([central-ledger/pull/939](https://github.com/mojaloop/central-ledger/pull/939)), closes [mojaloop/#3096](https://github.com/mojaloop/project/issues/3096)
8. **mojaloop/#2891**: fix outbound fspiop headers ([sdk-scheme-adapter/issues/#436](https://github.com/mojaloop/sdk-scheme-adapter/issues/436)) ([sdk-scheme-adapter/commit/bfce0b0](https://github.com/mojaloop/sdk-scheme-adapter/commit/bfce0b097d40d565da47b5c56a0e7a84ff47fb1d))
9. **mojaloop/#3132**: wso2 auth fix fspiop handler ([sdk-scheme-adapter/issues/#437](https://github.com/mojaloop/sdk-scheme-adapter/issues/437)) ([sdk-scheme-adapter/commit/4260361](https://github.com/mojaloop/sdk-scheme-adapter/commit/4260361f537606de15d114da3aa897e6124e1a34))
10. **mojaloop/#3137**: bulk transactions sdk crash ([sdk-scheme-adapter/issues/#440](https://github.com/mojaloop/sdk-scheme-adapter/issues/440)) ([sdk-scheme-adapter/commit/acb7a01](https://github.com/mojaloop/sdk-scheme-adapter/commit/acb7a0172a3a43d0cc20350622ae68162f4b9252))
11. **mojaloop/#3156**: ML Toolkit Mobile sim demo having issues with ML V15 RC-1 ([helm/commit/32f2699](https://github.com/mojaloop/helm/commit/32f26994929c86fc249e15ca5ee113769dc61cb3)), closes [mojaloop/#3156](https://github.com/mojaloop/project/issues/3156)
12. **mojaloop/#3053**: fix config async changes ([ml-testing-toolkit/pull/229](https://github.com/mojaloop/ml-testing-toolkit/pull/229)), closes [mojaloop/#3053](https://github.com/mojaloop/project/issues/3053)
13. **mojaloop/#3053**: fix config fetching for monitoring payload condition ([ml-testing-toolkit/pull/228](https://github.com/mojaloop/ml-testing-toolkit/pull/228)), closes [mojaloop/#3053](https://github.com/mojaloop/project/issues/3053)
14. **mojaloop/#3076**: refactor break on error ([ml-testing-toolkit/pull/227](https://github.com/mojaloop/ml-testing-toolkit/pull/227)), closes [mojaloop/#3076](https://github.com/mojaloop/project/issues/3076)
15. **mojaloop/#3000**: parameterized the inbound request size ([ml-testing-toolkit/pull/221](https://github.com/mojaloop/ml-testing-toolkit/pull/221)), closes [mojaloop/#3000](https://github.com/mojaloop/project/issues/3000)
16. **mojaloop/#3165**: post clean up scripts failing ([mojaloop/testing-toolkit-test-cases/pull/117](https://github.com/mojaloop/testing-toolkit-test-cases/pull/117), [mojaloop/helm/pull/557](https://github.com/mojaloop/helm/pull/557)), closes [mojaloop/#3000](https://github.com/mojaloop/project/issues/3165)
17. **mojaloop/#3254**: MongoDB connection URI failing when authentication details contain special chars ([central-ledger/pull/560](https://github.com/mojaloop/central-ledger/pull/951)), closes [mojaloop/#3254](https://github.com/mojaloop/project/issues/3254)
18. **mojaloop/#3255**: MongoDB connection URI failing when authentication details contain special chars ([bulk-api-adapter/pull/560](https://github.com/mojaloop/bulk-api-adapter/pull/96)), closes [mojaloop/#3255](https://github.com/mojaloop/project/issues/3255)
19. **mojaloop/#3256**: MongoDB connection URI failing when authentication details contain special chars ([ml-testing-toolkit/pull/239](https://github.com/mojaloop/ml-testing-toolkit/pull/239)), closes [mojaloop/#3256](https://github.com/mojaloop/project/issues/3256)

## 3. Application versions

1. ml-api-adapter: [v14.0.0](https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0)
2. central-ledger: v16.3.1 -> [v17.0.3](https://github.com/mojaloop/central-ledger/releases/tag/v17.0.3) ([Compare](https://github.com/mojaloop/central-ledger/compare/v16.3.1...v17.0.3))
3. account-lookup-service: [v14.0.0](https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0)
4. quoting-service: [v15.0.2](https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2)
5. central-settlement: [v15.0.0](https://github.com/mojaloop/central-settlement/releases/tag/v15.0.0)
6. bulk-api-adapter: v14.2.0 -> [v15.0.3](https://github.com/mojaloop/bulk-api-adapter/releases/tag/v15.0.3) ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v14.2.0...v15.0.3))
7. central-event-processor: [v12.0.0](https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
8. email-notifier: [v12.0.0](https://github.com/mojaloop/email-notifier/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
9. als-oracle-pathfinder: [v12.0.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0)
10. transaction-requests-service: [v14.0.1](https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.0.1)
11. finance-portal-ui: [v10.4.3](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3) *(DEPRECATED)*
12. finance-portal-backend-service: [v15.0.2](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2) *(DEPRECATED)*
13. settlement-management: [v11.0.0](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0) *(DEPRECATED)*
14. operator-settlement: [v11.0.0](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0) *(DEPRECATED)*
15. event-sidecar: [v12.0.0](https://github.com/mojaloop/event-sidecar/releases/tag/v12.0.0)
16. event-stream-processor: [v12.0.0-snapshot.7](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7)
17. simulator: [12.0.0](https://github.com/mojaloop/simulator/releases/tag/v12.0.0)
18. mojaloop-simulator: v13.0.1 -> [v14.0.1](https://github.com/mojaloop/mojaloop-simulator/releases/tag/v14.0.1) ([Compare](https://github.com/mojaloop/mojaloop-simulator/compare/v13.0.1...v14.0.1))
19. sdk-scheme-adapter: v21.4.0 -> [v22.0.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v22.0.1) ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v21.4.0...v22.0.1))
20. ml-testing-toolkit: v15.7.0 -> [v16.1.1](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v16.1.1) ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v15.0.0...v16.1.1))
21. ml-testing-toolkit-ui: v15.1.3 -> [v15.3.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.3.0) ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.1.3...v15.3.0))
22. ml-testing-toolkit-client-lib: v1.1.1 -> [v1.2.0](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.0) ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.1.1...v1.2.0))
23. auth-service: v13.0.2 -> [v14.0.0](https://github.com/mojaloop/auth-service/releases/tag/v14.0.0) ([Compare](https://github.com/mojaloop/auth-service/compare/v13.0.2...v14.0.0))
24. als-consent-oracle: [v0.2.0](https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0)
25. thirdparty-api-svc: [v13.0.2](https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2)
26. thirdparty-sdk: [v15.1.0](https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0)

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

1. Backend dependencies have been externalized, see [deploying-backend-dependencies](../README.md#deploying-backend-dependencies) for an example on how to deploy backend dependencies, and refer to the [upgrade-strategy-guide](https://docs.mojaloop.io/technical/deployment-guide/upgrade-strategy-guide.html) for best practices on deployment topologies.
2. The `central-event-processor` and `email-notifier` services are no longer packaged as part of the main Mojaloop Helm chart, but can be deployed independently:

   1. `central-event-processor` - Refer to [centraleventprocessor/values.yaml](../centraleventprocessor/values.yaml) for configuration options.

        Pre-requisites:

        - The `central-event-processor` has a dependency on a `MongoDB` datastore.
        - Refer to [example-mojaloop-backend](../example-mojaloop-backend/README.md) for an example on how to deploy this dependency. This can be enabled in the [example-mojaloop-backend/values.yaml](../example-mojaloop-backend/values.yaml)  by setting `cep-mongodb.enabled` to `true`.

        Use the following command to deploy `central-event-processor` :

        ```bash
        helm -n <NAMESPACE> install mojaloop/centraleventprocessor -v <VERSION> -f <CUSTOMIZED_VALUES.yaml>
        ```

   2. `email-notifier` - Refer to [emailnotifier/values.yaml](../emailnotifier/values.yaml) for configuration options.

        Pre-requisites:

        - The `email-notifier` has a dependency on a `Kafka`.
        - Refer to [example-mojaloop-backend](../example-mojaloop-backend/README.md) for an example on how to deploy this dependency. This can be enabled in the [example-mojaloop-backend/values.yaml](../example-mojaloop-backend/values.yaml)  by setting `kafka.enabled` to `true`.

        Use the following command to deploy `email-notifier`:

        ```bash
        helm -n <NAMESPACE> install mojaloop/emailnotifier -v <VERSION> -f <CUSTOMIZED_VALUES.yaml>
        ```

3. The `central` wrapper chart has been removed and the child charts have been flattened to the project root folder. This means the following charts are now configured at a root level for the [mojaloop/values.yaml](../mojaloop/values.yaml):
    - `centralledger`
    - `centralsettlements`
4. Charts have been re-factored for consistency, which will impact the following value configs. These are not necessarily breaking changes, but you will need to ensure any customized values files are updated to reflect these changes:
    - Image, Command definitions have been made consistent, with added "debug" added.
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
7. Migrations `tableName` for the Thirdparty Auth-Svc has changed from `auth-svc` to `migration` for consistency. If you have an existing migrated/seeded database, ensure that you rename this table to `migration` or otherwise manually customize your configuration ([values.yaml](../mojaloop/values.yaml)) to use `"tableName": "auth-svc",` instead of `"tableName": "migration"`.
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

1. This release has been validated against the following dependency Test Matrix:

    | Dependency | Version |  Notes   |
    | ---------- | ------- | --- |
    | Kubernetes | v1.24.8 |  [Rancher v2.6.8](https://www.suse.com/suse-rancher/support-matrix/all-supported-versions/rancher-v2-6-8/)   |
    | Docker  |  v20.10.21  |  |
    | Nginx Ingress Controller | rancher/nginx-ingress-controller:nginx-1.2.1-rancher1 |     |
    |  Ubuntu   |  v20.04 LTS   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v15.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0)   |     |
    |  example-mojaloop-backend   |  v15.0.0   |  [README](../example-mojaloop-backend/README.md)   |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases for v15.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0) Golden Path collections expects:
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

    Refer to the [Testing Deployments](../README.md#testing-deployments) section in the main README for detailed information on how to enable bulk-api-adapter tests.

7. Thirdparty API Helm Tests

    Refer to [thirdparty/README.md#validating-and-testing-the-3p-api](../thirdparty/README.md#validating-and-testing-the-3p-api) on how to enabled and execute Thirdparty verification tests.

8. Testing the new Bulk functionality (sdk-scheme-adapter)

    For details regarding deployment and validation of simulators needed for bulk (for adoption provided in sdk-scheme-adapter) refer to [deploying Mojaloop TTK simulators](../mojaloop-ttk-simulators/README.md).

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

- Organizations: BMGF, CrossLake, InFiTX
- Individuals: @chris-me-law , @dfry , @elnyry-sam-k , @kirgene , @kleyow , @PaulGregoryBaker , @mdebarros , @sri-miriyala , @tdaly61 , @vijayg10

*Note: companies are in alphabetical order, individuals are in no particular order.*
