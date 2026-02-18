# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2026-01-16 | 0 | Initial draft

## 0. Summary

Enhancements and breaking changes to the [v17.1.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v17.1.0.md), which includes:

_Release summary points go here..._

## 1. New Features
* **mojaloop/#574** added validation of local destination for external source ([mojaloop/#574](https://github.com/mojaloop/account-lookup-service/pull/574)), closes [mojaloop/#574](https://github.com/mojaloop/project/issues/574)
* **mojaloop/#578** improve inter-scheme discovery flow ([mojaloop/#578](https://github.com/mojaloop/account-lookup-service/pull/578)), closes [mojaloop/#578](https://github.com/mojaloop/project/issues/578)
* **mojaloop/#1207** enhance distributed lock management with automatic extension and fix metrics ([mojaloop/#1207](https://github.com/mojaloop/central-ledger/pull/1207)), closes [mojaloop/#1207](https://github.com/mojaloop/project/issues/1207)
* **mojaloop/#610** add timeout to callback requests ([mojaloop/#610](https://github.com/mojaloop/ml-api-adapter/pull/610)), closes [mojaloop/#610](https://github.com/mojaloop/project/issues/610)
* **mojaloop/#614** improve transfer status delivery effort ([mojaloop/#614](https://github.com/mojaloop/sdk-scheme-adapter/pull/614)), closes [mojaloop/#614](https://github.com/mojaloop/project/issues/614)
* **mojaloop/#616** improved logging ([mojaloop/#616](https://github.com/mojaloop/sdk-scheme-adapter/pull/616)), closes [mojaloop/#616](https://github.com/mojaloop/project/issues/616)
* **mojaloop/#617** improve certificate syncing ([mojaloop/#617](https://github.com/mojaloop/sdk-scheme-adapter/pull/617)), closes [mojaloop/#617](https://github.com/mojaloop/project/issues/617)

## 2. Bug Fixes
* **mojaloop/#567** fixed handleError to set destination of errorCallback properly ([mojaloop/#567](https://github.com/mojaloop/account-lookup-service/pull/567)), closes [mojaloop/#567](https://github.com/mojaloop/project/issues/567)
* **mojaloop/#568** updated delete party logic; added unit-test to check handleError failure ([mojaloop/#568](https://github.com/mojaloop/account-lookup-service/pull/568)), closes [mojaloop/#568](https://github.com/mojaloop/project/issues/568)
* **mojaloop/#participants** fixed PUT /participants/{ID} logic ([mojaloop/#570](https://github.com/mojaloop/account-lookup-service/pull/570)), closes [mojaloop/#participants](https://github.com/mojaloop/project/issues/participants)
* **mojaloop/#571** updated stream lib and event-sdk ([mojaloop/#571](https://github.com/mojaloop/account-lookup-service/pull/571)), closes [mojaloop/#571](https://github.com/mojaloop/project/issues/571)
* **mojaloop/#581** returned only isActive proxies ([mojaloop/#581](https://github.com/mojaloop/account-lookup-service/pull/581)), closes [mojaloop/#581](https://github.com/mojaloop/project/issues/581)
* **mojaloop/#599** updated deps ([mojaloop/#599](https://github.com/mojaloop/account-lookup-service/pull/599)), closes [mojaloop/#599](https://github.com/mojaloop/project/issues/599)
* **mojaloop/#1210** added participantNotFound FSPIOP error ([mojaloop/#1210](https://github.com/mojaloop/central-ledger/pull/1210)), closes [mojaloop/#1210](https://github.com/mojaloop/project/issues/1210)
* **mojaloop/#1212** use local lock with distlock ([mojaloop/#1212](https://github.com/mojaloop/central-ledger/pull/1212)), closes [mojaloop/#1212](https://github.com/mojaloop/project/issues/1212)
* **mojaloop/#1218** participant limit cache could process transfer without erroring ([mojaloop/#1218](https://github.com/mojaloop/central-ledger/pull/1218)), closes [mojaloop/#1218](https://github.com/mojaloop/project/issues/1218)
* **mojaloop/#1232** add condition on adjust limits ([mojaloop/#1232](https://github.com/mojaloop/central-ledger/pull/1232)), closes [mojaloop/#1232](https://github.com/mojaloop/project/issues/1232)
* **mojaloop/#617** added generateHapiRoutes to avoid hapi routes manual definition ([mojaloop/#617](https://github.com/mojaloop/ml-api-adapter/pull/617)), closes [mojaloop/#617](https://github.com/mojaloop/project/issues/617)
* **mojaloop/#619** added process.on listeners; improved consumer healthCheck ([mojaloop/#619](https://github.com/mojaloop/ml-api-adapter/pull/619)), closes [mojaloop/#619](https://github.com/mojaloop/project/issues/619)
* **mojaloop/#43** fixed missing Slack notifications of timeout ([mojaloop/#43](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/43)), closes [mojaloop/#43](https://github.com/mojaloop/project/issues/43)
* **mojaloop/#44** improved timeout Slack report ([mojaloop/#44](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/44)), closes [mojaloop/#44](https://github.com/mojaloop/project/issues/44)
* **mojaloop/#342** fix MyEmitter memory leak ([mojaloop/#342](https://github.com/mojaloop/ml-testing-toolkit/pull/342)), closes [mojaloop/#342](https://github.com/mojaloop/project/issues/342)
* **mojaloop/#349** added logs to output error ([mojaloop/#349](https://github.com/mojaloop/ml-testing-toolkit/pull/349)), closes [mojaloop/#349](https://github.com/mojaloop/project/issues/349)
* **mojaloop/#350** included ISO20022 messages in TTK report callbacks ([mojaloop/#350](https://github.com/mojaloop/ml-testing-toolkit/pull/350)), closes [mojaloop/#350](https://github.com/mojaloop/project/issues/350)
* **mojaloop/#424** removed unneeded info from logs ([mojaloop/#424](https://github.com/mojaloop/quoting-service/pull/424)), closes [mojaloop/#424](https://github.com/mojaloop/project/issues/424)
* **mojaloop/#fxTransfers logic of sending notifications (** changed PATCH transfers/fxTransfers logic of sending notifications ([mojaloop/#605](https://github.com/mojaloop/sdk-scheme-adapter/pull/605)), closes [mojaloop/#fxTransfers logic of sending notifications (](https://github.com/mojaloop/project/issues/fxTransfers logic of sending notifications ()
* **mojaloop/#607** updated deps ([mojaloop/#607](https://github.com/mojaloop/sdk-scheme-adapter/pull/607)), closes [mojaloop/#607](https://github.com/mojaloop/project/issues/607)
* **mojaloop/#643** updated getTransfer to preserve existing transfer state in cache ([mojaloop/#643](https://github.com/mojaloop/sdk-scheme-adapter/pull/643)), closes [mojaloop/#643](https://github.com/mojaloop/project/issues/643)

## 3. Application Versions

1. central-event-processor: v12.1.1 ->                     [v12.2.3](https://github.com/mojaloop/central-event-processor/releases/v12.2.3)                     ([Compare](https://github.com/mojaloop/central-event-processor/compare/v12.1.1...v12.2.3))
2. bulk-api-adapter: v17.2.2 ->                     [v17.2.3](https://github.com/mojaloop/bulk-api-adapter/releases/v17.2.3)                     ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v17.2.2...v17.2.3))
3. event-sidecar: v14.2.0 ->                     [v14.2.1](https://github.com/mojaloop/event-sidecar/releases/v14.2.1)                     ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.2.0...v14.2.1))
4. ml-testing-toolkit-ui: v16.6.4 ->                     [v16.7.4](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v16.7.4)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v16.6.4...v16.7.4))
5. als-oracle-pathfinder: v12.3.1 ->                     [v12.3.4](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.3.4)                     ([Compare](https://github.com/mojaloop/als-oracle-pathfinder/compare/v12.3.1...v12.3.4))
6. ml-testing-toolkit: v18.15.0 ->                     [v18.16.6](https://github.com/mojaloop/ml-testing-toolkit/releases/v18.16.6)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v18.15.0...v18.16.6))
7. als-static-oracle-svc:  ->                     [v0.0.30](https://github.com/mojaloop/als-static-oracle-svc/releases/v0.0.30)                     ([Compare](https://github.com/mojaloop/als-static-oracle-svc/compare/...v0.0.30))
8. transaction-requests-service: v14.4.5 ->                     [v14.4.7](https://github.com/mojaloop/transaction-requests-service/releases/v14.4.7)                     ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.4.5...v14.4.7))
9. ml-api-adapter: v16.5.9 ->                     [v16.7.0](https://github.com/mojaloop/ml-api-adapter/releases/v16.7.0)                     ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v16.5.9...v16.7.0))
10. ml-testing-toolkit-client-lib: v1.10.3 ->                     [v1.12.2](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.12.2)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.10.3...v1.12.2))
11. sdk-scheme-adapter: v24.10.5 ->                     [v24.18.5](https://github.com/mojaloop/sdk-scheme-adapter/releases/v24.18.5)                     ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v24.10.5...v24.18.5))
12. mojaloop-simulator: v15.4.2 ->                     [v15.5.2](https://github.com/mojaloop/mojaloop-simulator/releases/v15.5.2)                     ([Compare](https://github.com/mojaloop/mojaloop-simulator/compare/v15.4.2...v15.5.2))
13. thirdparty-api-svc: v15.1.2 ->                     [v15.1.4](https://github.com/mojaloop/thirdparty-api-svc/releases/v15.1.4)                     ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v15.1.2...v15.1.4))
14. als-consent-oracle: v1.1.4 ->                     [v1.1.6](https://github.com/mojaloop/als-consent-oracle/releases/v1.1.6)                     ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v1.1.4...v1.1.6))
15. account-lookup-service: v17.12.2 ->                     [v17.14.11](https://github.com/mojaloop/account-lookup-service/releases/v17.14.11)                     ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v17.12.2...v17.14.11))
16. simulator: v12.3.2 ->                     [v12.3.6](https://github.com/mojaloop/simulator/releases/v12.3.6)                     ([Compare](https://github.com/mojaloop/simulator/compare/v12.3.2...v12.3.6))
17. quoting-service: v17.12.1 ->                     [v17.13.11](https://github.com/mojaloop/quoting-service/releases/v17.13.11)                     ([Compare](https://github.com/mojaloop/quoting-service/compare/v17.12.1...v17.13.11))
18. central-ledger: v19.8.3 ->                     [v19.12.0](https://github.com/mojaloop/central-ledger/releases/v19.12.0)                     ([Compare](https://github.com/mojaloop/central-ledger/compare/v19.8.3...v19.12.0))
19. central-settlement: v17.2.2 ->                     [v17.3.2](https://github.com/mojaloop/central-settlement/releases/v17.3.2)                     ([Compare](https://github.com/mojaloop/central-settlement/compare/v17.2.2...v17.3.2))
20. email-notifier: v14.1.4 ->                     [v14.1.6](https://github.com/mojaloop/email-notifier/releases/v14.1.6)                     ([Compare](https://github.com/mojaloop/email-notifier/compare/v14.1.4...v14.1.6))
21. auth-service: [v15.2.7](https://github.com/mojaloop/auth-service/releases/v15.2.7)
22. als-msisdn-oracle-svc: [v0.0.21](https://github.com/mojaloop/als-msisdn-oracle-svc/releases/v0.0.21)
23. callback-handler-simulator-svc: [v0.1.3](https://github.com/mojaloop/callback-handler-simulator-svc/releases/v0.1.3)
24. merchant-acquirer-backend: [1.0.1](https://github.com/mojaloop/merchant-acquirer-backend/releases/1.0.1)
25. merchant-acquirer-frontend: [1.0.1](https://github.com/mojaloop/merchant-acquirer-frontend/releases/1.0.1)
26. inter-scheme-proxy-adapter: [v1.3.3](https://github.com/mojaloop/inter-scheme-proxy-adapter/releases/v1.3.3)
27. merchant-registry-oracle: [1.0.1](https://github.com/mojaloop/merchant-registry-oracle/releases/1.0.1)
28. thirdparty-sdk: [v15.1.3](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.3)
29. ml-core-test-harness: [v2.3.0](https://github.com/mojaloop/ml-core-test-harness/releases/v2.3.0)
30. event-stream-processor: [v12.0.0-snapshot.14](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.14)

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
    |  Testing Toolkit Test Cases   |  [v17.2.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v17.2.0)   |     |
    |  example-mojaloop-backend   |  v17.2.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

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
  * migrations/310405_participantPositionChange-positionChange.js: (https://github.com/mojaloop/central-ledger/blob/930f69d15031c810e85037e0cb93789706839051/migrations%2F310405_participantPositionChange-positionChange.js)
  * migrations/310406_participantPositionChange-positionChange-revert.js: (https://github.com/mojaloop/central-ledger/blob/930f69d15031c810e85037e0cb93789706839051/migrations%2F310406_participantPositionChange-positionChange-revert.js)
  * migrations/961000_participantEndpoint_unique.js: (https://github.com/mojaloop/central-ledger/blob/930f69d15031c810e85037e0cb93789706839051/migrations%2F961000_participantEndpoint_unique.js)
  * migrations/961001_transferForwarded.js: (https://github.com/mojaloop/central-ledger/blob/930f69d15031c810e85037e0cb93789706839051/migrations%2F961001_transferForwarded.js)
  * migrations/961002_fxTransferForwarded.js: (https://github.com/mojaloop/central-ledger/blob/930f69d15031c810e85037e0cb93789706839051/migrations%2F961002_fxTransferForwarded.js)
### ml-api-adapter
  * config/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/ca89dfbb1a8a89d2fe01f36ac64ad65274b41e77/config%2Fdefault.json)
### quoting-service
  * config/default.json: (https://github.com/mojaloop/quoting-service/blob/54e8ffc3d9302e299990315210436603f432c8b7/config%2Fdefault.json)
### account-lookup-service
  * config/default.json: (https://github.com/mojaloop/account-lookup-service/blob/244d5e363caa282a90a362358aa5ec59c355cd1a/config%2Fdefault.json)
  * docker/account-lookup-service/default.json: (https://github.com/mojaloop/account-lookup-service/blob/244d5e363caa282a90a362358aa5ec59c355cd1a/docker%2Faccount-lookup-service%2Fdefault.json)

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
- Individuals: @devarsh10, @elnyry-sam-k, @geka-evk, @gibaros, @kalinkrustev, @kleyow, @oderayi, @shashi165, @vijayg10

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v17.1.0...v17.2.0
