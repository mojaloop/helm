# Helm Release Notes
Date | Revision | Description
---------|----------|---------
2024-02-06 | 0 | Initial draft
2024-03-13 | 0 | Initial release

## 0. Summary

Enhancements and breaking changes to the [v15.2.0 Release](https://github.com/mojaloop/helm/blob/master/.changelog/release-v15.2.0.md), which includes:

1. Performance improvement in Central Ledger via batching of position prepare and position filfill messages
2. Performance improvement in ALS with the addition of participant requests caching, and logging fixes
3. Refactoring of Quoting Service into an event-driven service to improve performance
4. Helm chart: external K8s secret are now used for JWS signing key source if present 
5. General maintenance, bug fixes, and Nodejs upgrades

## 1. New Features
* **mojaloop/#3426** add participant req caching, enable cache metrics, log fixes ([mojaloop/#465](https://github.com/mojaloop/account-lookup-service/pull/465)), closes [mojaloop/#3426](https://github.com/mojaloop/project/issues/3426)
* **mojaloop/#3427** add oracle endpoint db caching and oracle request caching ([mojaloop/#467](https://github.com/mojaloop/account-lookup-service/pull/467)), closes [mojaloop/#3427](https://github.com/mojaloop/project/issues/3427)
* **mojaloop/#3441** nodejs upgrade ([mojaloop/#252](https://github.com/mojaloop/central-event-processor/pull/252)), closes [mojaloop/#3441](https://github.com/mojaloop/project/issues/3441)
* **mojaloop/#3636** batching implementation for position prepare messages ([mojaloop/#968](https://github.com/mojaloop/central-ledger/pull/968)), closes [mojaloop/#3636](https://github.com/mojaloop/project/issues/3636)
* **mojaloop/#3524** add position fulfil to binprocessor ([mojaloop/#990](https://github.com/mojaloop/central-ledger/pull/990)), closes [mojaloop/#3524](https://github.com/mojaloop/project/issues/3524)
* **mojaloop/#3524** add reserve action to fulfil logic ([mojaloop/#992](https://github.com/mojaloop/central-ledger/pull/992)), closes [mojaloop/#3524](https://github.com/mojaloop/project/issues/3524)
* **mojaloop/#321** refactor quoting service into an event driven solution to improve performance ([mojaloop/#321](https://github.com/mojaloop/quoting-service/pull/321)), closes [mojaloop/#321](https://github.com/mojaloop/project/issues/321)
* **mojaloop/#3445** nodejs upgrade ([mojaloop/#252](https://github.com/mojaloop/simulator/pull/252)), closes [mojaloop/#3445](https://github.com/mojaloop/project/issues/3445)
* **mojaloop/#3666** refactor quoting service into an event driven solution to improve performance ([mojaloop/#321](https://github.com/mojaloop/quoting-service/pull/321)), closes [mojaloop/#3666](https://github.com/mojaloop/project/issues/3666)
* **mojaloop/#3666** add external k8s secret for jws signing keys ([mojaloop/#600](https://github.com/mojaloop/helm/pull/600)), closes [mojaloop/#3760](https://github.com/mojaloop/project/issues/3760)
* **mojaloop/#3768** create dashboard-performance-troubleshooting.json ([mojaloop/#601](https://github.com/mojaloop/helm/pull/601)), closes [mojaloop/#3768](https://github.com/mojaloop/project/issues/3768)
* **mojaloop/#3768** node list regexp shows all the nodes in dashboard-performance-troubleshooting.json ([mojaloop/#604](https://github.com/mojaloop/helm/pull/604)), closes [mojaloop/#3768](https://github.com/mojaloop/project/issues/3768)
* **mojaloop/#3768** add replicaset count to performance-troubleshooting dashboard ([mojaloop/#606](https://github.com/mojaloop/helm/pull/606)), closes [mojaloop/#3768](https://github.com/mojaloop/project/issues/3768)
* **iprod/#379** added integration tests; updated docker-compose ([mojaloop/#324](https://github.com/mojaloop/quoting-service/pull/324)), closes [iprod/#379](https://github.com/mojaloop/project/issues)

## 2. Bug Fixes
* **mojaloop/#3682** fix cache implementation ([mojaloop/#468](https://github.com/mojaloop/account-lookup-service/pull/468)), closes [mojaloop/#3682](https://github.com/mojaloop/project/issues/3682)
* **mojaloop/#3603** fix container permission issues ([mojaloop/#9](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/9)), closes [mojaloop/#3603](https://github.com/mojaloop/project/issues/3603)
 * **mojaloop/3806** fix: update k8s monitoring dashboard ([mojaloop/#597](https://github.com/mojaloop/helm/pull/597)), closes [mojaloop/#3806](https://github.com/mojaloop/project/issues/3806)
 * **mojaloop/#3768** fix container cpu and memory utilization charts in k8s monitoring dashboard ([mojaloop/#610](https://github.com/mojaloop/helm/pull/610)), closes [mojaloop/#3768](https://github.com/mojaloop/project/issues/3768)
 * **mojaloop/#3768** node list regexp shows all the nodes in dashboard-performance-troubleshooting.json ([mojaloop/#604](https://github.com/mojaloop/helm/pull/604)), closes [mojaloop/#3768](https://github.com/mojaloop/project/issues/3768)

## 3. Application Versions

1. central-event-processor: v12.0.0 ->     [v12.1.0](https://github.com/mojaloop/central-event-processor/releases/v12.1.0) ([Compare](https://github.com/mojaloop/central-event-processor/compare/v12.0.0...v12.1.0))
2. ml-testing-toolkit-ui: v15.4.0 -> [v15.4.2](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v15.4.2) ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.4.0...v15.4.2))
3. als-oracle-pathfinder: v12.0.0 -> [v12.1.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.1.0) ([Compare](https://github.com/mojaloop/als-oracle-pathfinder/compare/v12.0.0...v12.1.0))
4. ml-testing-toolkit-client-lib: v1.2.0 -> [v1.2.2](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.2.2) ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.2.0...v1.2.2))
5. account-lookup-service: v15.0.0 -> [v15.2.3](https://github.com/mojaloop/account-lookup-service/releases/v15.2.3) ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v15.0.0...v15.2.3))
6. simulator: v12.0.0 -> [v12.1.0](https://github.com/mojaloop/simulator/releases/v12.1.0) ([Compare](https://github.com/mojaloop/simulator/compare/v12.0.0...v12.1.0))
7. quoting-service: v15.5.0 -> [v15.7.0](https://github.com/mojaloop/quoting-service/releases/v15.7.0) ([Compare](https://github.com/mojaloop/quoting-service/compare/v15.5.0...v15.7.0))
8. central-ledger: v17.3.2 -> [v17.6.0](https://github.com/mojaloop/central-ledger/releases/v17.6.0) ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.3.2...v17.6.0))
9. event-stream-processor: v12.0.0-snapshot.7 -> [v12.0.0-snapshot.9](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.9) ([Compare](https://github.com/mojaloop/event-stream-processor/compare/v12.0.0-snapshot.7...v12.0.0-snapshot.9))
10. sdk-scheme-adapter: v23.1.1 -> [v23.4.0](https://github.com/mojaloop/sdk-scheme-adapter/releases/v23.4.0) ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v23.1.1...v23.4.0))
11. bulk-api-adapter: [v17.0.0](https://github.com/mojaloop/bulk-api-adapter/releases/v17.0.0)
12. event-sidecar: [v14.0.0](https://github.com/mojaloop/event-sidecar/releases/v14.0.0)
13. auth-service: [v15.0.0](https://github.com/mojaloop/auth-service/releases/v15.0.0)
14. ml-testing-toolkit: [v17.0.0](https://github.com/mojaloop/ml-testing-toolkit/releases/v17.0.0)
15. transaction-requests-service: [v14.1.2](https://github.com/mojaloop/transaction-requests-service/releases/v14.1.2)
16. ml-api-adapter: [v14.0.5](https://github.com/mojaloop/ml-api-adapter/releases/v14.0.5)
17. mojaloop-simulator: [v15.0.0](https://github.com/mojaloop/mojaloop-simulator/releases/v15.0.0)
18. thirdparty-api-svc: [v14.0.0](https://github.com/mojaloop/thirdparty-api-svc/releases/v14.0.0)
19. als-consent-oracle: [v0.2.2](https://github.com/mojaloop/als-consent-oracle/releases/v0.2.2)
20. thirdparty-sdk: [v15.1.1](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.1)
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
    |  Testing Toolkit Test Cases   |  [v16.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v16.0.0)   |     |
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

8. Testing the Bulk functionality including "sdk-scheme-adapter"

    For details regarding deployment and validation of simulators needed for bulk (for adoption provided in sdk-scheme-adapter) refer to [deploying Mojaloop TTK simulators](https://github.com/mojaloop/helm/blob/master/mojaloop-ttk-simulators/README.md).

## 6. Breaking Changes

### central-ledger
  * config/default.json: <br>
    The Kafka configuration has been expanded to include additional topics, batch size, consume timeout and `EVENT_TYPE_ACTION_TOPIC_MAP` configurations for the batching feature.
    See [README](https://github.com/mojaloop/central-ledger/compare/v17.3.2...v17.6.0#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5) for more details. <br>
    (https://github.com/mojaloop/central-ledger/blob/42238ff293bb27f1947831de1ef574ebd5bdb6fc/config%2Fdefault.json)
### quoting-service
  * config/default.json: <br>
    Quoting Service has now been split into API service and Handler service. As a result, Kafka configuration has been added to allow for publishing and consuming of messages between the API service and the Handler service. See [diff](https://github.com/mojaloop/quoting-service/compare/v15.5.0...v15.7.0#diff-f07c42814e0913799fda32ac14d063f1ef8a04e24fb6febd873a5f161e58a8d4) for details. <br>
    (https://github.com/mojaloop/quoting-service/blob/0a68f45602d9180429537315f6c44f30b8ba99e5/config%2Fdefault.json)
### account-lookup-service
  * config/default.json: (https://github.com/mojaloop/account-lookup-service/blob/283ef2140c166029255a4ddc9548eb3ffb4eaf17/config%2Fdefault.json)
  * docker/account-lookup-service/default.json: (https://github.com/mojaloop/account-lookup-service/blob/283ef2140c166029255a4ddc9548eb3ffb4eaf17/docker%2Faccount-lookup-service%2Fdefault.json)<br>
  The `ENPOINT_CACHE_CONFIG` has been replaced with three (3) separate cache configurations (`CENTRAL_SHARED_ENDPOINT_CACHE_CONFIG`, `CENTRAL_SHARED_PARTICIPANT_CACHE_CONFIG`, and `GENERAL_CACHE_CONFIG`) to cater for the additional caching features in the service.
  See [diff](https://github.com/mojaloop/account-lookup-service/compare/v15.0.0...v15.2.3#diff-f07c42814e0913799fda32ac14d063f1ef8a04e24fb6febd873a5f161e58a8d4) for details.

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
- Individuals: @aaronreynoza, @elnyry-sam-k, @geka-evk, @kleyow, @muzammil360, @oderayi, @vijayg10

*Note: companies and individuals are in alphabetical order*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v15.2.0...v16.0.0
