# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2024-07-09 | 0 | Initial draft

## 0. Summary

Enhancements and breaking changes to the [v16.0.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v16.0.0.md), which includes:

_Release summary points go here..._

## 1. New Features
* **mojaloop/#3984** update ci, deps and audit ([mojaloop/#135](https://github.com/mojaloop/auth-service/pull/135)), closes [mojaloop/#3984](https://github.com/mojaloop/project/issues/3984)
* **mojaloop/#109** parameterize switch id ([mojaloop/#109](https://github.com/mojaloop/bulk-api-adapter/pull/109)), closes [mojaloop/#109](https://github.com/mojaloop/project/issues/109)
* **mojaloop/#: used https.Agent for WSO2 requests in api-svc (** used https.Agent for WSO2 requests in api-svc ([mojaloop/#457](https://github.com/mojaloop/sdk-scheme-adapter/pull/457)), closes [mojaloop/#: used https.Agent for WSO2 requests in api-svc (](https://github.com/mojaloop/project/issues/: used https.Agent for WSO2 requests in api-svc ()
* **mojaloop/#260** parameterize switch id ([mojaloop/#260](https://github.com/mojaloop/simulator/pull/260)), closes [mojaloop/#260](https://github.com/mojaloop/project/issues/260)
* **mojaloop/#3984** parameterize switch id ([mojaloop/#94](https://github.com/mojaloop/thirdparty-api-svc/pull/94)), closes [mojaloop/#3984](https://github.com/mojaloop/project/issues/3984)
* **mojaloop/#103** parameterize switch id ([mojaloop/#103](https://github.com/mojaloop/transaction-requests-service/pull/103)), closes [mojaloop/#103](https://github.com/mojaloop/project/issues/103)

## 2. Bug Fixes
* **mojaloop/#3829** added jwsSigner defining to PUT /participants callback ([mojaloop/#472](https://github.com/mojaloop/account-lookup-service/pull/472)), closes [mojaloop/#3829](https://github.com/mojaloop/project/issues/3829)
* **mojaloop/#3750** add timer for party lookup in cache ([mojaloop/#471](https://github.com/mojaloop/sdk-scheme-adapter/pull/471)), closes [mojaloop/#3750](https://github.com/mojaloop/project/issues/3750)

## 3. Application Versions

1. bulk-api-adapter: v17.0.0 ->                     [v17.1.0](https://github.com/mojaloop/bulk-api-adapter/releases/v17.1.0)                     ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v17.0.0...v17.1.0))
2. event-sidecar: v14.0.0 ->                     [v14.0.1](https://github.com/mojaloop/event-sidecar/releases/v14.0.1)                     ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.0.0...v14.0.1))
3. ml-testing-toolkit-ui: v15.4.2 ->                     [v15.5.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v15.5.0)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.4.2...v15.5.0))
4. auth-service: v15.0.0 ->                     [v15.1.0](https://github.com/mojaloop/auth-service/releases/v15.1.0)                     ([Compare](https://github.com/mojaloop/auth-service/compare/v15.0.0...v15.1.0))
5. ml-testing-toolkit: v17.1.1 ->                     [v17.2.3](https://github.com/mojaloop/ml-testing-toolkit/releases/v17.2.3)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v17.1.1...v17.2.3))
6. transaction-requests-service: v14.1.2 ->                     [v14.2.0](https://github.com/mojaloop/transaction-requests-service/releases/v14.2.0)                     ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.1.2...v14.2.0))
7. ml-api-adapter: v14.0.5 ->                     [v14.0.7](https://github.com/mojaloop/ml-api-adapter/releases/v14.0.7)                     ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v14.0.5...v14.0.7))
8. sdk-scheme-adapter: v23.4.0 ->                     [v23.5.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/v23.5.1)                     ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v23.4.0...v23.5.1))
9. thirdparty-api-svc: v14.0.0 ->                     [v15.0.0](https://github.com/mojaloop/thirdparty-api-svc/releases/v15.0.0)                     ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v14.0.0...v15.0.0))
10. account-lookup-service: v15.2.3 ->                     [v15.3.4](https://github.com/mojaloop/account-lookup-service/releases/v15.3.4)                     ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v15.2.3...v15.3.4))
11. simulator: v12.1.0 ->                     [v12.2.0](https://github.com/mojaloop/simulator/releases/v12.2.0)                     ([Compare](https://github.com/mojaloop/simulator/compare/v12.1.0...v12.2.0))
12. central-ledger: v17.6.0 ->                     [v17.6.1](https://github.com/mojaloop/central-ledger/releases/v17.6.1)                     ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.6.0...v17.6.1))
13. central-event-processor: [v12.1.0](https://github.com/mojaloop/central-event-processor/releases/v12.1.0)
14. als-oracle-pathfinder: [v12.1.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.1.0)
15. ml-testing-toolkit-client-lib: [v1.2.2](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.2.2)
16. mojaloop-simulator: [v15.0.0](https://github.com/mojaloop/mojaloop-simulator/releases/v15.0.0)
17. als-consent-oracle: [v0.2.2](https://github.com/mojaloop/als-consent-oracle/releases/v0.2.2)
18. quoting-service: [v15.7.0](https://github.com/mojaloop/quoting-service/releases/v15.7.0)
19. thirdparty-sdk: [v15.1.1](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.1)
20. event-stream-processor: [v12.0.0-snapshot.9](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.9)
21. central-settlement: [v16.0.0](https://github.com/mojaloop/central-settlement/releases/v16.0.0)
22. email-notifier: [v14.0.0](https://github.com/mojaloop/email-notifier/releases/v14.0.0)

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
    | Kubernetes | v1.29 | [AWS EKS](https://aws.amazon.com/eks/), [AWS EKS Supported Version Notes](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)  |
    | containerd  |  v1.6.19  |  |
    | Nginx Ingress Controller | [helm-ingress-nginx-4.7.0](https://github.com/kubernetes/ingress-nginx/releases/tag/helm-chart-4.7.0) / [ingress-controller-v1.8.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.8.0) |     |
    |  Amazon Linux   |  v2   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v16.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v16.1.0)   |     |
    |  example-mojaloop-backend   |  v15.0.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

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

    Refer to the [Testing Deployments](https://github.com/mojaloop/helm/blob/main/README.md#testing-deployments) section in the main README for detailed information on how to enable bulk-api-adapter tests.

7. Thirdparty API Helm Tests

    Refer to [thirdparty/README.md#validating-and-testing-the-3p-api](https://github.com/mojaloop/helm/blob/main/thirdparty/README.md#validating-and-testing-the-3p-api) on how to enabled and execute Thirdparty verification tests.

8. Testing the Bulk functionality including "sdk-scheme-adapter"

    For details regarding deployment and validation of simulators needed for bulk (for adoption provided in sdk-scheme-adapter) refer to [deploying Mojaloop TTK simulators](https://github.com/mojaloop/helm/blob/main/mojaloop-ttk-simulators/README.md).

## 6. Breaking Changes


### central-ledger
  * config/default.json: (https://github.com/mojaloop/central-ledger/blob/4165045e2c8d0cfb15730bd9090eeca6e6bba606/config%2Fdefault.json)
### bulk-api-adapter
  * config/default.json: (https://github.com/mojaloop/bulk-api-adapter/blob/6ce22e8fb8d5d9bc1e0d9f7501f04f0abef7bf99/config%2Fdefault.json)
  * docker/bulk-api-adapter/default.json: (https://github.com/mojaloop/bulk-api-adapter/blob/6ce22e8fb8d5d9bc1e0d9f7501f04f0abef7bf99/docker%2Fbulk-api-adapter%2Fdefault.json)
### transaction-requests-service
  * config/default.json: (https://github.com/mojaloop/transaction-requests-service/blob/e8d0289ed82977d4c2ae5ef43933ff3356189f39/config%2Fdefault.json)
### thirdparty-api-svc
  * config/default.json: (https://github.com/mojaloop/thirdparty-api-svc/blob/288270cc576ca957f000d519858f7638e7945ffa/config%2Fdefault.json)

## 7. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
5. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)

## 8. Contributors

- Organizations: BMGF, InFiTX, MLF
- Individuals: @TWith2Sugars, @dependabot[bot], @devarsh10, @elnyry-sam-k, @geka-evk, @kalinkrustev, @kleyow, @oderayi, @vijayg10

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v16.0.0...v16.1.0
