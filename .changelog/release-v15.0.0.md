# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-02-20 | 0 | Initial draft of RC (~PLACEHOLDER~)

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 1. New Features

1. **mojaloop/#2887** Externalize Backend Dependencies ([helm/pull/915](https://github.com/mojaloop/helm/pull/535), [helm/pull/535](https://github.com/mojaloop/helm/pull/535)), closes [mojaloop/#2887](https://github.com/mojaloop/project/issues/2887)
2. **mojaloop/#3083** Externalize Backend Dependencies for Thirdparty Helm Charts ([helm/pull/538](https://github.com/mojaloop/helm/pull/538)), closes [mojaloop/#3083](https://github.com/mojaloop/project/issues/3083)
3. **mojaloop/#3091** Externalize Backend Dependencies for TTK Helm Charts ([helm/pull/915](https://github.com/mojaloop/helm/pull/915)), closes [mojaloop/#3091](https://github.com/mojaloop/project/issues/3091)
4. **mojaloop/#3082** Utilize externalized secrets for user/password management ([helm/pull/915](https://github.com/mojaloop/helm/pull/915)), closes [mojaloop/#3082](https://github.com/mojaloop/project/issues/3082)
5. **mojaloop/#3078**: get /trans callback is wrong for exp trans ([central-ledger/pull/938](https://github.com/mojaloop/central-ledger/pull/938)), closes [mojaloop/#3078)](https://github.com/mojaloop/project/issues/3078)
6. **mojaloop/#3129**: separate mongodb uri config ([central-ledger/pull/945](https://github.com/mojaloop/central-ledger/pull/945)), closes [mojaloop/#3129)](https://github.com/mojaloop/project/issues/3129)
7. **mojaloop/#3131**: separate mongodb uri config ([bulk-api-adapter/pull/95](https://github.com/mojaloop/bulk-api-adapter/pull/95)), closes [mojaloop/#3131)](https://github.com/mojaloop/project/issues/3131)
8. **mojaloop/#3139**: rework config to accept env variables for DB ([auth-service/pull/132](https://github.com/mojaloop/auth-service/pull/132)), closes [mojaloop/#3131)](https://github.com/mojaloop/project/issues/3139)
9. **mojaloop/#?**: added outbound bulk api ([sdk-scheme-adapter/pull/320](https://github.com/mojaloop/sdk-scheme-adapter/pull/320)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
10. **mojaloop/#?**: bump nodejs version and update central services ([sdk-scheme-adapter/pull/319](https://github.com/mojaloop/sdk-scheme-adapter/pull/319)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
11. **mojaloop/#?**: reformat error information response ([sdk-scheme-adapter/pull/318](https://github.com/mojaloop/sdk-scheme-adapter/pull/318)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
12. **mojaloop/#?**: pull in live reconfiguration logic ([sdk-scheme-adapter/pull/313](https://github.com/mojaloop/sdk-scheme-adapter/pull/313)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
13. **mojaloop/#?**: port over prom client metrics ([sdk-scheme-adapter/pull/312](https://github.com/mojaloop/sdk-scheme-adapter/pull/312)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
14. **mojaloop/#?**: port over prom client metrics ([sdk-scheme-adapter/pull/312](https://github.com/mojaloop/sdk-scheme-adapter/pull/312)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
15. **mojaloop/#?**: port use payee FSPID as GET /parties destination header if provided ([sdk-scheme-adapter/pull/301](https://github.com/mojaloop/sdk-scheme-adapter/pull/301)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
16. **mojaloop/#?**: port control client and service from ml connector ([sdk-scheme-adapter/pull/308](https://github.com/mojaloop/sdk-scheme-adapter/pull/308)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
17. **mojaloop/#?**: merge Mojaloop-Connector into SDK-Scheme-Adapter ([sdk-scheme-adapter/pull/314](https://github.com/mojaloop/sdk-scheme-adapter/pull/314)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
18. **mojaloop/#?**: change config structure and remove unused code ([sdk-scheme-adapter/pull/311](https://github.com/mojaloop/sdk-scheme-adapter/pull/311)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
19. **mojaloop/#?**: update typescript interfaces using latest api-snippets ([sdk-scheme-adapter/pull/297](https://github.com/mojaloop/sdk-scheme-adapter/pull/297)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
20. **mojaloop/#3130**: alter db config and allow password env setting ([ml-testing-toolkit/pull/237](https://github.com/mojaloop/ml-testing-toolkit/pull/237)), closes [mojaloop/#3130)](https://github.com/mojaloop/project/issues/3130)
21. **mojaloop/#3075**: add config option to configure socket io ([ml-testing-toolkit/pull/232](https://github.com/mojaloop/ml-testing-toolkit/pull/232)), closes [mojaloop/#3075)](https://github.com/mojaloop/project/issues/3075)
22. **mojaloop/#3060**: add list reports endpoint ([ml-testing-toolkit/pull/226](https://github.com/mojaloop/ml-testing-toolkit/pull/226)), closes [mojaloop/#3060)](https://github.com/mojaloop/project/issues/3060)
23. **mojaloop/#3058**: added report save option ([ml-testing-toolkit/pull/224](https://github.com/mojaloop/ml-testing-toolkit/pull/224)), closes [mojaloop/#3058)](https://github.com/mojaloop/project/issues/3058)
24. **mojaloop/#3033**: add rule import and export ([ml-testing-toolkit/pull/225](https://github.com/mojaloop/ml-testing-toolkit/pull/225)), closes [mojaloop/#3033)](https://github.com/mojaloop/project/issues/3033)
25. **mojaloop/#2890**: redesigned ttk definition report ([ml-testing-toolkit/pull/223](https://github.com/mojaloop/ml-testing-toolkit/pull/223)), closes [mojaloop/#2890)](https://github.com/mojaloop/project/issues/2890)
26. **mojaloop/#2997**: dynamic ttk rules and request mutation ([ml-testing-toolkit/pull/219](https://github.com/mojaloop/ml-testing-toolkit/pull/219)), closes [mojaloop/#2997)](https://github.com/mojaloop/project/issues/2997)
27. **mojaloop/#2814**: added moja sim inbound api ([ml-testing-toolkit/pull/218](https://github.com/mojaloop/ml-testing-toolkit/pull/218)), closes [mojaloop/#2814)](https://github.com/mojaloop/project/issues/2814)

## 2. Bug Fixes

1. **mojaloop/#3152**: initial open settlementWindow is failing on clean install ([central-ledger/pull/946](https://github.com/mojaloop/central-ledger/pull/946)), closes [mojaloop/#3152](https://github.com/mojaloop/project/issues/3152)
2. **mojaloop/#3020**: add checks for when mongodb is disabled ([central-ledger/pull/927](https://github.com/mojaloop/central-ledger/pull/927)), closes [mojaloop/#3020)](https://github.com/mojaloop/project/issues/3020)
3. **mojaloop/#2644**: missing error-code for the transfer in the central-ledger db ([central-ledger/pull/929](https://github.com/mojaloop/central-ledger/pull/929)), closes [mojaloop/#2644)](https://github.com/mojaloop/project/issues/2644)
4. **mojaloop/#3096**: unable to upgrade knex dependency on centralLedger ([central-ledger/pull/939](https://github.com/mojaloop/central-ledger/pull/939)), closes [mojaloop/#3096)](https://github.com/mojaloop/project/issues/3096)
5. **mojaloop/#?**: reformat error information response ([sdk-scheme-adapter/pull/318](https://github.com/mojaloop/sdk-scheme-adapter/pull/318)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
6. **mojaloop/#?**: update outbound interface and response oa3 defs ([sdk-scheme-adapter/pull/316](https://github.com/mojaloop/sdk-scheme-adapter/pull/316)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
7. **mojaloop/#?**: update package.json with main and type correct path ([sdk-scheme-adapter/pull/315](https://github.com/mojaloop/sdk-scheme-adapter/pull/315)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
8. **mojaloop/#?**: update package.json with main and type correct path ([sdk-scheme-adapter/pull/315](https://github.com/mojaloop/sdk-scheme-adapter/pull/315)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
9. **mojaloop/#?**: make management url config option optional ([sdk-scheme-adapter/pull/310](https://github.com/mojaloop/sdk-scheme-adapter/pull/310)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
10. **mojaloop/#?**: remove outdated koa2-oauth-server and bump to node 16 ([sdk-scheme-adapter/pull/302](https://github.com/mojaloop/sdk-scheme-adapter/pull/302)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
11. **mojaloop/#?**: fix config async changes ([ml-testing-toolkit/pull/229](https://github.com/mojaloop/ml-testing-toolkit/pull/229)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
12. **mojaloop/#?**: fix config fetching for monitoring payload condition ([ml-testing-toolkit/pull/228](https://github.com/mojaloop/ml-testing-toolkit/pull/228)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
13. **mojaloop/#?**: refactor break on error ([ml-testing-toolkit/pull/227](https://github.com/mojaloop/ml-testing-toolkit/pull/227)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)
14. **mojaloop/#?**: parameterized the inbound request size ([ml-testing-toolkit/pull/221](https://github.com/mojaloop/ml-testing-toolkit/pull/221)), closes [mojaloop/#?)](https://github.com/mojaloop/project/issues/?)

## 3. Application versions

1. ml-api-adapter: **v14.0.0**
2. central-ledger: v16.3.1 -> **v17.0.1** ([Compare](https://github.com/mojaloop/central-ledger/compare/v16.3.1...v17.0.1))
3. account-lookup-service: **v14.0.0**
4. quoting-service: **v15.0.2**
5. central-settlement: **v15.0.0**
6. central-event-processor: **v12.0.0**
7. bulk-api-adapter: v14.2.0 -> **v15.0.0** ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v14.2.0...v15.0.0))
8. email-notifier: **v12.0.0**
9. als-oracle-pathfinder: **v12.0.0**
10. transaction-requests-service: **v14.0.1**
11. finance-portal-ui: **v10.4.3** _(DEPRECATED)_
12. finance-portal-backend-service: **v15.0.2** _(DEPRECATED)_
13. settlement-management: **v11.0.0** _(DEPRECATED)_
14. operator-settlement: **v11.0.0** _(DEPRECATED)_
15. event-sidecar: **v12.0.0**
16. event-stream-processor: **v12.0.0-snapshot.7**
17. simulator: **12.0.0**
18. mojaloop-simulator: **v13.0.1**
19. sdk-scheme-adapter: v11.18.11 -> **v21.4.0** ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v11.18.11...v21.4.0))
20. ml-testing-toolkit: v15.7.0 -> **v16.0.0** ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v15.0.0...v16.0.0))
21. ml-testing-toolkit-ui: **v15.1.3**
22. ml-testing-toolkit-client-lib: **v1.1.1**
23. auth-service: v13.0.2 -> **v14.0.0** ([Compare](https://github.com/mojaloop/auth-service/compare/v13.0.2...v14.0.0))
24. als-consent-oracle: **v0.2.0**
25. thirdparty-api-svc: **v13.0.2**
26. thirdparty-sdk: **v15.1.0**

## 4. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v17.0.1
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v15.0.0
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v15.0.0
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v12.0.0
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.0.1
11. finance-portal-ui _(DEPRECATED)_ - https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3
12. finance-portal-backend-service _(DEPRECATED)_ - https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2
13. settlement-management _(DEPRECATED)_ - https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0
14. operator-settlement _(DEPRECATED)_ - https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0
15. event-sidecar - https://github.com/mojaloop/event-sidecar/releases/tag/v12.0.0
16. event-stream-processor - https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v12.0.0
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v13.0.1
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v21.4.0
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v16.0.0
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.1.3
22. ml-testing-toolkit-client-lib - https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.1.1
23. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v14.0.0
24. als-consent-oracle - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0
25. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2
26. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0

## 5. Breaking changes

1. Charts have been re-factored for consistency, which will impact the following value configs. These are not necessarily breaking changes, but you will need to ensure any customized values files are updated to reflect these changes:
    - Image, Command definitions have been made consistent, with added "debug" added.
    - InitContainers definitions have been made consistent.
    - Service definitions have been made consistent.
    - "config" and "config_files" are being used for consistency. This mainly impacts ML-Testing-Toolkit-Backend and ThirdParty Services.
        - "config" is used for general configurations.
        - "config_files" are used for actual config files as per the name.
2. The following services no longer support a "Connection URL" for backend configurations to support Password Injection via Env Vars. You will now explicitly configure the Host, User, Pass, DB, Port, etc instead.
     - Central-Ledger for MongoDB.
     - Bulk-API-Adapter for MongoDB.
     - ML-Testing-Toolkit-Backend for MongoDB.
     - Auth-Service for MySQL.
3. Several ML-Testing-Toolkit Backend Dependencies are no longer needed as the associated functionality has been deprecated
     - removed deprecated dependencies: Keycloak, Connection-Manager

## 6. Deprecations

The following components have been deprecated from the packaged Mojaloop Helm chart release and have been with [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs), which can be deployed by the offical [BoF Helm Chart](https://github.com/mojaloop/charts/tree/master/mojaloop/bof):

- [finance-portal](https://github.com/mojaloop/helm/tree/master/finance-portal) Helm Chart
  - [finance-portal-ui](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3)
  - [finance-portal-backend-service](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2)
- [finance-portal-settlement-management](https://github.com/mojaloop/helm/tree/master/finance-portal-settlement-management) Helm Chart
  - [settlement-management](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0)
  - [operator-settlement](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0)

> _Note these Helm Chart are still available for deployment in the [Mojaloop Helm Repo (http://mojaloop.io/helm/repo/)](http://mojaloop.io/helm/repo/index.yaml)._

This is due to the underlying services having been deprecated by the Micro-Services provided by the [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs) for Financial Management and Reporting.

More information can be found here:

- https://github.com/mojaloop/business-operations-framework-docs.

[BOF Helm charts](https://github.com/mojaloop/charts/tree/master/mojaloop/bof) to deploy the [Business Operation Framework](https://github.com/mojaloop/business-operations-framework-docs) can be found here:

- https://github.com/mojaloop/charts/tree/master/mojaloop/bof

## 7. Testing notes

1. This release has been validated against the following dependency test matrix:

| Dependency | Version |  Notes   |
| ---------- | ------- | --- |
| Kubernetes | v1.24.8 |     |
| Nginx Ingress Controller | ? |     |
|  Ubuntu   |  v?   |     |
|  MySQL   |  v?   |     |
|  Kafka   |  v?   |     |
|  Redis   |  v?   |     |
|  MongoDB   |  v?   |     |
|  Testing Toolkit Test Cases   |  [v15.0.0-snapshot.5](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0-snapshot.5)   |     |
|     |     |     |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases for v15.0.0-snapshot.5](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0-snapshot.5)' Golden Path collections expects:
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
3. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)
4. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
5. [#2740 - GP tests are failing when test currencies are used](https://github.com/mojaloop/project/issues/2740)
6. [#3020 - Bulk prepare handler is freezing if MONGODB is disabled ](https://github.com/mojaloop/project/issues/3020)
7. [#2892 - Disabled DFSP showing getParty info ](https://github.com/mojaloop/project/issues/2892)
8. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
9. [#2644 - Missing Error code for the transfer in the Central ledger DB](https://github.com/mojaloop/project/issues/2644)
10. Testing Toolkit Test Case issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2845 - QA: Replace Legacy-Simulator as a NORESPONSE_SIMPAYEE in Testing-Toolkit Goden Path Test-Suite](https://github.com/mojaloop/project/issues/2845)
    3. [#2846 - QA: Mojaloop TTK GP Test Collections to reset available liquidity after each run](https://github.com/mojaloop/project/issues/2846)
    4. [#3027 - QA: Mojaloop Helm v14.1.0 Release - Bulk Tests fail on first run](https://github.com/mojaloop/project/issues/3027)

## 9. Contributors

- Organizations: TBD
- Individuals: TBD

_Note: companies are in alphabetical order, individuals are in no particular order._
