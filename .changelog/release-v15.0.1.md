# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-06-08 | 0 | Initial draft
  |  |

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 0. Summary

Minor parch release for [v15.0.0 Release](./release-v15.0.0.md) includes:

1. CronJob for cleanup scripts to ensure that liquidity is reset. This should allow daily cron-jobs to run indefinitely.

Refer to full feature and bug fix list below for more info; and testing improvements listed separately.

## 1. New Features

1. **mojaloop/#3361** Reset Liquidity - Add CRON Job to reset ([helm/pull/?](https://github.com/mojaloop/helm/pull/?)), closes [mojaloop/#3361](https://github.com/mojaloop/project/issues/3361)

## 2. Bug Fixes

N/A.

## 3. Application versions

1. ml-api-adapter: [v14.0.0](https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0)
2. central-ledger: [v17.0.3](https://github.com/mojaloop/central-ledger/releases/tag/v17.0.3)
3. account-lookup-service: [v14.0.0](https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0)
4. quoting-service: [v15.0.2](https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2)
5. central-settlement: [v15.0.0](https://github.com/mojaloop/central-settlement/releases/tag/v15.0.0)
6. bulk-api-adapter: [v15.0.3](https://github.com/mojaloop/bulk-api-adapter/releases/tag/v15.0.3)
7. central-event-processor: [v12.0.0](https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
8. email-notifier: [v12.0.0](https://github.com/mojaloop/email-notifier/releases/tag/v12.0.0) *(Refer to section 5. BREAKING CHANGES)*
9. als-oracle-pathfinder: [v12.0.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0)
10. transaction-requests-service: [v14.0.1](https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.0.1)
11. finance-portal-ui: [v10.4.3](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3) *(DEPRECATED)*
12. finance-portal-backend-service: [v15.0.2](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2) *(DEPRECATED)*
13. settlement-management: [v11.0.0](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0) *(DEPRECATED)*
14. operator-settlement: [v11.0.0](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0) *(DEPRECATED)*
15. event-sidecar: [v12.0.0](https://github.com/mojaloop/event-sidecar/releases/tag/v12.0.0)
16. event-stream-processor: [v12.0.0-snapshot.7](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7)
17. simulator: [12.0.0](https://github.com/mojaloop/simulator/releases/tag/v12.0.0)
18. mojaloop-simulator: [v14.0.1](https://github.com/mojaloop/mojaloop-simulator/releases/tag/v14.0.1)
19. sdk-scheme-adapter: [v22.0.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v22.0.1)
20. ml-testing-toolkit: [v16.1.1](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v16.1.1)
21. ml-testing-toolkit-ui: [v15.3.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.3.0)
22. ml-testing-toolkit-client-lib: [v1.2.0](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.0)
23. auth-service: [v14.0.0](https://github.com/mojaloop/auth-service/releases/tag/v14.0.0)
24. als-consent-oracle: [v0.2.0](https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0)
25. thirdparty-api-svc: [v13.0.2](https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2)
26. thirdparty-sdk: [v15.1.0](https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0)

## 4. API Versions

This release supports the following versions of the [Mojaloop family of APIs](https://docs.mojaloop.io/api):

| API         | Supported Versions                                                                                                                                    | Notes |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| FSPIOP      | [v1.1](https://docs.mojaloop.io/api/fspiop/v1.1/api-definition.html), [v1.0](https://docs.mojaloop.io/api/fspiop/v1.0/api-definition.html) |       |
| Settlements | [v2.0](https://docs.mojaloop.io/api/settlement)                                                                                            |       |
| Admin       | [v1.0](https://docs.mojaloop.io/api/administration/central-ledger-api.html)                                                                |       |
| Oracle      | [v1.0](https://docs.mojaloop.io/legacy/api/als-oracle-api-specification.html)                                                              |       |
| Thirdparty  | [v1.0](https://docs.mojaloop.io/api/thirdparty)                                                                                           |       |

## 5. Breaking changes

N/A

## 6. Deprecations

The following components have been deprecated from the packaged Mojaloop Helm chart release and have been with [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs), which can be deployed by the official [BoF Helm Chart](https://github.com/mojaloop/charts/tree/master/mojaloop/bof):

- [finance-portal](https://github.com/mojaloop/helm/tree/master/finance-portal) Helm Chart
  - [finance-portal-ui](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3)
  - [finance-portal-backend-service](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2)
- [finance-portal-settlement-management](https://github.com/mojaloop/helm/tree/master/finance-portal-settlement-management) Helm Chart
  - [settlement-management](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0)
  - [operator-settlement](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0)

> *Note these Helm Chart are still available for deployment in the [Mojaloop Helm Repo (http://mojaloop.io/helm/repo/)](http://mojaloop.io/helm/repo/index.yaml).*

This is due to the underlying services having been deprecated by the Micro-Services provided by the [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs) for Financial Management and Reporting.

More information can be found here:

- https://github.com/mojaloop/business-operations-framework-docs.

[BOF Helm charts](https://github.com/mojaloop/charts/tree/master/mojaloop/bof) to deploy the [Business Operation Framework](https://github.com/mojaloop/business-operations-framework-docs) can be found here:

- https://github.com/mojaloop/charts/tree/master/mojaloop/bof

## 7. Testing notes

1. This release has been validated against the following dependency Test Matrix:

    | Dependency | Version |  Notes   |
    | ---------- | ------- | --- |
    | Kubernetes | v1.26.4 | [AWS EKS](https://aws.amazon.com/eks/), [AWS EKS Supported Version Notes](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)  |
    | containerd  |  v1.6.19  |  |
    | Nginx Ingress Controller | [helm-ingress-nginx-4.7.0](https://github.com/kubernetes/ingress-nginx/releases/tag/helm-chart-4.7.0) / [ingress-controller-v1.8.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.8.0) |     |
    |  Amazon Linux   |  v2   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v15.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0)   |     |
    |  example-mojaloop-backend   |  v15.0.0   |  [README](../example-mojaloop-backend/README.md)   |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases for v15.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.0.0) Golden Path collections expects:
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
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2892 - Disabled DFSP showing getParty info](https://github.com/mojaloop/project/issues/2892)
5. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
6. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2845 - QA: Replace Legacy-Simulator as a NORESPONSE_SIMPAYEE in Testing-Toolkit Goden Path Test-Suite](https://github.com/mojaloop/project/issues/2845)
    3. [#3027 - QA: Mojaloop Helm v14.1.0 Release - Bulk Tests fail on first run](https://github.com/mojaloop/project/issues/3027)
    4. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)
    5. [#3164 - GP Tests fail intermitantly when upgrading a release from v14.1.1 to v15 due to WS issues between TTK and SDKs](https://github.com/mojaloop/project/issues/3164)

## 9. Contributors

- Organizations: BMGF, InFiTX
- Individuals: @chris-me-law , @dfry , @elnyry-sam-k , @PaulGregoryBaker , @mdebarros , @vijayg10

*Note: companies are in alphabetical order, individuals are in no particular order.*
