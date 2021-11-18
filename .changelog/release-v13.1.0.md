## Helm release notes
1. GitHub issue: https://github.com/mojaloop/project/issues/2528
2. For breaking changes, please review the section `#7` "Breaking Changes" below.
3. Revisions:

Date | Revision | Description
---------|----------|---------
 2021-10-01 | 0 | Initial draft

### 1. Maintenance updates

1. change endpoint types to line up with enums ([#863](https://github.com/mojaloop/central-ledger/issues/863))

### 2. New Features

1. **mojaloop/#2314:** Add CGS default settlement test cases in testing toolkit test collection ([testing-toolkit-test-cases/pull/#54](https://github.com/mojaloop/testing-toolkit-test-cases/pull/54), (testing-toolkit-test-cases/pull/#57)[https://github.com/mojaloop/testing-toolkit-test-cases/pull/57], [mojaloop/helm/pull/#458](https://github.com/mojaloop/helm/pull/458), closes [mojaloop/#2314](https://github.com/mojaloop/project/issues/2314))
2. **mojaloop/#2505:** als-subid-error-callback-endpoint-not-implemented ([account-lookup-service/issues/#429](https://github.com/mojaloop/account-lookup-service/issues/429)), closes [mojaloop/#2505](https://github.com/mojaloop/account-lookup-service/issues/2505) [mojaloop/#2505](https://github.com/mojaloop/account-lookup-service/issues/2505)
3. **mojaloop/#2450:** feat(thirdparty): add tp-api-svc and round out thirdparty sub-chart ([helm/pull/#454](https://github.com/mojaloop/helm/pull/454), closes [mojaloop/#2450](https://github.com/mojaloop/project/issues/2450))
4. **mojaloop/#2532:** feat(thirdparty): add thirdparty support to mojaloop-simulator chart ([helm/pull/#456](https://github.com/mojaloop/helm/pull/456), closes [mojaloop/#2532](https://github.com/mojaloop/project/issues/2532))
5. **mojaloop/#2556:** Implement patch notification for failure scenarios (following v1.1 update) ([xxxx](xxxx), closes [mojaloop/#xxxx](https://github.com/mojaloop/project/issues/2556))
6. Testing Toolkit:
   1. Moved object store init config to system config ([ml-testing-toolkit/pull/189](https://github.com/mojaloop/ml-testing-toolkit/pull/189))
   2. Added labels functionality to test cases ([ml-testing-toolkit/pull/193](https://github.com/mojaloop/ml-testing-toolkit/pull/193), [ml-testing-toolkit-ui/pull/122](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/122), [ml-testing-toolkit-ui/pull/123](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/123) and [ml-testing-toolkit-ui/pull/124](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/124)), closes [mojaloop/#2161](https://github.com/mojaloop/project/issues/2161)
   3. Added thirdparty-sdk outbound API ([ml-testing-toolkit/pull/195](https://github.com/mojaloop/ml-testing-toolkit/pull/195)), closes [mojaloop/#2533](https://github.com/mojaloop/project/issues/2533)
   4. New feature: Test cases definition report with grouping ([ml-testing-toolkit/pull/196](https://github.com/mojaloop/ml-testing-toolkit/pull/196)), closes [mojaloop/#2348](https://github.com/mojaloop/project/issues/2348)

### 3. Bug Fixes

1. **mojaloop/#2522:** cl-migration scripts should configure quoting tables to utf8 follow-up ([central-ledger/issues/#865](https://github.com/mojaloop/central-ledger/issues/865)), closes [mojaloop/#2522](https://github.com/mojaloop/central-ledger/issues/2522)
2. **mojaloop/#2525:** transfers are not being assigned to a settlementWindow on transfers version=1.1 ([central-ledger/issues/#866](https://github.com/mojaloop/central-ledger/issues/866)), closes [mojaloop/#2525](https://github.com/mojaloop/project/issues/2525)
3. **mojaloop/#2527:** transfers PUT callback on version=1.1 is not assigning destination headers correctly ([ml-api-adapter/issues/#866](https://github.com/mojaloop/ml-api-adapter/issues/486)), closes [mojaloop/#2527](https://github.com/mojaloop/project/issues/2527)
4. **mojaloop/#2549:** sdk-scheme-adapter support for test currencies XXX, XTS revoked with use of api-snippets ([api-snippets/pull/#115](https://github.com/mojaloop/api-snippets/pull/115), [sdk-scheme-adapter/pull/287](https://github.com/mojaloop/sdk-scheme-adapter/pull/287), closes [mojaloop/#2527](https://github.com/mojaloop/project/issues/2549))
5. **mojaloop/#2534:** FSPIOP API version negotiation not handled - Account-lookup-service ([account-lookup-service/pull/#430](https://github.com/mojaloop/account-lookup-service/pull/430), closes[mojaloop/#xxxx](https://github.com/mojaloop/project/issues/2534))
6. **mojaloop/#2535:** FSPIOP API version negotiation not handled - Quoting-Service ([quoting-service/pull/#289](https://github.com/mojaloop/quoting-service/pull/289), [quoting-service/pull/290](https://github.com/mojaloop/quoting-service/pull/290), closes [mojaloop/#xxxx](https://github.com/mojaloop/project/issues/2535))
7. **mojaloop/#2536:** FSPIOP API version negotiation not handled - Transfers-service ([ml-api-adapter/pull/#487](https://github.com/mojaloop/ml-api-adapter/pull/487), closes [mojaloop/#2536](https://github.com/mojaloop/project/issues/2536))
8. **mojaloop/#2537:** FSPIOP API version negotiation not handled - Transaction-request-service ([transaction-requests-service/pull/#80](https://github.com/mojaloop/transaction-requests-service/pull/80), closes [mojaloop/#xxxx](https://github.com/mojaloop/project/issues/2537))
9. **mojaloop/#2538:** FSPIOP API version negotiation not handled - Bulk-api-adapter ([bulk-api-adapter/pull/#67](https://github.com/mojaloop/bulk-api-adapter/pull/67), closes[mojaloop/#2538](https://github.com/mojaloop/project/issues/2538))
10. **mojaloop/#2557:** In error notification to Payer FSP, header for source having wrong value ([ml-api-adapter/pull/#488](https://github.com/mojaloop/ml-api-adapter/pull/488), [central-ledger/pull/#869](https://github.com/mojaloop/central-ledger/pull/869), [central-services-shared/pull/#316](https://github.com/mojaloop/central-services-shared/pull/316), closes [mojaloop/#2557](https://github.com/mojaloop/project/issues/2557))
11. **mojaloop/#2574:** SDK-Scheme-Adapter is not returning Party Sub-Id ([mojaloop-simulator/pull/#120](https://github.com/mojaloop/mojaloop-simulator/pull/120), closes[mojaloop/#xxxx](https://github.com/mojaloop/project/issues/2574))
12. als-oracle-pathfinder fix: init and startup issues ([als-oracle-pathfinder/pull/#61](https://github.com/mojaloop/als-oracle-pathfinder/pull/61))
13. Testing Toolkit:
    1. Fixed TLS connectivity in hosted mode ([ml-testing-toolkit/pull/192](https://github.com/mojaloop/ml-testing-toolkit/pull/192)), closes [mojaloop/#1790](https://github.com/mojaloop/project/issues/1790)
    2. Fixed fxapi callback map ([ml-testing-toolkit/pull/194](https://github.com/mojaloop/ml-testing-toolkit/pull/194))
    3. Fixed stop button not working intermittently ([ml-testing-toolkit-ui/pull/121](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/121)), closes [mojaloop/#2332](https://github.com/mojaloop/project/issues/2332)

## 4. Application versions

1. ml-api-adapter: v11.1.6 -> **v12.0.0**
2. central-ledger: v13.14.0 -> **v13.14.3**
3. account-lookup-service: v11.7.7 -> **v12.0.0**
4. quoting-service: 12.0.10 -> **13.0.1**
5. central-settlement: **13.4.1**
6. central-event-processor: **v11.0.2**
7. bulk-api-adapter: 11.1.4 -> **v12.0.1**
8. email-notifier: **v11.0.2**
9. als-oracle-pathfinder: v11.0.0 -> **v11.0.4**
10. transaction-requests-service: **v12.0.1**
11. finance-portal-ui: **v10.4.3**
12. finance-portal-backend-service: **v15.0.2**
13. settlement-management: **v11.0.0**
14. operator-settlement: **v11.0.0**
15. event-sidecar: **v11.0.1**
16. event-stream-processor: **v11.0.0-snapshot**
17. simulator: **v11.1.3**
18. mojaloop-simulator: **v11.6.1**
19. sdk-scheme-adapter: **v11.18.8**
20. ml-testing-toolkit: v13.5.1 -> **v14.0.2**
21. ml-testing-toolkit-ui: v13.5.2 -> **v13.5.5**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v12.0.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.14.3
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v12.0.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v13.0.1
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.4.1
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v11.0.2
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v11.1.4
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v12.0.1
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v11.0.4
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v12.0.1
11. finance-portal-ui - https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3
12. finance-portal-backend-service - https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2
13. settlement-management - https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0
14. operator-settlement - https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0
15. event-sidecar - https://github.com/mojaloop/event-sidecar/releases/tag/v11.0.1
16. event-stream-processor - https://github.com/mojaloop/event-stream-processor/releases/v11.0.0-snapshot
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v11.1.3
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v11.6.1
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v11.18.8
20. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v11.55.1
21. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v14.0.2
22. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.5.5

## 6. Operational Chart versions

1. EFK: **v12.0.0**
2. Promfana: **v11.0.0**

## 7. Breaking changes

1. Testing Toolkit - Moved TLS related configuration parameters from user config to system config ([ml-testing-toolkit/releases/v14.0.0](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v14.0.0))

## 8. Upgrade notes

1. Updates to Testing Toolkit environment file

{{PLACEHOLDER}}

2. Mojaloop-Simulator Rules path requires a `$` prefix (Known Issue)

Take note that existing rules may not work without modifying the path to add a `$` prefix. See the following link for more information: https://github.com/mojaloop/mojaloop-simulator/pull/120#discussion_r747311386.

## 9. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.1.0)' Golden Path collections expects:
	-  the Quoting service operating mode to be set [quoting-service.config.simple_routing_mode_enabled](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L4664)=true. If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter [SIMPLE_ROUTING_MODE_ENABLED](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L7420) to match.
	- the [on-us transfers](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L321) configuration to be disabled. The test-case environment variable parameter ([ON_US_TRANSFERS_ENABLED](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L7423), the same name used on postman collections) must similarly match this value.

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
	- Testing Toolkit Test Cases: [v13.1.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.1.0)

## 10. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2352 - Mojaloop Helm support for Kubernetes 1.22](https://github.com/mojaloop/project/issues/2352)
4. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)
5. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
6. [Mojaloop-Simulator Rules path requires a `$` prefix](https://github.com/mojaloop/mojaloop-simulator/pull/120#discussion_r747311386)

## 11. Contributors

- Contributing organizations: BMGF, CrossLake, ModusBox
- ModusBox: @elnyry-sam-k, @mdebarros, @vijayg10, @shashi165, @kleyow, @lewisdaly

_Note: companies in alphabetical order_
