## Helm release notes
1. For breaking changes, please review the section `#4` "Breaking Changes" below.

## 1. New Features

1. Change the basis for the liquidity check ([mojaloop/design-authority-project/issues/90](https://github.com/mojaloop/design-authority-project/issues/90)). Pull requests are [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899) & [mojaloop/central-ledger/pull/901](https://github.com/mojaloop/central-ledger/pull/901)
2. **mojaloop/#2092:** upgrade nodeJS version for core services ([ml-api-adapter/#501](https://github.com/mojaloop/ml-api-adapter/pull/501)) ([central-ledger/#902](https://github.com/mojaloop/central-ledger/issues/902)) ([account-lookup/#445](https://github.com/mojaloop/account-lookup-service/pull/445)) ([quoting-service/#302](https://github.com/mojaloop/quoting-service/pull/302)), closes [mojaloop/#2092](https://github.com/mojaloop/project/issues/2092)

## 2. Bug Fixes
1. **mojaloop/#2719:** post quotes fails when transactionId does not equal transactionRequestId ([central-ledger/#887](https://github.com/mojaloop/central-ledger/issues/887)) ([central-ledger/b9944d1](https://github.com/mojaloop/central-ledger/commit/b9944d15c9486ffd62b968797fb79847a512a6c8)), closes [mojaloop/#2719](https://github.com/mojaloop/project/issues/2719)
2. **mojaloop/#2704:** core-services support for non-breaking backward api compatibility ([#884](https://github.com/mojaloop/central-ledger/issues/884)) ([02cf7c2](https://github.com/mojaloop/central-ledger/commit/02cf7c25b4071bb44f62271d7e9bdbc8674a1ee7)), closes [mojaloop/#2704](https://github.com/mojaloop/project/issues/2704)
3. **mojaloop/#2522:** cl-migration scripts should configure quoting tables to utf8 follow-up ([#865](https://github.com/mojaloop/central-ledger/issues/865)) ([dcc57b8](https://github.com/mojaloop/central-ledger/commit/dcc57b8f22bc66fa4e6ae35ce04cf095fce780c6)), closes [mojaloop/#2522](https://github.com/mojaloop/project/issues/2522)
4. **mojaloop/#2480:** central-ledger migration scripts to configure quote party table utf8 support ([#862](https://github.com/mojaloop/central-ledger/issues/862)) ([bf4da0e](https://github.com/mojaloop/central-ledger/commit/bf4da0e7645edf2e701b36b9f78c32c8783136b8)), closes [mojaloop/#2480](https://github.com/mojaloop/project/issues/2480)

## 3. Application versions

1. ml-api-adapter: v13.0.0 -> **v14.0.0**
2. central-ledger: v13.16.1 -> **v15.1.1**
3. account-lookup-service: v13.0.0 -> **v14.0.0**
4. quoting-service: v14.0.0 -> **15.0.2**
5. central-settlement: **13.4.1**
6. central-event-processor: **v11.0.2**
7. bulk-api-adapter: **v13.0.1**
8. email-notifier: **v11.0.2**
9. als-oracle-pathfinder: **v11.0.4**
10. transaction-requests-service: **v13.0.0**
11. finance-portal-ui: **v10.4.3**
12. finance-portal-backend-service: **v15.0.2**
13. settlement-management: **v11.0.0**
14. operator-settlement: **v11.0.0**
15. event-sidecar: **v11.0.1**
16. event-stream-processor: **v11.0.0-snapshot**
17. simulator: **v11.1.3**
18. mojaloop-simulator: **v11.6.1**
19. sdk-scheme-adapter: **v11.18.11**
20. ml-testing-toolkit: **v14.0.4**
21. ml-testing-toolkit-ui: **v13.5.5**
22. auth-service: **v11.11.1**
23. als-consent-service: **v0.0.8**
24. thirdparty-api-svc: **v11.21.0**
25. thirdparty-sdk: **v11.55.1**

## 4. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v15.1.0
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.4.1
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v11.0.2
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v13.0.1
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v12.0.2
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v11.0.4
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v13.0.0
11. finance-portal-ui - https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3
12. finance-portal-backend-service - https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2
13. settlement-management - https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0
14. operator-settlement - https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0
15. event-sidecar - https://github.com/mojaloop/event-sidecar/releases/tag/v11.0.1
16. event-stream-processor - https://github.com/mojaloop/event-stream-processor/releases/v11.0.0-snapshot
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v11.1.3
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v11.6.1
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v11.18.11
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v14.0.4
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.5.5
22. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v11.11.1
23. als-consent-service - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.0.8
24. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v11.21.0
25. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v11.55.1

## 5. Breaking changes

1. Central Ledger - Transfer will be successful only if the payer has sufficient liquidity in their settlement account balance over and above their NET-DEBIT-CAP (NDC) limit. This is the additional check that has been added in this PR, and will be applied to the lower value. Error messages have changed as a result. For NDC limit check from `PAYER_FSP_INSUFFICIENT_LIQUIDITY` to `PAYER_LIMIT_ERROR`. The error message `PAYER_FSP_INSUFFICIENT_LIQUIDITY` occurs when the payer has an insufficient settlement account balance. [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899)
2. **mojaloop/#2092:** Major version bump for node v16 LTS support, re-structuring of project directories to align to core Mojaloop repositories with docker image now using `/opt/app` instead of `/opt/central-ledger`, `opt/account-lookup-service`, `opt/ml-api-adapter`, `/opt/quoting-service` which will impact config mounts.

## 6. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.0.0)' Golden Path collections expects:
	-  the Quoting service operating mode to be set [quoting-service.config.simple_routing_mode_enabled](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L4664)=true. If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter [SIMPLE_ROUTING_MODE_ENABLED](https://github.com/mojaloop/helm/blob/v14.0.0/mojaloop/values.yaml#L7420) to match.
	- the [on-us transfers](https://github.com/mojaloop/helm/blob/v14.0.0/mojaloop/values.yaml#L321) configuration to be disabled. The test-case environment variable parameter ([ON_US_TRANSFERS_ENABLED](https://github.com/mojaloop/helm/blob/v14.0.0/mojaloop/values.yaml#L7423), the same name used on postman collections) must similarly match this value.

3. Simulators
	- We recommend using Testing Toolkit instead of Postman which is better suited for the async nature of the Mojaloop API specification (see above)
	- [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used).
	- Ensure that correct Postman Scripts are used if you wish to test against the Mojaloop-Simulators:
    	- Setup Mojaloop Hub: [MojaloopHub_Setup](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopHub_Setup.postman_collection.json)
    	- Setup Mojaloop Simulators for testing : [MojaloopSims_Onboarding](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopSims_Onboarding.postman_collection.json)
    	- Golden path tests: [Golden_Path_Mojaloop](https://github.com/mojaloop/postman/blob/v12.0.0/Golden_Path_Mojaloop.postman_collection.json)
	- Legacy Simulators are still required and deployed by default; disabling this will cause issues since there is Account Lookup directory mocking functionality in this service.

4. This release has been tested against the following:
	- Kubernetes: v1.20.6
	- Nginx Ingress Controllers: 0.43.0
	- Testing Toolkit Test Cases: [v14.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.0.0)

5. Thirdparty Testing Toolkit Test Collections are not repeatable. Please refer to the following issue for more information [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717). It is possible to manually cleanup persistent data to re-run the test if required.

6. Bulk API Helm Tests

  Refer to the [Testing Deployments](../README.md#testing-deployments) section in the main README for detailed information on how to enable bulk-api-adapter tests.

7. Thirdparty API Helm Tests

  Refer to [thirdparty/README.md#validating-and-testing-the-3p-api](../thirdparty/README.md#validating-and-testing-the-3p-api) on how to enabled and execute Thirdparty verification tests.

8. Contributors

- Organizations: BMGF, CrossLake, ModusBox, Sybrin
- Individuals: @elnyry-sam-k, @mdebarros, @vijayg10, @shashi165, @kleyow, @lewisdaly, @donaldbartlett

_Note: companies are in alphabetical order, individuals are in no particular order._
