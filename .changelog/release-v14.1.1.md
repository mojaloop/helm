# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2022-12-16 | 0 | Initial draft of RC
 2023-02-20 | 0 | Initial release v14.1.1

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 1. New Features

1. **Testing Toolkit**:
    1. Redesigned ttk definition report [ml-testing-toolkit/pull/223](https://github.com/mojaloop/ml-testing-toolkit/pull/223), closes [mojaloop/#2890](https://github.com/mojaloop/project/issues/2890)
    2. Added rule import and exporting functionality using TTK [ml-testing-toolkit/pull/225](https://github.com/mojaloop/ml-testing-toolkit/pull/225), closes [mojaloop/#3033](https://github.com/mojaloop/project/issues/3033)
    3. Added report save functionality [ml-testing-toolkit/pull/224](https://github.com/mojaloop/ml-testing-toolkit/pull/224), closes [mojaloop/#3058](https://github.com/mojaloop/project/issues/3058)
    4. Added report listing endpoint [ml-testing-toolkit/pull/226](https://github.com/mojaloop/ml-testing-toolkit/pull/226), closes [mojaloop/#3060](https://github.com/mojaloop/project/issues/3060)
    5. Added config option to configure socket io [ml-testing-toolkit/pull/232](https://github.com/mojaloop/ml-testing-toolkit/pull/232), closes [mojaloop/#3075](https://github.com/mojaloop/project/issues/3075)
2. **Testing Toolkit UI**:
    1. Added rule import and exporting functionality using TTK UI [ml-testing-toolkit-ui/pull/154](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/154), closes [mojaloop/#3033](https://github.com/mojaloop/project/issues/3033)
    2. Added report history page ([ml-testing-toolkit-ui/pull/155](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/155)), closes [mojaloop/#3060](https://github.com/mojaloop/project/issues/3060)
3. **Testing Toolkit Client Library**:
    1. Added option to save report on local TTK backend [ml-testing-toolkit-client-lib/pull/2](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/2), closes [mojaloop/#3058](https://github.com/mojaloop/project/issues/3058)

## 2. Bug Fixes

1. **mojaloop/#2890** issue with meta info option and added markdown support ([ml-testing-toolkit-ui/pull/151](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/151)), closes [mojaloop/#2890](https://github.com/mojaloop/project/issues/2890)
2. **mojaloop/#3031** address conflicting parent/child onChange cal ([ml-testing-toolkit-ui/pull/152](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/152)), closes [mojaloop/#3031](https://github.com/mojaloop/project/issues/3031)
3. **mojaloop/#3032** configurable param option fixes ([ml-testing-toolkit-ui/pull/148](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/148)), closes [mojaloop/#3032](https://github.com/mojaloop/project/issues/3032)
4. **mojaloop/#3076** TTK UI - Break on Error feature is not working as expected ([ml-testing-toolkit-ui/pull/156](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/156)), closes [mojaloop/#3076](https://github.com/mojaloop/project/issues/3076)
5. **mojaloop/#3113** downgrade antd due to UI performance issues with v5 ([ml-testing-toolkit-ui/pull/169](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/169)), closes [mojaloop/#3113](https://github.com/mojaloop/project/issues/3113)
6. **mojaloop/#3127** ingressClassName is hardcoded in TTK helm chart (**TODO** reference helm PR), closes [mojaloop/#3127](https://github.com/mojaloop/project/issues/3127)
7. **mojaloop/#3076** refactor break on error ([ml-testing-toolkit/pull/227](https://github.com/mojaloop/ml-testing-toolkit/pull/227)), closes [mojaloop/#3076](https://github.com/mojaloop/project/issues/3076)

## 3. Application versions

1. ml-api-adapter: **v14.0.0**
2. central-ledger: **v16.3.1**
3. account-lookup-service: **v14.0.0**
4. quoting-service: **v15.0.2**
5. central-settlement: **v15.0.0**
6. central-event-processor: **v12.0.0**
7. bulk-api-adapter: **v14.2.0**
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
19. sdk-scheme-adapter: **v21.4.0**
20. ml-testing-toolkit: v15.2.0 -> **v15.7.0** ([Compare](https://github.com/mojaloop/ml-testing-toolkit/compare/v15.2.0...v15.7.0))
21. ml-testing-toolkit-ui: v15.0.1 -> **v15.1.3** ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v15.0.1...v15.1.3))
22. ml-testing-toolkit-client-lib: v1.0.0 -> **v1.1.1** ([Compare](https://github.com/mojaloop/ml-testing-toolkit-client-lib/compare/v1.0.0...v1.1.1))
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
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v15.7.0
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.1.3
22. ml-testing-toolkit-client-lib - https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.1.1
23. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v13.0.2
24. als-consent-oracle - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0
25. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2
26. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0

## 5. Breaking changes

[Breaking changes from v14.1.0 Release notes](./release-v14.1.0.md#5-breaking-changes) are applicable here if upgrading from v14.0.0.

## 6. Deprecations

[Deprecation notices from v14.1.0 Release notes](./release-v14.1.0.md#6-deprecations) are applicable.

## 7. Testing notes

1. This release has been tested against the following:
    - Kubernetes: `v1.24.8`
    - Testing Toolkit Test Cases: [v14.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.1.0)

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
11. [#2925 - Helm Test Intermittent failure with 'Generic ID not found'](https://github.com/mojaloop/project/issues/2925)

## 9. Contributors

- Organizations: BMGF, CrossLake, InFiTX
- Individuals: @chris-me-law , @dfry , @elnyry-sam-k , @kirgene , @kleyow , @PaulGregoryBaker , @mdebarros , @sri-miriyala , @tdaly61 , @vijayg10

_Note: companies are in alphabetical order, individuals are in no particular order._
