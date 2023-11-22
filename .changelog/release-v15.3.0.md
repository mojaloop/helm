# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-11-22 | 0 | Initial draft

- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 0. Summary

Enhancements and non-breaking changes to the [v15.2.0 Release](https://github.com/mojaloop/helm/blob/master/.changelog/release-v15.2.0.md), which includes:

1. Nodejs version of core and supporting services upgraded to v18.17.1 LTS
2. Performance improvements and metrics around core services: ALS, Central Ledger, Quoting Service based on characterisation and fixes, enhancements done
3. General maintenance and bug fixes

## 1. New Features

1. **Performance fixes, enhancements and maintenance:**  
      * **mojaloop/#2880** simplify liquidity cover check and fix issue with validation (for main) (https://github.com/mojaloop/central-ledger/issues/918) ([825faf7](https://github.com/mojaloop/central-ledger/commit/825faf7c1c918b12eddedeb97eea0a2d563457e4)) - https://github.com/mojaloop/central-ledger/releases/tag/v17.0.4
      * **mojaloop/#2928** Upgrade Mojaloop Simulator Logging ([mojaloop-simulator/#2928](https://github.com/mojaloop/mojaloop-simulator/pull/148)), closes [mojaloop/#3564](https://github.com/mojaloop/project/issues/3564)
      * **mojaloop/#3264** SDK - Implement restart functionality for Bulk related outbound requests after PM4ML onboarding ([sdk-scheme-adapter](https://github.com/mojaloop/sdk-scheme-adapter/pull/454)), closes [mojaloop/3264](https://github.com/mojaloop/project/issues/3264)
     
## 2. Bug Fixes

1. **mojaloop/#2734** Failures in daily cronjob GP tests ([mojaloop-simulator](https://github.com/mojaloop/mojaloop-simulator/pull/146)), closes [mojaloop/2734](https://github.com/mojaloop/project/issues/2734)
2. **mojaloop/#3474** CL Cache expiration values higher than default causes transfer to fail ([central-ledger/pull/966](https://github.com/mojaloop/central-ledger/pull/966)), closes [mojaloop/#3474](https://github.com/mojaloop/project/issues/3474)

## 3. Application versions

1. central-ledger: v17.3.2 -> [v17.3.3]((https://github.com/mojaloop/central-ledger/releases/tag/v17.3.3)) ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.3.2...v17.3.3))
2. ml-testing-toolkit-client-lib: v1.2.0 -> [v1.2.1](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.1)
3. ml-api-adapter: [v14.0.5](https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.5)
4. account-lookup-service: [v15.0.0](https://github.com/mojaloop/account-lookup-service/releases/tag/v15.0.0)
5. quoting-service: [v15.5.0](https://github.com/mojaloop/quoting-service/releases/tag/v15.5.0)
6. central-settlement: [v16.0.0](https://github.com/mojaloop/central-settlement/releases/tag/v16.0.0)
7. bulk-api-adapter: [v17.0.0](https://github.com/mojaloop/bulk-api-adapter/releases/tag/v17.0.0)
8. central-event-processor: [v12.0.0](https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0)
9. email-notifier: [v14.0.0](https://github.com/mojaloop/email-notifier/releases/tag/v14.0.0)
10. als-oracle-pathfinder: [v12.0.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0)
11. transaction-requests-service: [v14.1.2](https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.1.2)
12. event-sidecar: [v14.0.0](https://github.com/mojaloop/event-sidecar/releases/tag/v14.0.0)
13. event-stream-processor: [v12.0.0-snapshot.7](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7)
14. simulator: [12.0.0](https://github.com/mojaloop/simulator/releases/tag/v12.0.0)
15. mojaloop-simulator: [v15.0.0](https://github.com/mojaloop/mojaloop-simulator/releases/tag/v15.0.0)
16. sdk-scheme-adapter: [v23.1.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v23.1.1)
17. ml-testing-toolkit: [v17.0.0](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v17.0.0)
19. ml-testing-toolkit-ui: [v15.4.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.3.0)
20. auth-service: [v15.0.0](https://github.com/mojaloop/auth-service/releases/tag/v15.0.0)
21. als-consent-oracle: [v0.2.2](https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.2)
22. thirdparty-api-svc: [v14.0.0](https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v14.0.0)
23. thirdparty-sdk: v15.1.0 -> [v15.1.1](https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.1)


## 4. API Versions

This release supports the following versions of the [Mojaloop family of APIs](https://docs.mojaloop.io/api):

| API         | Supported Versions                                                                                                                                    | Notes |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| FSPIOP      | [v1.1](https://docs.mojaloop.io/api/fspiop/v1.1/api-definition.html), [v1.0](https://docs.mojaloop.io/api/fspiop/v1.0/api-definition.html) |       |
| Settlements | [v2.0](https://docs.mojaloop.io/api/settlement)                                                                                            |       |
| Admin       | [v1.0](https://docs.mojaloop.io/api/administration/central-ledger-api.html)                                                                |       |
| Oracle      | [v1.0](https://docs.mojaloop.io/legacy/api/als-oracle-api-specification.html)                                                              |       |
| Thirdparty  | [v1.0](https://docs.mojaloop.io/api/thirdparty)                                                                                            |       |

## 5. Testing notes

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

## 6. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
5. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)

## 7. Contributors

- Organizations: BMGF, InFiTX
- Individuals: @vijayg10, @oderayi, @elnyry-sam-k, @aaronreynoza

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v15.1.0...v15.2.0