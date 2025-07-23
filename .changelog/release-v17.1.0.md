# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2025-07-23 | 0 | Initial draft

## 0. Summary

Enhancements and breaking changes to the [v17.0.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v17.0.0.md), which includes:

_Release summary points go here..._

## 1. New Features
* **mojaloop/#541** reset party mappings in inter-scheme scenario ([mojaloop/#541](https://github.com/mojaloop/account-lookup-service/pull/541)), closes [mojaloop/#541](https://github.com/mojaloop/project/issues/541)
* **mojaloop/#546** refactored oracleRequest ([mojaloop/#546](https://github.com/mojaloop/account-lookup-service/pull/546)), closes [mojaloop/#546](https://github.com/mojaloop/project/issues/546)
* **mojaloop/#549** use updated AxiosHttpRequester ([mojaloop/#549](https://github.com/mojaloop/account-lookup-service/pull/549)), closes [mojaloop/#549](https://github.com/mojaloop/project/issues/549)
* **mojaloop/#556** used ha timeout design with redlock impl ([mojaloop/#556](https://github.com/mojaloop/account-lookup-service/pull/556)), closes [mojaloop/#556](https://github.com/mojaloop/project/issues/556)
* **mojaloop/#1172** timeout handler distributed lock ([mojaloop/#1172](https://github.com/mojaloop/central-ledger/pull/1172)), closes [mojaloop/#1172](https://github.com/mojaloop/project/issues/1172)
* **mojaloop/#1185** moved distLock to central-services-shared ([mojaloop/#1185](https://github.com/mojaloop/central-ledger/pull/1185)), closes [mojaloop/#1185](https://github.com/mojaloop/project/issues/1185)
* **mojaloop/#407** improved logging;  added BaseQuotesModel ([mojaloop/#407](https://github.com/mojaloop/quoting-service/pull/407)), closes [mojaloop/#407](https://github.com/mojaloop/project/issues/407)
* **mojaloop/#409** use updated AxiosHttpRequester ([mojaloop/#409](https://github.com/mojaloop/quoting-service/pull/409)), closes [mojaloop/#409](https://github.com/mojaloop/project/issues/409)
* **mojaloop/#572** use updated AxiosHttpRequester ([mojaloop/#572](https://github.com/mojaloop/sdk-scheme-adapter/pull/572)), closes [mojaloop/#572](https://github.com/mojaloop/project/issues/572)
* **mojaloop/#574** added InboundPingModel ([mojaloop/#574](https://github.com/mojaloop/sdk-scheme-adapter/pull/574)), closes [mojaloop/#574](https://github.com/mojaloop/project/issues/574)

## 2. Bug Fixes
* **mojaloop/#547** delete participant audit ([mojaloop/#547](https://github.com/mojaloop/account-lookup-service/pull/547)), closes [mojaloop/#547](https://github.com/mojaloop/project/issues/547)
* **mojaloop/#1173** fix issue with broker reporting OK when kafka is disconnected ([mojaloop/#1173](https://github.com/mojaloop/central-ledger/pull/1173)), closes [mojaloop/#1173](https://github.com/mojaloop/project/issues/1173)
* **mojaloop/#1181** fixed issue with DIST_LOCK config ([mojaloop/#1181](https://github.com/mojaloop/central-ledger/pull/1181)), closes [mojaloop/#1181](https://github.com/mojaloop/project/issues/1181)
* **mojaloop/#1182** fixed issue with DIST_LOCK config ([mojaloop/#1182](https://github.com/mojaloop/central-ledger/pull/1182)), closes [mojaloop/#1182](https://github.com/mojaloop/project/issues/1182)
* **mojaloop/#1183** fixed misleading log ([mojaloop/#1183](https://github.com/mojaloop/central-ledger/pull/1183)), closes [mojaloop/#1183](https://github.com/mojaloop/project/issues/1183)
* **mojaloop/#1189** switch to mysql2 client and update version for mysql v8 auth compatibility ([mojaloop/#1189](https://github.com/mojaloop/central-ledger/pull/1189)), closes [mojaloop/#1189](https://github.com/mojaloop/project/issues/1189)

## 3. Application Versions

1. event-sidecar: v14.0.3 ->                     [v14.2.0](https://github.com/mojaloop/event-sidecar/releases/v14.2.0)                     ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.0.3...v14.2.0))
2. auth-service: v15.1.2 ->                     [v15.2.6](https://github.com/mojaloop/auth-service/releases/v15.2.6)                     ([Compare](https://github.com/mojaloop/auth-service/compare/v15.1.2...v15.2.6))
3. als-msisdn-oracle-svc: v0.0.14 ->                     [v0.0.21](https://github.com/mojaloop/als-msisdn-oracle-svc/releases/v0.0.21)                     ([Compare](https://github.com/mojaloop/als-msisdn-oracle-svc/compare/v0.0.14...v0.0.21))
4. ml-api-adapter: v16.4.1 ->                     [v16.5.6](https://github.com/mojaloop/ml-api-adapter/releases/v16.5.6)                     ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v16.4.1...v16.5.6))
5. ml-testing-toolkit-client-lib: v1.9.0 ->                     [v1.10.1](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.10.1)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.9.0...v1.10.1))
6. callback-handler-simulator-svc:  ->                     [v0.1.3](https://github.com/mojaloop/callback-handler-simulator-svc/releases/v0.1.3)                     ([Compare](https://github.com/mojaloop/callback-handler-simulator-svc/compare/...v0.1.3))
7. merchant-acquirer-backend:  ->                     [1.0.1](https://github.com/mojaloop/merchant-acquirer-backend/releases/1.0.1)                     ([Compare](https://github.com/mojaloop/merchant-acquirer-backend/compare/...1.0.1))
8. sdk-scheme-adapter: v24.6.2 ->                     [v24.10.3](https://github.com/mojaloop/sdk-scheme-adapter/releases/v24.10.3)                     ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v24.6.2...v24.10.3))
9. mojaloop-simulator: v15.3.0 ->                     [v15.4.1](https://github.com/mojaloop/mojaloop-simulator/releases/v15.4.1)                     ([Compare](https://github.com/mojaloop/mojaloop-simulator/compare/v15.3.0...v15.4.1))
10. thirdparty-api-svc: v15.0.2 ->                     [v15.1.1](https://github.com/mojaloop/thirdparty-api-svc/releases/v15.1.1)                     ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v15.0.2...v15.1.1))
11. als-consent-oracle: v1.0.1 ->                     [v1.1.3](https://github.com/mojaloop/als-consent-oracle/releases/v1.1.3)                     ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v1.0.1...v1.1.3))
12. account-lookup-service: v17.7.1 ->                     [v17.12.0](https://github.com/mojaloop/account-lookup-service/releases/v17.12.0)                     ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v17.7.1...v17.12.0))
13. simulator: v12.2.5 ->                     [v12.3.1](https://github.com/mojaloop/simulator/releases/v12.3.1)                     ([Compare](https://github.com/mojaloop/simulator/compare/v12.2.5...v12.3.1))
14. merchant-acquirer-frontend:  ->                     [1.0.1](https://github.com/mojaloop/merchant-acquirer-frontend/releases/1.0.1)                     ([Compare](https://github.com/mojaloop/merchant-acquirer-frontend/compare/...1.0.1))
15. quoting-service: v17.7.1 ->                     [v17.12.0](https://github.com/mojaloop/quoting-service/releases/v17.12.0)                     ([Compare](https://github.com/mojaloop/quoting-service/compare/v17.7.1...v17.12.0))
16. merchant-registry-oracle:  ->                     [1.0.1](https://github.com/mojaloop/merchant-registry-oracle/releases/1.0.1)                     ([Compare](https://github.com/mojaloop/merchant-registry-oracle/compare/...1.0.1))
17. central-ledger: v19.3.0 ->                     [v19.8.0](https://github.com/mojaloop/central-ledger/releases/v19.8.0)                     ([Compare](https://github.com/mojaloop/central-ledger/compare/v19.3.0...v19.8.0))
18. ml-core-test-harness:  ->                     [v2.3.0](https://github.com/mojaloop/ml-core-test-harness/releases/v2.3.0)                     ([Compare](https://github.com/mojaloop/ml-core-test-harness/compare/...v2.3.0))
19. event-stream-processor: v12.0.0-snapshot.14 ->                     [v12.0.0-snapshot.15](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.15)                     ([Compare](https://github.com/mojaloop/event-stream-processor/compare/v12.0.0-snapshot.14...v12.0.0-snapshot.15))
20. central-settlement: v17.0.6 ->                     [v17.2.0](https://github.com/mojaloop/central-settlement/releases/v17.2.0)                     ([Compare](https://github.com/mojaloop/central-settlement/compare/v17.0.6...v17.2.0))
21. email-notifier: v14.0.3 ->                     [v14.1.3](https://github.com/mojaloop/email-notifier/releases/v14.1.3)                     ([Compare](https://github.com/mojaloop/email-notifier/compare/v14.0.3...v14.1.3))
22. central-event-processor: [v12.1.1](https://github.com/mojaloop/central-event-processor/releases/v12.1.1)
23. bulk-api-adapter: [v17.1.9](https://github.com/mojaloop/bulk-api-adapter/releases/v17.1.9)
24. ml-testing-toolkit-ui: [v16.2.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v16.2.0)
25. als-oracle-pathfinder: [v12.1.3](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.1.3)
26. ml-testing-toolkit: [v18.11.2](https://github.com/mojaloop/ml-testing-toolkit/releases/v18.11.2)
27. transaction-requests-service: [v14.3.9](https://github.com/mojaloop/transaction-requests-service/releases/v14.3.9)
28. inter-scheme-proxy-adapter: [v1.3.3](https://github.com/mojaloop/inter-scheme-proxy-adapter/releases/v1.3.3)
29. thirdparty-sdk: [v15.1.3](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.3)

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
    |  Testing Toolkit Test Cases   |  [v17.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v17.1.0)   |     |
    |  example-mojaloop-backend   |  v17.1.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

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
  * config/default.json: (https://github.com/mojaloop/central-ledger/blob/202db3ea95883c36158733ae33ccfa198c1c5332/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/central-ledger/blob/202db3ea95883c36158733ae33ccfa198c1c5332/docker%2Fcentral-ledger%2Fdefault.json)
  * migrations/310403_participantPositionChange-participantCurrencyId.js: (https://github.com/mojaloop/central-ledger/blob/202db3ea95883c36158733ae33ccfa198c1c5332/migrations%2F310403_participantPositionChange-participantCurrencyId.js)
### als-msisdn-oracle-svc
  * config/default.json: (https://github.com/mojaloop/als-msisdn-oracle-svc/blob/41f9f1e836663250de6bfc5d6fa898c6aef1b059/config%2Fdefault.json)
### ml-api-adapter
  * docker/central-ledger/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/e3a51ca8f48df9349555638597837bbe1e2a43cc/docker%2Fcentral-ledger%2Fdefault.json)
### quoting-service
  * config/default.json: (https://github.com/mojaloop/quoting-service/blob/d02fd873050d67086b4201984444d3e345f08406/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/quoting-service/blob/d02fd873050d67086b4201984444d3e345f08406/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/quoting-service/default.json: (https://github.com/mojaloop/quoting-service/blob/d02fd873050d67086b4201984444d3e345f08406/docker%2Fquoting-service%2Fdefault.json)
### central-settlement
  * config/default.json: (https://github.com/mojaloop/central-settlement/blob/ec07c1e8cc28497ed3593e28c5839937768e29c8/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/central-settlement/blob/ec07c1e8cc28497ed3593e28c5839937768e29c8/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/central-settlement/default.json: (https://github.com/mojaloop/central-settlement/blob/ec07c1e8cc28497ed3593e28c5839937768e29c8/docker%2Fcentral-settlement%2Fdefault.json)
### als-consent-oracle
  * config/default.json: (https://github.com/mojaloop/als-consent-oracle/blob/f09481826d62c27857d4e964a43d9471e0c2ec3e/config%2Fdefault.json)
### account-lookup-service
  * config/default.json: (https://github.com/mojaloop/account-lookup-service/blob/42e14267b5c006b44342983bc85c29af98f78c1f/config%2Fdefault.json)
  * docker/account-lookup-service/default.json: (https://github.com/mojaloop/account-lookup-service/blob/42e14267b5c006b44342983bc85c29af98f78c1f/docker%2Faccount-lookup-service%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/account-lookup-service/blob/42e14267b5c006b44342983bc85c29af98f78c1f/docker%2Fcentral-ledger%2Fdefault.json)

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
- Individuals: @dependabot[bot], @devarsh10, @geka-evk, @gibaros, @kalinkrustev, @kirgene, @kleyow, @oderayi, @s-prak, @shashi165, @vijayg10

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v17.0.0...v17.1.0
