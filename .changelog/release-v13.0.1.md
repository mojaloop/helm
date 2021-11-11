## Helm release notes
1. GitHub issue: https://github.com/mojaloop/project/issues/2343
2. For breaking changes, please review the section `#7` "Breaking Changes" below.
3. Revisions:

Date | Revision | Description
---------|----------|---------
 2021-08-03  | 0 | Initial release - https://github.com/mojaloop/helm/pull/443

### 1. Maintenance updates

1. feat(#2343): helm v13.0.1 release:
   * Patch bump to Mojaloop Helm Charts
   * Patch Bump to Central-Settlements
     * Updated Central-Settlements from 13.2.0 to 13.4.1
   * Bump to Account-Lookup-Service
     * Updated Account-Lookup-Service from 11.5.3 to 11.7.0
   * Bump to Testing-Toolkit Charts
     * Updated Testing-Toolkit-Backend from 12.4.2 to 13.2.2
     * Updated Testing-Toolkit-UI from 12.4.2 to 13.2.2
     * Updated Testing-Toolkit-CLI from 12.4.2 to 13.2.2

2. Testing-Toolkit
   * Provisioned new APIs (https://github.com/mojaloop/project/issues/2336)
     * Central Admin API v1.0
     * Central Settlements API v2.0
     * SDK Outbound Scheme Adapter API v1.0
   * Refined callback rules
   * Added Test-case definition generation functionality (https://github.com/mojaloop/project/issues/2237)
   * Improvements in mobile simulator page with settlement related additions to support Deferred Multilateral Net Settlement (DMLNS) and Continuous Gross Settlement (CGS)demos

### 2. New Features

1. Modify switch behaviour on receipt of a GET /parties message to avoid problems with duplicates (https://github.com/mojaloop/design-authority-project/issues/79)

### 3. Bug Fixes

1. TTK Tests is using hard-coded USD currency [#2066](https://github.com/mojaloop/project/issues/2066)
2. Default CGS model settles also Deferred Net transfers [#2325](https://github.com/mojaloop/project/issues/2325)
3. ALS Admin Service DELETE API not working as expected [#2342](https://github.com/mojaloop/project/issues/2342)
4. Tests coverage not provided for scenarios when Deferred Multilateral Net Settlement (DMLNS) and Continuous Gross Settlement (CGS) models are used on the same Switch [#2314](https://github.com/mojaloop/project/issues/2314)
5. Central-Settlement-service is failing GP tests when enabling event-sdk sidecar [#2368](https://github.com/mojaloop/project/issues/2368)
6. Testing-Toolkit
     * Test execution stops with error 'max call stack' when http outbound errors like socket hangup [#2312](https://github.com/mojaloop/project/issues/2312)
     * Proper progress updates [#2331](https://github.com/mojaloop/project/issues/2331)
     * Change UI to insert normalized lower case request headers [#2310](https://github.com/mojaloop/project/issues/2310)
     * Add input values not working [#2329](https://github.com/mojaloop/project/issues/2329)
     * Callback timeout in settings [#2330](https://github.com/mojaloop/project/issues/2330)
     * Login is not working in the hosted mode [#2359](https://github.com/mojaloop/project/issues/2359)

## 4. Application versions

1. ml-api-adapter: **v11.1.6**
2. central-ledger:  **v13.12.1**
3. account-lookup-service: v11.5.3 -> **v11.7.0**
4. quoting-service: **v12.0.6**
5. central-settlement: v13.2.0 -> **13.4.1**
6. central-event-processor: **v11.0.2**
7. bulk-api-adapter: **v11.1.4**
8. email-notifier: **v11.0.2**
9. als-oracle-pathfinder: **v11.0.0**
10. transaction-requests-service: **v11.1.5**
11. finance-portal-ui: **v10.4.3**
12. finance-portal-backend-service: **v15.0.2**
13. settlement-management: **v11.0.0**
14. operator-settlement: **v11.0.0**
15. event-sidecar: **v11.0.1**
16. event-stream-processor: **v11.0.0-snapshot**
17. simulator: **v11.1.2**
18. mojaloop-simulator: **v11.4.3**
19. sdk-scheme-adapter: **v11.17.1**
20. ml-testing-toolkit: v12.4.2 -> **v13.2.2**
21. ml-testing-toolkit-ui: v12.2.3 -> **v13.2.2**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v11.1.6
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.12.1
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v11.7.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v12.0.6
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.4.1
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v11.0.2
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v11.1.4
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v11.0.2
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v11.0.0
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v11.1.5
11. finance-portal-ui - https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3
12. finance-portal-backend-service - https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2
13. settlement-management - https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0
14. operator-settlement - https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0
15. event-sidecar - https://github.com/mojaloop/event-sidecar/releases/tag/v11.0.1
16. event-stream-processor - https://github.com/mojaloop/event-stream-processor/releases/v11.0.0-snapshot
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v11.1.2
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v11.4.3
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v11.17.1
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v13.2.2
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.2.2

## 6. Operational Chart versions

1. EFK: **v12.0.0**
2. Promfana: **v11.0.0**

## 7. Breaking changes

N/A

## 8. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.1)' Golden Path collections expects:
	-  the Quoting service operating mode to be set [quoting-service.config.simple_routing_mode_enabled](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L4664)=true. If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter [SIMPLE_ROUTING_MODE_ENABLED](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L7420) to match.
	- the [on-us transfers](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L321) configuration to be disabled. The test-case environment variable parameter ([ON_US_TRANSFERS_ENABLED](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L7423), the same name used on postman collections) must similarly match this value.

3. Simulators 
	- [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used). 
	- Ensure that correct Postman Scripts are used if you wish to test against the Mojaloop-Simulators:
    	- Setup Mojaloop Hub: [MojaloopHub_Setup](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopHub_Setup.postman_collection.json)
    	- Setup Mojaloop Simulators for testing : [MojaloopSims_Onboarding](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopSims_Onboarding.postman_collection.json)
    	- Golden path tests: [Golden_Path_Mojaloop](https://github.com/mojaloop/postman/blob/v12.0.0/Golden_Path_Mojaloop.postman_collection.json)
	- Legacy Simulators are still required and deployed by default; disabling this will cause issues since there is Account Lookup directory mocking functionality in this service.

3. This release has been tested against the following:
	- Kubernetes: v1.20.6
	- Nginx Ingress Controllers: 0.43.0
	- Testing Toolkit Test Cases: [v13.0.1](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.1)

## 9. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2358 - Firstname, Middlename and Lastname regex not supporting myanmar script unicode strings #2358](https://github.com/mojaloop/project/issues/2358)
4. [#2352 - Mojaloop Helm support for Kubernetes 1.22](https://github.com/mojaloop/project/issues/2352)
5. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)

## 10. Contributors

- Contributing organizations: BMGF, ModusBox 
- ModusBox: @elnyry-sam-k, @mdebarros, @vgenev, @vijayg10, @shashi165, @kleyow, @bushjames

_Note: companies in alphabetical order_
