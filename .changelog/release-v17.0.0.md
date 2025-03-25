# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2025-03-25 | 0 | Initial draft

## 0. Summary

Enhancements and breaking changes to the [v16.0.4 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v16.0.4.md) and the [v16.0.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v16.0.0.md) releases, which include:

1. Performance improvement in Central Ledger via batching of position prepare and position filfill messages
2. Performance improvement in ALS with the addition of participant requests caching, and logging fixes
3. Refactoring of Quoting Service into an event-driven service to improve performance
4. Helm chart: external K8s secret are now used for JWS signing key source if present
5. General maintenance: bug fixes, updates to license headers and license files for compliance and Nodejs upgrades


_Release summary points go here..._

## 1. New Features
* **mojaloop/#528** updated central-services-shared to log error details ([mojaloop/#528](https://github.com/mojaloop/account-lookup-service/pull/528)), closes [mojaloop/#528](https://github.com/mojaloop/project/issues/528)
* **mojaloop/#539** add DELETE participants validation ([mojaloop/#539](https://github.com/mojaloop/account-lookup-service/pull/539)), closes [mojaloop/#539](https://github.com/mojaloop/project/issues/539)
* **mojaloop/#3984** update ci, deps and audit ([mojaloop/#135](https://github.com/mojaloop/auth-service/pull/135)), closes [mojaloop/#3984](https://github.com/mojaloop/project/issues/3984)
* **mojaloop/#109** parameterize switch id ([mojaloop/#109](https://github.com/mojaloop/bulk-api-adapter/pull/109)), closes [mojaloop/#109](https://github.com/mojaloop/project/issues/109)
* **mojaloop/#1154** enabled otel for kafka ([mojaloop/#1154](https://github.com/mojaloop/central-ledger/pull/1154)), closes [mojaloop/#1154](https://github.com/mojaloop/project/issues/1154)
* **mojaloop/#4077** add batch size range validation ([mojaloop/#1159](https://github.com/mojaloop/central-ledger/pull/1159)), closes [mojaloop/#4077](https://github.com/mojaloop/project/issues/4077)
* **mojaloop/#574** enabled otel for kafka ([mojaloop/#574](https://github.com/mojaloop/ml-api-adapter/pull/574)), closes [mojaloop/#574](https://github.com/mojaloop/project/issues/574)
* **mojaloop/#575** add audit query tags ([mojaloop/#575](https://github.com/mojaloop/ml-api-adapter/pull/575)), closes [mojaloop/#575](https://github.com/mojaloop/project/issues/575)
* **mojaloop/#579** updated central-services-shared to log error details ([mojaloop/#579](https://github.com/mojaloop/ml-api-adapter/pull/579)), closes [mojaloop/#579](https://github.com/mojaloop/project/issues/579)
* **mojaloop/#13** added batchSize option ([mojaloop/#13](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/13)), closes [mojaloop/#13](https://github.com/mojaloop/project/issues/13)
* **mojaloop/#14** updated progress logging to show proper total values ([mojaloop/#14](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/14)), closes [mojaloop/#14](https://github.com/mojaloop/project/issues/14)
* **mojaloop/#21** added notifications for failed tests only ([mojaloop/#21](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/21)), closes [mojaloop/#21](https://github.com/mojaloop/project/issues/21)
* **mojaloop/#196** adding pisp demonstration ([mojaloop/#196](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/196)), closes [mojaloop/#196](https://github.com/mojaloop/project/issues/196)
* **mojaloop/#267** used unified ilp version ([mojaloop/#267](https://github.com/mojaloop/ml-testing-toolkit/pull/267)), closes [mojaloop/#267](https://github.com/mojaloop/project/issues/267)
* **mojaloop/#288** add db connection string support ([mojaloop/#288](https://github.com/mojaloop/ml-testing-toolkit/pull/288)), closes [mojaloop/#288](https://github.com/mojaloop/project/issues/288)
* **mojaloop/#290** added testCases executionOrder support to be able to run in parallel ([mojaloop/#290](https://github.com/mojaloop/ml-testing-toolkit/pull/290)), closes [mojaloop/#290](https://github.com/mojaloop/project/issues/290)
* **mojaloop/#178** move middlewares to a separate file ([mojaloop/#178](https://github.com/mojaloop/mojaloop-simulator/pull/178)), closes [mojaloop/#178](https://github.com/mojaloop/project/issues/178)
* **mojaloop/#390** fixed db error - ER_BAD_FIELD_ERROR ([mojaloop/#390](https://github.com/mojaloop/quoting-service/pull/390)), closes [mojaloop/#390](https://github.com/mojaloop/project/issues/390)
* **mojaloop/#394** update streaming lib to use otel ([mojaloop/#394](https://github.com/mojaloop/quoting-service/pull/394)), closes [mojaloop/#394](https://github.com/mojaloop/project/issues/394)
* **mojaloop/#400** updated central-services-shared to log request error details  ([mojaloop/#400](https://github.com/mojaloop/quoting-service/pull/400)), closes [mojaloop/#400](https://github.com/mojaloop/project/issues/400)
* **mojaloop/#: used https.Agent for WSO2 requests in api-svc (** used https.Agent for WSO2 requests in api-svc ([mojaloop/#457](https://github.com/mojaloop/sdk-scheme-adapter/pull/457)), closes [mojaloop/#: used https.Agent for WSO2 requests in api-svc (](https://github.com/mojaloop/project/issues/: used https.Agent for WSO2 requests in api-svc ()
* **mojaloop/#Inbound TransfersModel (** added OTel header to Outbound/Inbound TransfersModel ([mojaloop/#552](https://github.com/mojaloop/sdk-scheme-adapter/pull/552)), closes [mojaloop/#Inbound TransfersModel (](https://github.com/mojaloop/project/issues/Inbound TransfersModel ()
* **mojaloop/#558** switched to use ContextLogger ([mojaloop/#558](https://github.com/mojaloop/sdk-scheme-adapter/pull/558)), closes [mojaloop/#558](https://github.com/mojaloop/project/issues/558)
* **mojaloop/#553** delete account endpoint ([mojaloop/#553](https://github.com/mojaloop/sdk-scheme-adapter/pull/553)), closes [mojaloop/#553](https://github.com/mojaloop/project/issues/553)
* **mojaloop/#260** parameterize switch id ([mojaloop/#260](https://github.com/mojaloop/simulator/pull/260)), closes [mojaloop/#260](https://github.com/mojaloop/project/issues/260)
* **mojaloop/#3984** parameterize switch id ([mojaloop/#94](https://github.com/mojaloop/thirdparty-api-svc/pull/94)), closes [mojaloop/#3984](https://github.com/mojaloop/project/issues/3984)
* **mojaloop/#103** parameterize switch id ([mojaloop/#103](https://github.com/mojaloop/transaction-requests-service/pull/103)), closes [mojaloop/#103](https://github.com/mojaloop/project/issues/103)

## 2. Bug Fixes
* **mojaloop/#3829** added jwsSigner defining to PUT /participants callback ([mojaloop/#472](https://github.com/mojaloop/account-lookup-service/pull/472)), closes [mojaloop/#3829](https://github.com/mojaloop/project/issues/3829)
* **mojaloop/# (** added logs and process.on('uncaughtException') ([mojaloop/#527](https://github.com/mojaloop/account-lookup-service/pull/527)), closes [mojaloop/# (](https://github.com/mojaloop/project/issues/ ()
* **mojaloop/#4072** bump protocol versions to 2.0 ([mojaloop/#124](https://github.com/mojaloop/bulk-api-adapter/pull/124)), closes [mojaloop/#4072](https://github.com/mojaloop/project/issues/4072)
* **mojaloop/#1150** funds-out transferid regex ([mojaloop/#1150](https://github.com/mojaloop/central-ledger/pull/1150)), closes [mojaloop/#1150](https://github.com/mojaloop/project/issues/1150)
* **mojaloop/#417** fixes for `knex.insert` returned insert index ([mojaloop/#417](https://github.com/mojaloop/central-settlement/pull/417)), closes [mojaloop/#417](https://github.com/mojaloop/project/issues/417)
* **mojaloop/#264** uuid/ulid regex ([mojaloop/#264](https://github.com/mojaloop/ml-testing-toolkit/pull/264)), closes [mojaloop/#264](https://github.com/mojaloop/project/issues/264)
* **mojaloop/#287** ttk report fixes ([mojaloop/#287](https://github.com/mojaloop/ml-testing-toolkit/pull/287)), closes [mojaloop/#287](https://github.com/mojaloop/project/issues/287)
* **mojaloop/# (** content type default header ([mojaloop/#289](https://github.com/mojaloop/ml-testing-toolkit/pull/289)), closes [mojaloop/# (](https://github.com/mojaloop/project/issues/ ()
* **mojaloop/# (** rollback content type header changes because it's breaking some tests ( #4034) ([mojaloop/#292](https://github.com/mojaloop/ml-testing-toolkit/pull/292)), closes [mojaloop/# (](https://github.com/mojaloop/project/issues/ ()
* **mojaloop/#172** uuid/ulid regex ([mojaloop/#172](https://github.com/mojaloop/mojaloop-simulator/pull/172)), closes [mojaloop/#172](https://github.com/mojaloop/project/issues/172)
* **mojaloop/#175** extensionlist ([mojaloop/#175](https://github.com/mojaloop/mojaloop-simulator/pull/175)), closes [mojaloop/#175](https://github.com/mojaloop/project/issues/175)
* **mojaloop/#: metrics and test coverage fixes (** metrics and test coverage fixes ([mojaloop/#388](https://github.com/mojaloop/quoting-service/pull/388)), closes [mojaloop/#: metrics and test coverage fixes (](https://github.com/mojaloop/project/issues/: metrics and test coverage fixes ()
* **mojaloop/#3750** add timer for party lookup in cache ([mojaloop/#471](https://github.com/mojaloop/sdk-scheme-adapter/pull/471)), closes [mojaloop/#3750](https://github.com/mojaloop/project/issues/3750)
* **mojaloop/#535** quote request extensions ([mojaloop/#535](https://github.com/mojaloop/sdk-scheme-adapter/pull/535)), closes [mojaloop/#535](https://github.com/mojaloop/project/issues/535)
* **mojaloop/#quoterequest payload's extensionlist internal form fix (** post /quoterequest payload's extensionlist internal form fix ([mojaloop/#539](https://github.com/mojaloop/sdk-scheme-adapter/pull/539)), closes [mojaloop/#quoterequest payload's extensionlist internal form fix (](https://github.com/mojaloop/project/issues/quoterequest payload's extensionlist internal form fix ()
* **mojaloop/#543** log server restarts more accurately ([mojaloop/#543](https://github.com/mojaloop/sdk-scheme-adapter/pull/543)), closes [mojaloop/#543](https://github.com/mojaloop/project/issues/543)
* **mojaloop/#542** fix fxQuote with RECEIVE amountType ([mojaloop/#542](https://github.com/mojaloop/sdk-scheme-adapter/pull/542)), closes [mojaloop/#542](https://github.com/mojaloop/project/issues/542)
* **mojaloop/#563** add sdk 2.1 spec files for ttksims ([mojaloop/#563](https://github.com/mojaloop/sdk-scheme-adapter/pull/563)), closes [mojaloop/#563](https://github.com/mojaloop/project/issues/563)
* **mojaloop/#108** uuid/ulid regex ([mojaloop/#108](https://github.com/mojaloop/transaction-requests-service/pull/108)), closes [mojaloop/#108](https://github.com/mojaloop/project/issues/108)

## 3. Application Versions

1. central-event-processor: v12.1.0 ->                     [v12.1.1](https://github.com/mojaloop/central-event-processor/releases/v12.1.1)                     ([Compare](https://github.com/mojaloop/central-event-processor/compare/v12.1.0...v12.1.1))
2. bulk-api-adapter: v17.0.0 ->                     [v17.1.9](https://github.com/mojaloop/bulk-api-adapter/releases/v17.1.9)                     ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v17.0.0...v17.1.9))
3. event-sidecar: v14.0.0 ->                     [v14.0.3](https://github.com/mojaloop/event-sidecar/releases/v14.0.3)                     ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.0.0...v14.0.3))
4. ml-testing-toolkit-ui: v15.4.2 ->                     [v16.2.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/v16.2.0)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.4.2...v16.2.0))
5. als-oracle-pathfinder: v12.1.0 ->                     [v12.1.3](https://github.com/mojaloop/als-oracle-pathfinder/releases/v12.1.3)                     ([Compare](https://github.com/mojaloop/als-oracle-pathfinder/compare/v12.1.0...v12.1.3))
6. auth-service: v15.0.0 ->                     [v15.1.2](https://github.com/mojaloop/auth-service/releases/v15.1.2)                     ([Compare](https://github.com/mojaloop/auth-service/compare/v15.0.0...v15.1.2))
7. ml-testing-toolkit: v17.1.1 ->                     [v18.11.0](https://github.com/mojaloop/ml-testing-toolkit/releases/v18.11.0)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v17.1.1...v18.11.0))
8. als-msisdn-oracle-svc:  ->                     [v0.0.14](https://github.com/mojaloop/als-msisdn-oracle-svc/releases/v0.0.14)                     ([Compare](https://github.com/mojaloop/als-msisdn-oracle-svc/compare/...v0.0.14))
9. transaction-requests-service: v14.1.2 ->                     [v14.3.9](https://github.com/mojaloop/transaction-requests-service/releases/v14.3.9)                     ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.1.2...v14.3.9))
10. ml-api-adapter: v14.0.5 ->                     [v16.3.2](https://github.com/mojaloop/ml-api-adapter/releases/v16.3.2)                     ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v14.0.5...v16.3.2))
11. ml-testing-toolkit-client-lib: v1.2.2 ->                     [v1.9.0](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/v1.9.0)                     ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.2.2...v1.9.0))
12. sdk-scheme-adapter: v23.4.0 ->                     [v24.6.2](https://github.com/mojaloop/sdk-scheme-adapter/releases/v24.6.2)                     ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v23.4.0...v24.6.2))
13. mojaloop-simulator: v15.0.0 ->                     [v15.3.0](https://github.com/mojaloop/mojaloop-simulator/releases/v15.3.0)                     ([Compare](https://github.com/mojaloop/mojaloop-simulator/compare/v15.0.0...v15.3.0))
14. thirdparty-api-svc: v14.0.0 ->                     [v15.0.2](https://github.com/mojaloop/thirdparty-api-svc/releases/v15.0.2)                     ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v14.0.0...v15.0.2))
15. als-consent-oracle: v0.2.2 ->                     [v1.0.1](https://github.com/mojaloop/als-consent-oracle/releases/v1.0.1)                     ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v0.2.2...v1.0.1))
16. account-lookup-service: v15.2.3 ->                     [v17.6.0](https://github.com/mojaloop/account-lookup-service/releases/v17.6.0)                     ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v15.2.3...v17.6.0))
17. simulator: v12.1.0 ->                     [v12.2.5](https://github.com/mojaloop/simulator/releases/v12.2.5)                     ([Compare](https://github.com/mojaloop/simulator/compare/v12.1.0...v12.2.5))
18. inter-scheme-proxy-adapter:  ->                     [v1.4.1](https://github.com/mojaloop/inter-scheme-proxy-adapter/releases/v1.4.1)                     ([Compare](https://github.com/mojaloop/inter-scheme-proxy-adapter/compare/...v1.4.1))
19. quoting-service: v15.7.0 ->                     [v17.6.0](https://github.com/mojaloop/quoting-service/releases/v17.6.0)                     ([Compare](https://github.com/mojaloop/quoting-service/compare/v15.7.0...v17.6.0))
20. central-ledger: v17.6.1 ->                     [v19.3.0](https://github.com/mojaloop/central-ledger/releases/v19.3.0)                     ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.6.1...v19.3.0))
21. thirdparty-sdk: v15.1.1 ->                     [v15.1.3](https://github.com/mojaloop/thirdparty-sdk/releases/v15.1.3)                     ([Compare](https://github.com/mojaloop/thirdparty-sdk/compare/v15.1.1...v15.1.3))
22. event-stream-processor: v12.0.0-snapshot.9 ->                     [v12.0.0-snapshot.14](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.14)                     ([Compare](https://github.com/mojaloop/event-stream-processor/compare/v12.0.0-snapshot.9...v12.0.0-snapshot.14))
23. central-settlement: v16.0.0 ->                     [v17.0.6](https://github.com/mojaloop/central-settlement/releases/v17.0.6)                     ([Compare](https://github.com/mojaloop/central-settlement/compare/v16.0.0...v17.0.6))
24. email-notifier: v14.0.0 ->                     [v14.0.3](https://github.com/mojaloop/email-notifier/releases/v14.0.3)                     ([Compare](https://github.com/mojaloop/email-notifier/compare/v14.0.0...v14.0.3))

## 4. API Versions

This release supports the following versions of the [Mojaloop family of APIs](https://docs.mojaloop.io/api):

| API         | Supported Versions                                                                                                                                    | Notes |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| FSPIOP      | [v1.1](https://docs.mojaloop.io/api/fspiop/v1.1/api-definition.html), v2.0 |       |
| Settlements | [v2.0](https://docs.mojaloop.io/api/settlement)                                                                                            |       |
| Admin       | [v1.0](https://docs.mojaloop.io/api/administration/central-ledger-api.html)                                                                |       |
| Oracle      | [v1.0](https://docs.mojaloop.io/legacy/api/als-oracle-api-specification.html)                                                              |       |
| Thirdparty  | [v1.0](https://docs.mojaloop.io/api/thirdparty)                                                                                            |       |

## 5. Testing notes

1. This release has been validated against the following Dependency Test Matrix:

    | Dependency | Version |  Notes   |
    | ---------- | ------- | --- |
    | Kubernetes | v1.32 | [AWS EKS](https://aws.amazon.com/eks/), [AWS EKS Supported Version Notes](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)  |
    | containerd  |  v1.7.25  |  |
    | Nginx Ingress Controller | [helm-ingress-nginx-4.7.0](https://github.com/kubernetes/ingress-nginx/releases/tag/helm-chart-4.7.0) / [ingress-controller-v1.8.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.8.0) |     |
    |  Amazon Linux   |  v2   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v17.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v17.0.0)   |     |
    |  example-mojaloop-backend   |  v17.0.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

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


## 6. Configuration Options:

Mojaloop Helm deployments currently include the following configuration options:

| Helm Test                  | Test Cases                                                                                                                                      |  Description   | Enabled by default? | Notes                                                                                                                                                                                                                                                                               |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | --- | ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ml-ttk-test-setup.tests    | [hub/provisioning](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/provisioning)                             |  Standard Provisioning Collection   | Yes                 | Required as a pre-requisite for all tests.                                                                                                                                                                                                                                          |
| ml-ttk-test-val-gp         | [hub/golden_path](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/golden_path)                               |  Golden-Path (GP) Test Collection FSPIOP Mode   | Yes                 | Previously named `ml-ttk-test-validation` prior to v13.1.0 release.                                                                                                                                                                                                                 |
| ml-ttk-test-val-gp (ISO)         | [hub/golden_path](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/golden_path)                               |  Golden-Path (GP) Test Collection ISO20022 Mode   | No                 | `api_type: &API_TYPE "iso20022"`, `ttk_transformer_name: &TTK_TRANSFORMER_NAME "fspiopToISO20022"`, `SDK_ILP_VERSION: &SDK_ILP_VERSION "4"`, `validCondition: &validCondition "$param_validConditionV4"`, `ilpPacket: &ilpPacket "$param_validIlpPacketV4"`, `validFulfillment: &validFulfillment "$param_validFulfillmentV4"` This configuration needs to be set while disabling API_TYPE=fspiop.                                                                                                                                                                                                                |
| ml-ttk-test-setup-interscheme        | [hub/inter_scheme](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/provisioning/for_inter_scheme)                               |  Inter-scheme Provisioning Collection   | No                 | `interscheme_enabled: true`. This configuration needs to be set along with `cl_payee_participant_currency_validation_enabled: false` (otherwise tests fail; to confirm payee fsp validation is disabled in inter-scheme mode).                                                                                                                                         
| ml-ttk-test-val-interscheme        | [hub/inter_scheme](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/inter_scheme)                               |  Inter-scheme Test Collection   | No                 | `interscheme_enabled: true`. This configuration needs to be set along with `cl_payee_participant_currency_validation_enabled: false` (otherwise tests fail; to confirm payee fsp validation is disabled in inter-scheme mode).                                                                                                                                         
| ml-ttk-test-val-bulk       | [hub/other_tests/bulk_transfers](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/other_tests/bulk_transfers) |  Bulk Test Collection   | No                  | `mojaloop-bulk.enabled=true` must be set to deploy the Bulk-API-Adapter components.                                                                                                                                                                                                 |
| ml-ttk-test-setup-sdk-bulk | [hub/provisioning_sdkbulk](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/provisioning_sdkbulk)             |  SDK Bulk Provisioning Collection   | No                  | `mojaloop-bulk.enabled=true` & `mojaloop-ttk-simulators.enabled=true` must be set to deploy the Bulk-API-Adapter and TTK Simulators components.                                                                                                                                                       |
| ml-ttk-test-val-sdk-bulk   | [hub/sdk_scheme_adapter/bulk](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/sdk_scheme_adapter/bulk/basic)                                     |  SDK Bulk Test Collection   | No                  | `mojaloop-bulk.enabled=true` & `mojaloop-ttk-simulators.enabled=true` must be set to deploy Bulk-API-Adapter and TTK Simulators components. components.                                                                                                                                                              |
| ml-ttk-test-val-sdk-r2p   | [hub/sdk_scheme_adapter/request-to-pay](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/sdk_scheme_adapter/request-to-pay/basic)                                     |  SDK Request To Pay Test Collection   | No                  | `mojaloop-ttk-simulators.enabled=true` must be set to deploy the TTK Simulators components. components.                                                                                                                                                              |
| ml-ttk-test-setup-tp       | [hub/provisioning_thirdparty](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/provisioning_thirdparty)       |  Thirdparty Provisioning Collection   | No                  | `thirdparty.enabled=true`, `account-lookup-service.account-lookup-service.config.featureEnableExtendedPartyIdType=true` & `account-lookup-service.account-lookup-service-admin.config.featureEnableExtendedPartyIdType=true` must be set to deploy the Thirdparty components.       |
| ml-ttk-test-val-tp         | [hub/thirdparty](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/thirdparty)                                 |  Thirdparty Test Collection   | No                  | `thirdparty.enabled=true`, `account-lookup-service.account-lookup-service.config.featureEnableExtendedPartyIdType=true` & `account-lookup-service.account-lookup-service-admin.config.featureEnableExtendedPartyIdType=true` must be set to deploy the Bulk-API-Adapter components. |
| ml-ttk-test-cleanup         | [hub/cleanup](https://github.com/mojaloop/testing-toolkit-test-cases/tree/master/collections/hub/cleanup)                                 |  Thirdparty Test Collection   | Yes                  |  Post cleanup scripts, e.g. executes position reset test collection. Note that `ml-ttk-test-cleanup.test.config.saveReport` is disabled by default. |

## 7. Breaking Changes


### central-ledger
  * config/default.json: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/ml-api-adapter/default.json: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/docker%2Fml-api-adapter%2Fdefault.json)
  * migrations/100100_event.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F100100_event.js)
  * migrations/110100_contactType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110100_contactType.js)
  * migrations/110101_contactType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110101_contactType-indexes.js)
  * migrations/110200_currency.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110200_currency.js)
  * migrations/110201_currency-scale.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110201_currency-scale.js)
  * migrations/110300_endpointType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110300_endpointType.js)
  * migrations/110301_endpointType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110301_endpointType-indexes.js)
  * migrations/110400_ledgerEntryType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110400_ledgerEntryType.js)
  * migrations/110401_ledgerEntryType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110401_ledgerEntryType-indexes.js)
  * migrations/110450_ledgerAccountType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110450_ledgerAccountType.js)
  * migrations/110451_ledgerAccountType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110451_ledgerAccountType-indexes.js)
  * migrations/110500_participantLimitType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110500_participantLimitType.js)
  * migrations/110501_participantLimitType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110501_participantLimitType-indexes.js)
  * migrations/110600_transferParticipantRoleType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110600_transferParticipantRoleType.js)
  * migrations/110601_transferParticipantRoleType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110601_transferParticipantRoleType-indexes.js)
  * migrations/110700_transferState.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110700_transferState.js)
  * migrations/110800_settlementWindowState.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110800_settlementWindowState.js)
  * migrations/110900_settlementState.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F110900_settlementState.js)
  * migrations/111000_amountType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111000_amountType.js)
  * migrations/111001_amountType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111001_amountType-indexes.js)
  * migrations/111100_balanceOfPayments.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111100_balanceOfPayments.js)
  * migrations/111101_balanceOfPayments-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111101_balanceOfPayments-indexes.js)
  * migrations/111200_partyIdentifierType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111200_partyIdentifierType.js)
  * migrations/111201_partyIdentifierType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111201_partyIdentifierType-indexes.js)
  * migrations/111300_partyType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111300_partyType.js)
  * migrations/111301_partyType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111301_partyType-indexes.js)
  * migrations/111400_quoteDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111400_quoteDuplicateCheck.js)
  * migrations/111500_transactionInitiator.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111500_transactionInitiator.js)
  * migrations/111501_transactionInitiator-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111501_transactionInitiator-indexes.js)
  * migrations/111600_transactionInitiatorType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111600_transactionInitiatorType.js)
  * migrations/111601_transactionInitiatorType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111601_transactionInitiatorType-indexes.js)
  * migrations/111700_settlementDelay.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111700_settlementDelay.js)
  * migrations/111701_settlementDelay-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111701_settlementDelay-indexes.js)
  * migrations/111800_settlementInterchange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111800_settlementInterchange.js)
  * migrations/111801_settlementInterchange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111801_settlementInterchange-indexes.js)
  * migrations/111900_settlementGranularity.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111900_settlementGranularity.js)
  * migrations/111901_settlementGranularity-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F111901_settlementGranularity-indexes.js)
  * migrations/112000_bulkTransferState.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F112000_bulkTransferState.js)
  * migrations/112100_bulkProcessingState.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F112100_bulkProcessingState.js)
  * migrations/112101_bulkProcessingState-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F112101_bulkProcessingState-indexes.js)
  * migrations/200100_participant.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200100_participant.js)
  * migrations/200101_participant-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200101_participant-indexes.js)
  * migrations/200200_participantContact.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200200_participantContact.js)
  * migrations/200201_participantContact-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200201_participantContact-indexes.js)
  * migrations/200300_participantEndpoint.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200300_participantEndpoint.js)
  * migrations/200301_participantEndpoint-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200301_participantEndpoint-indexes.js)
  * migrations/200400_participantParty.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200400_participantParty.js)
  * migrations/200401_participantParty-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200401_participantParty-indexes.js)
  * migrations/200600_token.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200600_token.js)
  * migrations/200601_token-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F200601_token-indexes.js)
  * migrations/300100_transferDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300100_transferDuplicateCheck.js)
  * migrations/300150_bulkTransferDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300150_bulkTransferDuplicateCheck.js)
  * migrations/300200_transfer.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300200_transfer.js)
  * migrations/300201_transfer-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300201_transfer-indexes.js)
  * migrations/300202_transfer-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300202_transfer-decimal184.js)
  * migrations/300250_bulkTransfer.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300250_bulkTransfer.js)
  * migrations/300251_bulkTransfer-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300251_bulkTransfer-indexes.js)
  * migrations/300275_bulkTransferAssociation.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300275_bulkTransferAssociation.js)
  * migrations/300276_bulkTransferAssociation-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300276_bulkTransferAssociation-indexes.js)
  * migrations/300300_ilpPacket.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300300_ilpPacket.js)
  * migrations/300400_transferStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300400_transferStateChange.js)
  * migrations/300401_transferStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300401_transferStateChange-indexes.js)
  * migrations/300450_bulkTransferStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300450_bulkTransferStateChange.js)
  * migrations/300451_bulkTransferStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300451_bulkTransferStateChange-indexes.js)
  * migrations/300500_segment.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300500_segment.js)
  * migrations/300501_segment-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F300501_segment-indexes.js)
  * migrations/310100_participantCurrency.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310100_participantCurrency.js)
  * migrations/310101_participantCurrency-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310101_participantCurrency-indexes.js)
  * migrations/310200_transferParticipant.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310200_transferParticipant.js)
  * migrations/310201_transferParticipant-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310201_transferParticipant-indexes.js)
  * migrations/310202_transferParticipant-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310202_transferParticipant-decimal184.js)
  * migrations/310203_transferParticipant-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310203_transferParticipant-indexes.js)
  * migrations/310204_transferParticipant-participantId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310204_transferParticipant-participantId.js)
  * migrations/310300_participantPosition.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310300_participantPosition.js)
  * migrations/310301_participantPosition-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310301_participantPosition-indexes.js)
  * migrations/310302_participantPosition-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310302_participantPosition-decimal184.js)
  * migrations/310400_participantPositionChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310400_participantPositionChange.js)
  * migrations/310401_participantPositionChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310401_participantPositionChange-indexes.js)
  * migrations/310402_participantPositionChange-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310402_participantPositionChange-decimal184.js)
  * migrations/310403_participantPositionChange-participantCurrencyId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310403_participantPositionChange-participantCurrencyId.js)
  * migrations/310404_participantPositionChange-change.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310404_participantPositionChange-change.js)
  * migrations/310500_participantLimit.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310500_participantLimit.js)
  * migrations/310501_participantLimit-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310501_participantLimit-indexes.js)
  * migrations/310502_participantLimit-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310502_participantLimit-decimal184.js)
  * migrations/310503_participantLimit-indexes-composite.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F310503_participantLimit-indexes-composite.js)
  * migrations/400100_settlementWindow.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400100_settlementWindow.js)
  * migrations/400200_settlement.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400200_settlement.js)
  * migrations/400300_settlementSettlementWindow.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400300_settlementSettlementWindow.js)
  * migrations/400301_settlementSettlementWindow-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400301_settlementSettlementWindow-indexes.js)
  * migrations/400400_settlementWindowStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400400_settlementWindowStateChange.js)
  * migrations/400401_settlmentWindowStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400401_settlmentWindowStateChange-indexes.js)
  * migrations/400500_settlementTransferParticipant.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400500_settlementTransferParticipant.js)
  * migrations/400501_settlementTransferParticipant-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400501_settlementTransferParticipant-indexes.js)
  * migrations/400502_settlementTransferParticipant-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400502_settlementTransferParticipant-decimal184.js)
  * migrations/400600_settlementParticipantCurrency.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400600_settlementParticipantCurrency.js)
  * migrations/400601_settlementParticipantCurrency-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400601_settlementParticipantCurrency-indexes.js)
  * migrations/400602_settlementParticipantCurrency-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400602_settlementParticipantCurrency-decimal184.js)
  * migrations/400700_settlementParticipantCurrencyStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400700_settlementParticipantCurrencyStateChange.js)
  * migrations/400701_settlementParticipantCurrencyStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400701_settlementParticipantCurrencyStateChange-indexes.js)
  * migrations/400800_settlementStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400800_settlementStateChange.js)
  * migrations/400801_settlementStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400801_settlementStateChange-indexes.js)
  * migrations/400900_settlementWindowContent.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F400900_settlementWindowContent.js)
  * migrations/401000_settlementWindowContentStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401000_settlementWindowContentStateChange.js)
  * migrations/401001_settlementWindowContentStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401001_settlementWindowContentStateChange-indexes.js)
  * migrations/401002_settlementWindowContent-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401002_settlementWindowContent-indexes.js)
  * migrations/401200_settlementContentAggregation.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401200_settlementContentAggregation.js)
  * migrations/401201_settlementContentAggregation-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401201_settlementContentAggregation-indexes.js)
  * migrations/401300_settlementModel.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401300_settlementModel.js)
  * migrations/401301_settlementModel-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F401301_settlementModel-indexes.js)
  * migrations/410100_transferFulfilmentDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410100_transferFulfilmentDuplicateCheck.js)
  * migrations/410101_transferFulfilmentDuplicateCheck-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410101_transferFulfilmentDuplicateCheck-indexes.js)
  * migrations/410102_transferFulfilmentDuplicateCheck-dropForeignTransferId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410102_transferFulfilmentDuplicateCheck-dropForeignTransferId.js)
  * migrations/410103_transferFulfilmentDuplicateCheck-hashNullable.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410103_transferFulfilmentDuplicateCheck-hashNullable.js)
  * migrations/410200_transferFulfilment.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410200_transferFulfilment.js)
  * migrations/410201_transferFulfilment-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410201_transferFulfilment-indexes.js)
  * migrations/410202_transferFulfilment-ilpFulfilment.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410202_transferFulfilment-ilpFulfilment.js)
  * migrations/410203_transferFulfilment-foreignTransferFulfilmentId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410203_transferFulfilment-foreignTransferFulfilmentId.js)
  * migrations/410240_bulkTransferFulfilmentDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410240_bulkTransferFulfilmentDuplicateCheck.js)
  * migrations/410250_bulkTransferFulfilment.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410250_bulkTransferFulfilment.js)
  * migrations/410300_transferExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410300_transferExtension.js)
  * migrations/410301_transferExtension-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410301_transferExtension-indexes.js)
  * migrations/410302_transferExtension-transferErrorId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410302_transferExtension-transferErrorId.js)
  * migrations/410350_bulkTransferExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410350_bulkTransferExtension.js)
  * migrations/410351_bulkTransferExtension-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410351_bulkTransferExtension-indexes.js)
  * migrations/410400_transferTimeout.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410400_transferTimeout.js)
  * migrations/410401_transferTimeout-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410401_transferTimeout-indexes.js)
  * migrations/410450_transferErrorDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410450_transferErrorDuplicateCheck.js)
  * migrations/410500_transferError.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410500_transferError.js)
  * migrations/410501_transferError-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410501_transferError-indexes.js)
  * migrations/410502_transferError-foreignTransferErrorDuplicateCheckId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410502_transferError-foreignTransferErrorDuplicateCheckId.js)
  * migrations/410550_bulkTransferError.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410550_bulkTransferError.js)
  * migrations/410551_bulkTransferError-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410551_bulkTransferError-indexes.js)
  * migrations/410600_expiringTransfer.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410600_expiringTransfer.js)
  * migrations/410601_expiringTransfer-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F410601_expiringTransfer-indexes.js)
  * migrations/500100_transactionReference.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500100_transactionReference.js)
  * migrations/500101_transactionReference-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500101_transactionReference-indexes.js)
  * migrations/500200_transactionScenario.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500200_transactionScenario.js)
  * migrations/500201_transactionScenario-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500201_transactionScenario-indexes.js)
  * migrations/500300_transactionSubScenario.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500300_transactionSubScenario.js)
  * migrations/500400_quote.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500400_quote.js)
  * migrations/500401_quote-hotfix-2719.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500401_quote-hotfix-2719.js)
  * migrations/500500_quoteParty.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500500_quoteParty.js)
  * migrations/500501_feature-fixSubIdRef.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500501_feature-fixSubIdRef.js)
  * migrations/500600_party.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500600_party.js)
  * migrations/500601_party-2480.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500601_party-2480.js)
  * migrations/500700_quoteResponse.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500700_quoteResponse.js)
  * migrations/500800_quoteResponseIlpPacket.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500800_quoteResponseIlpPacket.js)
  * migrations/500900_geoCode.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F500900_geoCode.js)
  * migrations/501000_quoteExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501000_quoteExtension.js)
  * migrations/501001_quoteExtension-quote-service-174.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501001_quoteExtension-quote-service-174.js)
  * migrations/501002_quoteExtension-2522.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501002_quoteExtension-2522.js)
  * migrations/501100_quoteResponseDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501100_quoteResponseDuplicateCheck.js)
  * migrations/501200_quoteError.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501200_quoteError.js)
  * migrations/501300_transferRules.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F501300_transferRules.js)
  * migrations/600010_fxTransferType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600010_fxTransferType.js)
  * migrations/600011_fxTransferType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600011_fxTransferType-indexes.js)
  * migrations/600012_fxParticipantCurrencyType.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600012_fxParticipantCurrencyType.js)
  * migrations/600013_fxParticipantCurrencyType-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600013_fxParticipantCurrencyType-indexes.js)
  * migrations/600100_fxTransferDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600100_fxTransferDuplicateCheck.js)
  * migrations/600110_fxTransferErrorDuplicateCheck.js.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600110_fxTransferErrorDuplicateCheck.js.js)
  * migrations/600200_fxTransfer.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600200_fxTransfer.js)
  * migrations/600201_fxTransfer-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600201_fxTransfer-indexes.js)
  * migrations/600400_fxTransferStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600400_fxTransferStateChange.js)
  * migrations/600401_fxTransferStateChange-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600401_fxTransferStateChange-indexes.js)
  * migrations/600501_fxWatchList.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600501_fxWatchList.js)
  * migrations/600502_fxWatchList-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600502_fxWatchList-indexes.js)
  * migrations/600600_fxTransferFulfilmentDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600600_fxTransferFulfilmentDuplicateCheck.js)
  * migrations/600601_fxTransferFulfilmentDuplicateCheck-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600601_fxTransferFulfilmentDuplicateCheck-indexes.js)
  * migrations/600700_fxTransferFulfilment.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600700_fxTransferFulfilment.js)
  * migrations/600701_fxTransferFulfilment-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600701_fxTransferFulfilment-indexes.js)
  * migrations/600800_fxTransferExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F600800_fxTransferExtension.js)
  * migrations/601400_fxTransferTimeout.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F601400_fxTransferTimeout.js)
  * migrations/601401_fxTransferTimeout-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F601401_fxTransferTimeout-indexes.js)
  * migrations/601500_fxTransferError.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F601500_fxTransferError.js)
  * migrations/601501_fxTransferError-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F601501_fxTransferError-indexes.js)
  * migrations/610200_fxTransferParticipant.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F610200_fxTransferParticipant.js)
  * migrations/610201_fxTransferParticipant-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F610201_fxTransferParticipant-indexes.js)
  * migrations/610202_fxTransferParticipant-participantId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F610202_fxTransferParticipant-participantId.js)
  * migrations/610403_participantPositionChange-fxTransfer.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F610403_participantPositionChange-fxTransfer.js)
  * migrations/800100_quotePartyView.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F800100_quotePartyView.js)
  * migrations/800101_feature-fixSubIdRef.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F800101_feature-fixSubIdRef.js)
  * migrations/800200_quoteView.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F800200_quoteView.js)
  * migrations/800300_quoteResponseView.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F800300_quoteResponseView.js)
  * migrations/900100_foreign-keys.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F900100_foreign-keys.js)
  * migrations/900101_foreign-keys.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F900101_foreign-keys.js)
  * migrations/910100_feature904DDL.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F910100_feature904DDL.js)
  * migrations/910101_feature904DataMigration.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F910101_feature904DataMigration.js)
  * migrations/910102_feature949DataMigration.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F910102_feature949DataMigration.js)
  * migrations/910102_hotfix954.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F910102_hotfix954.js)
  * migrations/910103_feature1093SettlementByCurrency.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F910103_feature1093SettlementByCurrency.js)
  * migrations/940100_quotePartyIdInfoExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F940100_quotePartyIdInfoExtension.js)
  * migrations/940101_quotePartyIdInfoExtension-2522.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F940101_quotePartyIdInfoExtension-2522.js)
  * migrations/950100_settlementContentAggregation-decimal184.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950100_settlementContentAggregation-decimal184.js)
  * migrations/950101_transferParticipantStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950101_transferParticipantStateChange.js)
  * migrations/950102_settlementModel-adjustPosition.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950102_settlementModel-adjustPosition.js)
  * migrations/950103_dropTransferParticipantStateChange.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950103_dropTransferParticipantStateChange.js)
  * migrations/950104_settlementModel-settlementAccountTypeId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950104_settlementModel-settlementAccountTypeId.js)
  * migrations/950106_unique_settlement_model_ledger_account_currency.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950106_unique_settlement_model_ledger_account_currency.js)
  * migrations/950107_settlementWindowContent_foreign_settlementModel.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950107_settlementWindowContent_foreign_settlementModel.js)
  * migrations/950108_participantProxy.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950108_participantProxy.js)
  * migrations/950109_fxQuote.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950109_fxQuote.js)
  * migrations/950110_fxQuoteResponse.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950110_fxQuoteResponse.js)
  * migrations/950111_fxQuoteError.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950111_fxQuoteError.js)
  * migrations/950113_fxQuoteDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950113_fxQuoteDuplicateCheck.js)
  * migrations/950114_fxQuoteResponseDuplicateCheck.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950114_fxQuoteResponseDuplicateCheck.js)
  * migrations/950115_fxQuoteConversionTerms.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950115_fxQuoteConversionTerms.js)
  * migrations/950116_fxQuoteConversionTermsExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950116_fxQuoteConversionTermsExtension.js)
  * migrations/950117_fxQuoteResponseConversionTerms.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950117_fxQuoteResponseConversionTerms.js)
  * migrations/950118_fxQuoteResponseConversionTermsExtension.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950118_fxQuoteResponseConversionTermsExtension.js)
  * migrations/950119_fxCharge.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F950119_fxCharge.js)
  * migrations/960100_create_externalParticipant.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960100_create_externalParticipant.js)
  * migrations/960110_alter_transferParticipant__addFiled_externalParticipantId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960110_alter_transferParticipant__addFiled_externalParticipantId.js)
  * migrations/960111_alter_fxTransferParticipant__addFiled_externalParticipantId.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960111_alter_fxTransferParticipant__addFiled_externalParticipantId.js)
  * migrations/960112_fxTransfer-indexes2.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960112_fxTransfer-indexes2.js)
  * migrations/960113_fxTransferExtension-indexes.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960113_fxTransferExtension-indexes.js)
  * migrations/960114_fxTransferTimeout-indexes2.js: (https://github.com/mojaloop/central-ledger/blob/02d747a20aafd34ba6b9e376323ec62f43f4c897/migrations%2F960114_fxTransferTimeout-indexes2.js)
### auth-service
  * migrations/20200624121732_consent.ts: (https://github.com/mojaloop/auth-service/blob/76addac31230674cc6d622c6d345219af6561b0e/migrations%2F20200624121732_consent.ts)
  * migrations/20200624121736_scope.ts: (https://github.com/mojaloop/auth-service/blob/76addac31230674cc6d622c6d345219af6561b0e/migrations%2F20200624121736_scope.ts)
  * migrations/20220322001917_address.ts: (https://github.com/mojaloop/auth-service/blob/76addac31230674cc6d622c6d345219af6561b0e/migrations%2F20220322001917_address.ts)
  * migrations/20220322003603_consent_status.ts: (https://github.com/mojaloop/auth-service/blob/76addac31230674cc6d622c6d345219af6561b0e/migrations%2F20220322003603_consent_status.ts)
### ml-api-adapter
  * config/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/5d5c865cb360d30ec7ff0b2ec16149e8fa0b84de/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/5d5c865cb360d30ec7ff0b2ec16149e8fa0b84de/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/ml-api-adapter/default.json: (https://github.com/mojaloop/ml-api-adapter/blob/5d5c865cb360d30ec7ff0b2ec16149e8fa0b84de/docker%2Fml-api-adapter%2Fdefault.json)
### bulk-api-adapter
  * config/default.json: (https://github.com/mojaloop/bulk-api-adapter/blob/38ffa97d794d4b908ac70fdc3b1a2b90418f5532/config%2Fdefault.json)
  * docker/bulk-api-adapter/default.json: (https://github.com/mojaloop/bulk-api-adapter/blob/38ffa97d794d4b908ac70fdc3b1a2b90418f5532/docker%2Fbulk-api-adapter%2Fdefault.json)
### ml-testing-toolkit
  * spec_files/rules_callback/default.json: (https://github.com/mojaloop/ml-testing-toolkit/blob/45d1567e11244fbda14c4e5225aa900060accfde/spec_files%2Frules_callback%2Fdefault.json)
### transaction-requests-service
  * config/default.json: (https://github.com/mojaloop/transaction-requests-service/blob/a4fc153d2878f52f39b3b41c6bc7dbba10d2a943/config%2Fdefault.json)
### quoting-service
  * config/default.json: (https://github.com/mojaloop/quoting-service/blob/6291ae91106dd8fb647502589721e195e033eccf/config%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/quoting-service/blob/6291ae91106dd8fb647502589721e195e033eccf/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/ml-api-adapter/default.json: (https://github.com/mojaloop/quoting-service/blob/6291ae91106dd8fb647502589721e195e033eccf/docker%2Fml-api-adapter%2Fdefault.json)
  * docker/quoting-service/default.json: (https://github.com/mojaloop/quoting-service/blob/6291ae91106dd8fb647502589721e195e033eccf/docker%2Fquoting-service%2Fdefault.json)
### thirdparty-api-svc
  * config/default.json: (https://github.com/mojaloop/thirdparty-api-svc/blob/f65d770def59f6b949ce2de8a44d8e2ec4c1e511/config%2Fdefault.json)
### central-settlement
  * docker/central-ledger/default.json: (https://github.com/mojaloop/central-settlement/blob/be6ec0cdf115eb8395bd35abd5ea43cf4d0acd21/docker%2Fcentral-ledger%2Fdefault.json)
  * docker/ml-api-adapter/default.json: (https://github.com/mojaloop/central-settlement/blob/be6ec0cdf115eb8395bd35abd5ea43cf4d0acd21/docker%2Fml-api-adapter%2Fdefault.json)
  * src/models/misc/migrationLock.js: (https://github.com/mojaloop/central-settlement/blob/be6ec0cdf115eb8395bd35abd5ea43cf4d0acd21/src%2Fmodels%2Fmisc%2FmigrationLock.js)
  * test/unit/models/misc/migrationLock.test.js: (https://github.com/mojaloop/central-settlement/blob/be6ec0cdf115eb8395bd35abd5ea43cf4d0acd21/test%2Funit%2Fmodels%2Fmisc%2FmigrationLock.test.js)
### account-lookup-service
  * config/default.json: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/config%2Fdefault.json)
  * docker/account-lookup-service/default.json: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/docker%2Faccount-lookup-service%2Fdefault.json)
  * docker/central-ledger/default.json: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/docker%2Fcentral-ledger%2Fdefault.json)
  * migrations/01_currency.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F01_currency.js)
  * migrations/02_endpointType.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F02_endpointType.js)
  * migrations/03_endpointType-indexes.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F03_endpointType-indexes.js)
  * migrations/04_partyIdType.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F04_partyIdType.js)
  * migrations/05_partyIdType-indexes.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F05_partyIdType-indexes.js)
  * migrations/08_oracleEndpoint.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F08_oracleEndpoint.js)
  * migrations/09_oracleEndpoint-indexes.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F09_oracleEndpoint-indexes.js)
  * migrations/10_oracleEndpoint-remove-constraints.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/migrations%2F10_oracleEndpoint-remove-constraints.js)
  * src/models/misc/migrationLock.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/src%2Fmodels%2Fmisc%2FmigrationLock.js)
  * test/unit/models/misc/migrationLock.test.js: (https://github.com/mojaloop/account-lookup-service/blob/0ab9e8adc9712fb9091d2fefd6e49e0dd12cfd17/test%2Funit%2Fmodels%2Fmisc%2FmigrationLock.test.js)

## 8. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
5. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)

## 9. Contributors

- Organizations: BMGF, Co-Develop, InFiTX, MLF
- Individuals: @devarsh10, @elnyry-sam-k, @geka-evk, @gibaros, @kalinkrustev, @kleyow, @oderayi, @pawarspeaks, @s-prak, @shashi165, @TWith2Sugars, @vijayg10 

*Note: names are listed in alphabetical order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v16.0.4...v17.0.0
