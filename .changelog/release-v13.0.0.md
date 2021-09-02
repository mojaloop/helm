## Helm release notes
1. GitHub issue: https://github.com/mojaloop/project/issues/2151
2. For breaking changes, please review the section `#7` "Breaking Changes" below.
3. Revisions:

Date | Revision | Description
---------|----------|---------
 2021-06-29  | 0 | Initial release - https://github.com/mojaloop/helm/pull/436 https://github.com/mojaloop/helm/pull/440
 2021-07-02 | 1 | Maintenance fixes - https://github.com/mojaloop/helm/pull/441
 2021-07-12 | 1 | Updated release notes with two additional known issues - [#2325](https://github.com/mojaloop/project/issues/2325) [#2342](https://github.com/mojaloop/project/issues/2342)

### 1. Maintenance updates

1. fix(release): v13.0.0-release.1:
    - Upgraded event-stream-processor from v9.5.0 to v11.0.0

### 2. New Features

1. Default SettlementModel feature is now supported (https://github.com/mojaloop/project/issues/2123)
2. The following are the improvements for TTK apart from bug-fixes:

New Features
    - mTLS support for websocket and outbound requests
(https://github.com/mojaloop/project/issues/2098)
    - Configurable timeouts during test case execution (https://github.com/mojaloop/project/issues/2023)
    - Javascript compatibility to inbound scripting (https://github.com/mojaloop/project/issues/2138)
    - Ability to wait for an inbound request from the outbound scripts (https://github.com/mojaloop/project/issues/2086)
    - History endpoints for getting requests and callbacks history (https://github.com/mojaloop/project/issues/2262)
    - Github test collection browser in “Test Runner” (https://github.com/mojaloop/project/issues/2186)

Feature enhancements:
     - Improved inbound script logging
     - Enable http and https keep alive (https://github.com/mojaloop/project/issues/2139)
     - Added logs to monitoring page when the requests are going from scripts (https://github.com/mojaloop/project/issues/1797)
     - Improved Collection Manager and Environment Manager components in "Test Runner" page

### 3. Bug Fixes

1. TTK Tests is using hard-coded USD currency [#2066](https://github.com/mojaloop/project/issues/2066)
2. GET /parties/Type/ID/SubID does not return partySubIdOrType in the body [#2102](https://github.com/mojaloop/project/issues/2102)
3. ElasticSearch ran out of disk space [#2135](https://github.com/mojaloop/project/issues/2135)
4. quoting service does not handle the partySubIdOrType in party [#2103](https://github.com/mojaloop/project/issues/2103)
5. Helm v12.1.0 pre-release Fix: Regex Validations against swagger interface spec no longer working [#2182](https://github.com/mojaloop/project/issues/2182)
6. Central Shared Services - Header validation does not take into account valid structure [#2246](https://github.com/mojaloop/project/issues/2246)
7. SDK Scheme Adapter is not accepting PUT /parties with 1.1 content-type header [#1891](https://github.com/mojaloop/project/issues/1891)
8. mojaloop-simulator helm chart template is not handling booleans logical comparisons correctly against VALIDATE_INBOUND_JWS value config [#2083](https://github.com/mojaloop/project/issues/2083)
9. mojaloop/helm - HUB_PARTICIPANT.NAME in default.json is not consistent across services [#2243](https://github.com/mojaloop/project/issues/2243)
10. Security Vulnerability : CVE-2019-19919 - Prototype Pollution [#2171](https://github.com/mojaloop/project/issues/2171)
11. InterchangeFee calculation example fails with parties with missing extensionList [#2149](https://github.com/mojaloop/project/issues/2149)
12. Central-settlements calculating amounts incorrectly for every settlementModel that matches the ledgerAccountTypeId [#2304](https://github.com/mojaloop/project/issues/2304)
13. Disabled keep-alive in TTK backend config to improve stability when executing test-case: [#2313](https://github.com/mojaloop/project/issues/2313)

## 4. Application versions

1. ml-api-adapter: v11.1.5 -> **v11.1.6**
2. central-ledger: v13.2.6 -> **v13.12.1**
3. account-lookup-service: v11.3.2 -> **v11.5.3**
4. quoting-service: v12.0.0 -> **v12.0.6**
5. central-settlement: v13.0.0 -> **13.2.0**
6. central-event-processor: v11.0.1 -> **v11.0.2**
7. bulk-api-adapter: v11.1.2 -> **v11.1.4**
8. email-notifier: v11.0.0 -> **v11.0.2**
9. als-oracle-pathfinder: **v11.0.0** (no change)
10. transaction-requests-service: v11.1.4 -> **v11.1.5**
11. finance-portal-ui: **v10.4.3** (no change)
12. finance-portal-backend-service: v10.5.1 -> **v15.0.2**
13. settlement-management: **v11.0.0** (no change)
14. operator-settlement: **v11.0.0** (no change)
15. event-sidecar: v11.0.0 -> **v11.0.1**
16. event-stream-processor: v9.5.0-snapshot -> **v11.0.0-snapshot**
17. simulator: v11.1.0 -> **v11.1.2**
18. mojaloop-simulator: v11.4.2 -> **v11.4.3**
19. sdk-scheme-adapter: v11.16.2 -> **v11.17.1**
20. ml-testing-toolkit: v12.0.2 -> **v12.4.2**
21. ml-testing-toolkit-ui: v12.0.2 -> **v12.2.3**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v11.1.6
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.12.1
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v11.5.3
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v12.0.6
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.2.0
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
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v12.4.2
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v12.2.3
 
## 6. Operational Chart versions

1. EFK: **v12.0.0** (no change)
2. Promfana: **v11.0.0** (no change)

## 7. Breaking changes

- Deployment SelectorLabels for Mojaloop-Simulator have been aligned to be best-practices to fix upgrade issues going forward: https://github.com/mojaloop/project/issues/2302.
- Default Mojaloop (mojaloop/values.yaml) Ingress config for the Mojaloop Simulator has been changed to support Nginx Ingress Controller v0.22.0+. If you are using an older version, please comment the correct ingress config:
```
Mojaloop-simulators:
  ingress:
    # If you're using nginx ingress controller >= v0.22.0 set this to (/|$)(.*). Ensure that you set the `"nginx.ingress.kubernetes.io/rewrite-target": "/$2"`
    # If you're using nginx ingress controller < v0.22.0 set this to an empty string or "/". Ensure that you set the `"nginx.ingress.kubernetes.io/rewrite-target": "/"`
    # This affects the way your rewrite target will work.
    # For more information see "Breaking changes" here:
    # https://github.com/kubernetes/ingress-nginx/blob/master/Changelog.md#0220

    ## https://kubernetes.github.io/ingress-nginx/examples/rewrite/
    # nginx.ingress.kubernetes.io/rewrite-target: '/'
    # nginx.ingress.kubernetes.io/rewrite-target: '/$2'

    ## nginx ingress controller >= v0.22.0
    annotations:
      nginx.ingress.kubernetes.io/rewrite-target: '/$2'
    ingressPathRewriteRegex: (/|$)(.*)

    ## nginx ingress controller < v0.22.0
    # annotations:
    #   nginx.ingress.kubernetes.io/rewrite-target: '/'
    #   ingressPathRewriteRegex: "/"
```

### 8. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. Simulators 
	- [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used). 
	- Ensure that correct Postman Scripts are used if you wish to test against the Mojaloop-Simulators:
        	- Setup Mojaloop Hub: [MojaloopHub_Setup](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopHub_Setup.postman_collection.json)
        	- Setup Mojaloop Simulators for testing : [MojaloopSims_Onboarding](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopSims_Onboarding.postman_collection.json)
        	- Golden path tests: [Golden_Path_Mojaloop](https://github.com/mojaloop/postman/blob/v12.0.0/Golden_Path_Mojaloop.postman_collection.json)
	- Legacy Simulators are still required and deployed by default; disabling this will cause issues since there is Account Lookup directory mocking functionality in this service.

3. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.0)' Golden Path collections expects:
	-  the Quoting service operating mode to be set [quoting-service.config.simple_routing_mode_enabled](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L4664)=true. If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter [SIMPLE_ROUTING_MODE_ENABLED](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L7420) to match.
	- the [on-us transfers](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L321) configuration to be disabled. The test-case environment variable parameter ([ON_US_TRANSFERS_ENABLED](https://github.com/mojaloop/helm/blob/v13.0.0/mojaloop/values.yaml#L7423), same name used on postman collections) must similarly match this value.

4. This release has been tested against the following:
	- Kubernetes: 1.11.6; v1.20.6
	- Nginx Ingress Controllers: 0.16.2; 0.43.0
	- Testing Toolkit Test Cases: [v13.0.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.0)

## 9. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. Tests coverage not provided for scenarios when Deferred Multilateral Net Settlement (DMLNS) and Continuous Gross Settlement (CGS) models are used on the same Switch.
4. [#2325 - Default CGS model settles also Deferred Net transfers](https://github.com/mojaloop/project/issues/2325)
5. [#2342 - ALS Admin Service DELETE API not working as expected](https://github.com/mojaloop/project/issues/2342)
6. [#2352 - Mojaloop Helm support for Kubernetes 1.22](https://github.com/mojaloop/project/issues/2352)
7. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)

## 10. Contributors

- Contributing organizations: BMGF, CrossLake, ModusBox , Sybrin
- Crosslake: @lewisdaly
- ModusBox: @elnyry-sam-k, @mdebarros, @vgenev, @vijayg10, @shashi165, @kleyow, @partiallyordered
- Sybrin: @JohannWNel
_Note: companies in alphabetical order_
