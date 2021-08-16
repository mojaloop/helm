## Helm release notes
1. GitHub issue: https://github.com/mojaloop/project/issues/2382
2. For breaking changes, please review the section `#7` "Breaking Changes" below.
3. Revisions:

Date | Revision | Description
---------|----------|---------
 2021-08-11  | 0 | Initial release - https://github.com/mojaloop/helm/pull/446

### 1. Maintenance updates

1. Patch bump to Mojaloop Helm Charts
2. Bump to Quoting-Service Helm Chart
   * Updated Quoting-Service from 12.0.6 to 12.0.7
3. Bump to Account-Lookup-Service Helm Charts
   * Updated Account-Lookup-Service from 11.7.0 to 11.7.3

### 2. New Features

N/A.

### 3. Bug Fixes

1. **#2358:** firstname, middlename and lastname regex not supporting myanmar script unicode strings ([account-lookup-service/pull#423](https://github.com/mojaloop/account-lookup-service/pull/423), [quoting-service/pull#278](https://github.com/mojaloop/quoting-service/pull/278)) closes [issue/#2358](https://github.com/mojaloop/project/issues/2358))
2. **#2373:** Mojaloop Oracle Simulator is not correctly filtering results when SubId request param is provided ([simulator/pull#230](https://github.com/mojaloop/simulator/pull/230) closes [mojaloop/#2373](https://github.com/mojaloop/project/issues/2373))
3. **#2374:** ALS is sending out multiple requests to participants for both Oracle records that match non-subId and subId result set ([account-lookup-service/pull#424](https://github.com/mojaloop/account-lookup-service/pull/424) closes [mojaloop/#2374](https://github.com/mojaloop/project/issues/2374))

## 4. Application versions

1. ml-api-adapter: **v11.1.6**
2. central-ledger:  **v13.12.1**
3. account-lookup-service: v11.7.0 -> **v11.7.3**
4. quoting-service: v12.0.6 -> **12.0.7**
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
17. simulator: **v11.1.3**
18. mojaloop-simulator: **v11.4.3**
19. sdk-scheme-adapter: **v11.17.1**
20. ml-testing-toolkit: v12.4.2 -> **v13.2.2**
21. ml-testing-toolkit-ui: v12.2.3 -> **v13.2.2**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v11.1.6
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.12.1
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v11.7.3
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v12.0.7
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
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v11.1.3
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

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.0)' Golden Path collections expects:
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

## 10. Contributors

- Contributing organizations: BMGF, ModusBox 
- ModusBox: @elnyry-sam-k, @mdebarros, @vijayg10

_Note: companies in alphabetical order_
