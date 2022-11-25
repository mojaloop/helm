# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2022-10-20 | 0 | Initial draft of RC
 2022-11-22 | 0 | Initial release v14.1.0

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 1. New Features

v14.1.0 includes two major updates, features and a few minor ones

1. **Bulk MVP feature for FSPs**: [Bulk support for FSPs](https://github.com/mojaloop/documentation/tree/master/docs/technical/sdk-scheme-adapter/BulkEnhancements) implemented to accelerate, support adoption. Epics: [Implementation epic #2797](https://github.com/mojaloop/project/issues/2797), [Testing epic #2805](https://github.com/mojaloop/project/issues/2805). Testing strategy [here](https://docs.mojaloop.io/technical/sdk-scheme-adapter/BulkEnhancements/SDKBulk-Tests.html)
2. **Mojaloop Helm support for Kubernetes networking:** Mojaloop Helm support for Kubernetes networking.k8s.io/v1 (Ingress), mojaloop/#2352 ([mojaloop/helm/pull/#508](https://github.com/mojaloop/helm/pull/508)), closes [mojaloop/#2352](https://github.com/mojaloop/project/issues/2352)

## 2. Bug Fixes

1. **mojaloop/#2796** Duplicate transaction not getting callback for post /bulkTransfers ([central-ledger/pull/915](https://github.com/mojaloop/central-ledger/pull/915)), closes [mojaloop/#2796](https://github.com/mojaloop/project/issues/2796)
2. **mojaloop/#2798** No error callback when there's an Inactive participant in the transaction ([central-ledger/pull/#911](https://github.com/mojaloop/central-ledger/pull/911), [central-ledger/pull/#913](https://github.com/mojaloop/central-ledger/pull/913)), closes [mojaloop/#2798](https://github.com/mojaloop/project/issues/2798)
3. **mojaloop/#2800** Invalid dfsp name in header or body does not return any error ([central-ledger/pull/#911](https://github.com/mojaloop/central-ledger/pull/911), [central-ledger/pull/#913](https://github.com/mojaloop/central-ledger/pull/913)), closes [mojaloop/#2800](https://github.com/mojaloop/project/issues/2800)
4. **mojaloop/#2801** Invalid timestamp scenario not shown as failed transaction ([documentation/pull/385](https://github.com/mojaloop/documentation/pull/385), [central-ledger/pull/916](https://github.com/mojaloop/central-ledger/pull/916), [central-services-shared/pull/333](https://github.com/mojaloop/central-services-shared/pull/333), [testing-toolkit-test-cases/pull/81](https://github.com/mojaloop/testing-toolkit-test-cases/pull/81), [helm/pull/492](https://github.com/mojaloop/helm/pull/492)), closes [mojaloop/#2801](https://github.com/mojaloop/project/issues/2801)
5. **mojaloop/#2863** [ML Bulk] PUT /bulkTransfers/{ID} should return proper 200 OK status code ([bulk-api-adapter/pull/#89](https://github.com/mojaloop/bulk-api-adapter/pull/89), [testing-toolkit-test-cases/pull/#83](https://github.com/mojaloop/testing-toolkit-test-cases/pull/83)), closes [mojaloop/#2863](https://github.com/mojaloop/project/issues/2863)
6. **mojaloop/3024** Validation issues in Bulk fulfil handler, invalidating Switch as destination on Fulfil reqeusts from Payee FSP. PRs: [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/pull/98), [fix mojaloop/#3024](https://github.com/mojaloop/central-ledger/pull/926)
7. **Testing-Toolkit**:
   1. **mojaloop/#2995** mobile simulator not responding ([ml-testing-toolkit-ui/pull/141](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/141), [helm/pull/512](https://github.com/mojaloop/helm/pull/512)), closes [mojaloop/#2994](https://github.com/mojaloop/project/issues/2995)

## 3. Application versions

1. ml-api-adapter: **v14.0.0**
2. central-ledger: v15.1.2.1 -> **v16.3.1** ([Compare](https://github.com/mojaloop/central-ledger/compare/v15.1.2.1...v16.3.1))
3. account-lookup-service: **v14.0.0**
4. quoting-service: **v15.0.2**
5. central-settlement: **v15.0.0**
6. central-event-processor: **v12.0.0**
7. bulk-api-adapter: v14.0.0 -> **v14.2.0** ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v14.0.0...v14.2.0))
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
20. ml-testing-toolkit: v15.0.0 -> **v15.2.0** ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v15.0.0...v15.2.0))
21. ml-testing-toolkit-ui: v15.0.0 -> **v15.0.1** ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.0.0...v15.0.1))
22. ml-testing-toolkit-client-lib: **v1.0.0**
23. auth-service: **v13.0.2**
24. als-consent-oracle: **v0.2.0**
25. thirdparty-api-svc: **v13.0.2**
26. thirdparty-sdk: **v15.1.0**

## 4. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v16.3.1
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v15.0.0
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v14.2.0
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
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v15.2.0
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.0.1
22. ml-testing-toolkit-client-lib - https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.0.0
23. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v13.0.2
24. als-consent-oracle - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0
25. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2
26. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0

## 5. Breaking changes

1. Mojaloop Helm Chart Ingress's have been refactored to support Kubernetes networking.k8s.io/v1 as part of [mojaloop/#2352](https://github.com/mojaloop/project/issues/2352). This means that Mojaloop v14.1.0 Helm release should support Kubernetes versions v1.22 onwards, however keep in mind that we have only tested this release with the current supported Kubernetes version v1.24.

    What is the impact from v14.0.0?

    1. Ingress Configs have changed. Please compare the Ingress values in [mojaloop/values.yaml](../mojaloop/values.yaml) configs to your customized config to see what changes are required.
    2. Upgrades are supported from v14.0.0 to this release (v14.1.0), but ensure your Ingress configurations have been updated to reflect the above changes.
    3. Take note that this change is part of a wider initiative to improve the maintainability of the Mojaloop Helm Charts and to support current Kubernetes versions. The next story as part of this initiative is to remove the external backend dependencies from the next Mojaloop Helm Release as part of [mojaloop/#2887](https://github.com/mojaloop/project/issues/2887).

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

1. This release has been tested against the following:
    - Kubernetes: `v1.24.6`
    - Testing Toolkit Test Cases: [v14.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.0.1)

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases for v14.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.1.0)' Golden Path collections expects:
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

- Organizations: BMGF, CrossLake, InFiTX
- Individuals: @chris-me-law , @drfy , @elnyry-sam-k , @kirgene , @kleyow , @PaulGregoryBaker , @mdebarros , @sri-miriyala , @tdaly61 , @vijayg10 

_Note: companies are in alphabetical order, individuals are in no particular order._
