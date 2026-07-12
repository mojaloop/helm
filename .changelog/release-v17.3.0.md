# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2026-07-12 | 0 | Initial draft

## 0. Summary

Enhancements and breaking changes to the [v17.2.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v17.2.0.md), which includes:

_Release summary points go here..._

## 1. New Features
There are no new features in this release.

## 2. Bug Fixes
* **mojaloop/#676** make maxsocket configurable so it doesnt use infinite number of sockets #4480 ([mojaloop/#676](https://github.com/mojaloop/sdk-scheme-adapter/pull/676)), closes [mojaloop/#676](https://github.com/mojaloop/project/issues/676)

## 3. Application Versions

1. central-event-processor: v12.2.5 ->                     [v12.2.6](https://github.com/mojaloop/central-event-processor/releases/v12.2.6)                     ([Compare](https://github.com/mojaloop/central-event-processor/compare/v12.2.5...v12.2.6))
2. bulk-api-adapter: v17.2.5 ->                     [v17.2.7](https://github.com/mojaloop/bulk-api-adapter/releases/v17.2.7)                     ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v17.2.5...v17.2.7))
3. event-sidecar: v14.2.1 ->                     [v14.2.3](https://github.com/mojaloop/event-sidecar/releases/v14.2.3)                     ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.2.1...v14.2.3))
4. auth-service: v15.2.7 ->                     [v15.2.8](https://github.com/mojaloop/auth-service/releases/v15.2.8)                     ([Compare](https://github.com/mojaloop/auth-service/compare/v15.2.7...v15.2.8))
5. transaction-requests-service: v14.4.7 ->                     [v14.4.9](https://github.com/mojaloop/transaction-requests-service/releases/v14.4.9)                     ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.4.7...v14.4.9))
6. ml-api-adapter: v16.9.2 ->                     [v16.10.1](https://github.com/mojaloop/ml-api-adapter/releases/v16.10.1)                     ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v16.9.2...v16.10.1))
7. sdk-scheme-adapter: v24.19.5 ->                     [v24.19.6](https://github.com/mojaloop/sdk-scheme-adapter/releases/v24.19.6)                     ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v24.19.5...v24.19.6))
8. mojaloop-simulator: v15.5.3 ->                     [v15.5.4](https://github.com/mojaloop/mojaloop-simulator/releases/v15.5.4)                     ([Compare](https://github.com/mojaloop/mojaloop-simulator/compare/v15.5.3...v15.5.4))
9. thirdparty-api-svc: v15.1.6 ->                     [v15.1.7](https://github.com/mojaloop/thirdparty-api-svc/releases/v15.1.7)                     ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v15.1.6...v15.1.7))
10. als-consent-oracle: v1.1.7 ->                     [v1.1.8](https://github.com/mojaloop/als-consent-oracle/releases/v1.1.8)                     ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v1.1.7...v1.1.8))
11. quoting-service: v17.14.3 ->                     [v17.14.5](https://github.com/mojaloop/quoting-service/releases/v17.14.5)                     ([Compare](https://github.com/mojaloop/quoting-service/compare/v17.14.3...v17.14.5))
12. event-stream-processor: v12.0.0-snapshot.14 ->                     [v12.0.1](https://github.com/mojaloop/event-stream-processor/releases/v12.0.1)                     ([Compare](https://github.com/mojaloop/event-stream-processor/compare/v12.0.0-snapshot.14...v12.0.1))
13. central-settlement: v17.3.3 ->                     [v17.4.0](https://github.com/mojaloop/central-settlement/releases/v17.4.0)                     ([Compare](https://github.com/mojaloop/central-settlement/compare/v17.3.3...v17.4.0))
14. email-notifier: v14.1.8 ->                     [v14.1.9](https://github.com/mojaloop/email-notifier/releases/v14.1.9)                     ([Compare](https://github.com/mojaloop/email-notifier/compare/v14.1.8...v14.1.9))
15. ml-testing-toolkit-ui: [v16.7.4](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v16.7.4)
16. als-oracle-pathfinder: [v12.3.5](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.3.5)
17. ml-testing-toolkit: [v18.19.2](https://github.com/mojaloop/ml-testing-toolkit/releases/v18.19.2)
18. als-msisdn-oracle-svc: [v0.0.21](https://github.com/mojaloop/als-msisdn-oracle-svc/releases/v0.0.21)
19. als-static-oracle-svc: [v0.0.30](https://github.com/mojaloop/als-static-oracle-svc/releases/v0.0.30)
20. ml-testing-toolkit-client-lib: [v1.12.3](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.12.3)
21. callback-handler-simulator-svc: [v0.1.3](https://github.com/mojaloop/callback-handler-simulator-svc/releases/v0.1.3)
22. merchant-acquirer-backend: [1.0.1](https://github.com/mojaloop/merchant-acquirer-backend/releases/1.0.1)
23. account-lookup-service: [v17.14.11](https://github.com/mojaloop/account-lookup-service/releases/v17.14.11)
24. simulator: [v12.3.6](https://github.com/mojaloop/simulator/releases/v12.3.6)
25. merchant-acquirer-frontend: [1.0.1](https://github.com/mojaloop/merchant-acquirer-frontend/releases/1.0.1)
26. inter-scheme-proxy-adapter: [v1.3.3](https://github.com/mojaloop/inter-scheme-proxy-adapter/releases/v1.3.3)
27. merchant-registry-oracle: [1.0.1](https://github.com/mojaloop/merchant-registry-oracle/releases/1.0.1)
28. ml-iam-services: ["v0.1.2"](https://github.com/mojaloop/ml-iam-services/releases/"v0.1.2")
29. central-ledger: [v19.14.0](https://github.com/mojaloop/central-ledger/releases/v19.14.0)
30. thirdparty-sdk: [v15.1.3](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.3)
31. ml-core-test-harness: [v2.3.0](https://github.com/mojaloop/ml-core-test-harness/releases/v2.3.0)

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
    |  Testing Toolkit Test Cases   |  [v17.3.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v17.3.0)   |     |
    |  example-mojaloop-backend   |  v17.3.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

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


### ml-api-adapter
  * config/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/b25fb41c42bc7943b80762f6cb18096a78fd0a50/config%2Fdefault.json)
### central-settlement
  * config/default.json: (https://github.com/mojaloop/central-settlement/blob/78bc28d3564639343b52828304f35a24c5549420/config%2Fdefault.json)

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
- Individuals: @gibaros, @kleyow, @s-prak, @shashi165

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v17.2.0...v17.3.0
