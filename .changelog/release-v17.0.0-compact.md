# Helm Release Notes

Date | Revision | Description
---------|----------|---------
2025-03-25 | 0 | Initial release

## 0. Summary

Enhancements and breaking changes to the [v16.0.4 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v16.0.4.md) and the [v16.0.0 Release](https://github.com/mojaloop/helm/blob/main/.changelog/release-v16.0.0.md) releases, which include:

1. FX feature support in Mojaloop: https://docs.mojaloop.io/product/features/fx.html
2. ISO 20022 messages supported in Mojaloop: https://github.com/mojaloop/iso-20022-docs/blob/main/Workstream%20documents/MarketPracticeDoc/MarketPracticeDocument.md
3. Inter-scheme supported: https://docs.mojaloop.io/product/features/interscheme.html
4. Mojaloop FSPIOP API 2.0 now supported (FX, inter-scheme included in)
5. General maintenance: bug fixes, updates to license headers and license files for compliance and Nodejs upgrades
6. Performance improvements in Central Ledger via batching of prepare, filfill messages including error scenarios. Batching now natively supported with batch-size being configurable.

## 1. New Features
* central-ledger: feat: add fx and iso 20022 compatibility ([mojaloop/central-ledger/#1142](https://github.com/mojaloop/central-ledger/pull/1142))
* quoting-service feat: add fx and iso 20022 compatibility ([mojaloop/quoting-service/#383](https://github.com/mojaloop/quoting-service/pull/383))
* account-lookup-service: feat: add fx and iso 20022 compatibility ([mojaloop/account-lookup-service/#518](https://github.com/mojaloop/account-lookup-service/pull/518))
* central-settlement: feat: add fx and iso 20022 compatibility ([mojaloop/central-settlement/#416](https://github.com/mojaloop/central-settlement/pull/416))
* ml-api-adapter: feat: add fx and iso 20022 compatibility ([mojaloop/ml-api-adapter/#564](https://github.com/mojaloop/ml-api-adapter/pull/564))
* **mojaloop/#1142** feat: add iso 20022 compatibility ([mojaloop/#1142](https://github.com/mojaloop/central-ledger/pull/1142))
* **mojaloop/#528** updated central-services-shared to log error details ([mojaloop/#528](https://github.com/mojaloop/account-lookup-service/pull/528)), closes [mojaloop/#528](https://github.com/mojaloop/project/issues/528)
* **mojaloop/#539** add DELETE participants validation ([mojaloop/#539](https://github.com/mojaloop/account-lookup-service/pull/539)), closes [mojaloop/#539](https://github.com/mojaloop/project/issues/539)
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
* **mojaloop/#390** fixed db error - ER_BAD_FIELD_ERROR ([mojaloop/#390](https://github.com/mojaloop/quoting-service/pull/390)), closes [mojaloop/#390](https://github.com/mojaloop/project/issues/390)
* **mojaloop/#394** update streaming lib to use otel ([mojaloop/#394](https://github.com/mojaloop/quoting-service/pull/394)), closes [mojaloop/#394](https://github.com/mojaloop/project/issues/394)
* **mojaloop/#400** updated central-services-shared to log request error details  ([mojaloop/#400](https://github.com/mojaloop/quoting-service/pull/400)), closes [mojaloop/#400](https://github.com/mojaloop/project/issues/400)
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
* **mojaloop/# (** content type default header ([mojaloop/#289](https://github.com/mojaloop/ml-testing-toolkit/pull/289)), closes [mojaloop/# (](https://github.com/mojaloop/project/issues/ ()
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
    |  MySQL   |  bitnami/mysql:8.0.36-debian-11-r4   |     |
    |  Kafka   |  bitnami/kafka:3.9.0-debian-12-r12   |     |
    |  Redis   |  bitnami/redis:7.4.2-debian-12-r6   |     |
    |  Redis Cache   |  bitnami/redis-cluster:7.2.5-debian-12-r3   |     |
    |  MongoDB   |  bitnami/mongodb:8.0.6-debian-12-r0   |     |
    |  Testing Toolkit Test Cases   |  [v17.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v17.0.0)   |     |
    |  example-mojaloop-backend   |  v17.0.0   |  [README](https://github.com/mojaloop/helm/blob/main/example-mojaloop-backend/README.md)   |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/technical/deployment-guide/).

3. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases) (See above Dependency Test Matrix for exact version required for this release) Golden Path collections expects:
    - the Quoting service operating mode to be set quoting-service.config.simple_routing_mode_enabled=true (in helm mojaloop/values.yaml under quoting-service config). If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter **SIMPLE_ROUTING_MODE_ENABLED** ( in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues) to match.
    - the **on-us transfers** (in mojaloop/values.yaml "enable_on_us_transfers: false" under centralledger-handler-transfer-prepare -> config and  cl-handler-bulk-transfer-prepare -> config) configuration to be disabled. The test-case environment variable parameter (**ON_US_TRANSFERS_ENABLED** (in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues), the same name used on postman collections) must similarly match this value.

4. Simulators
    - We recommend using Testing Toolkit instead of Postman which is better suited for the async nature of the Mojaloop API specification (see above)
    - [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used for single transfers usually and three more specific to bulk).
    - The [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/) is used to simulate FSPs for several test cases in the test collections and these can be run from the TTK UI or command line (CLI) options
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
  * Configuration changes in central-ledger config files
  * Database changes to central-ledger to support new features (FX, Inter-scheme, ISO 20022 messaging)
### ml-api-adapter
  * Configuration changes
  * API changes to support FSPIOP 2.0 and ISO 20022 messaging
### bulk-api-adapter
  * Configuration changes
  * API changes to support FSPIOP 2.0 and ISO 20022 messaging
### transaction-requests-service
  * Configuration changes
  * API changes to support FSPIOP 2.0
### quoting-service
  * Configuration changes
  * API changes to support FSPIOP 2.0 and ISO 20022 messaging
### account-lookup-service
  * Configuration changes
  * API changes to support FSPIOP 2.0 and ISO 20022 messaging

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
