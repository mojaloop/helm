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

1. **mojaloop/#2505:** als-subid-error-callback-endpoint-not-implemented ([account-lookup-service/issues/#429](https://github.com/mojaloop/account-lookup-service/issues/429)), closes [mojaloop/#2505](https://github.com/mojaloop/account-lookup-service/issues/2505) [mojaloop/#2505](https://github.com/mojaloop/account-lookup-service/issues/2505)
2. **mojaloop/#2450:** feat(thirdparty): add tp-api-svc and round out thirdparty sub-chart ([helm/pull/#454](https://github.com/mojaloop/helm/pull/454), closes [mojaloop/#2450](https://github.com/mojaloop/project/issues/2450))
3. **mojaloop/#2532:** feat(thirdparty): add thirdparty support to mojaloop-simulator chart ([helm/pull/#456](https://github.com/mojaloop/helm/pull/456), closes [mojaloop/#2532](https://github.com/mojaloop/project/issues/2532))

### 3. Bug Fixes

1. **mojaloop/2522:** cl-migration scripts should configure quoting tables to utf8 follow-up ([central-ledger/issues/#865](https://github.com/mojaloop/central-ledger/issues/865)), closes [mojaloop/#2522](https://github.com/mojaloop/central-ledger/issues/2522)
2. **mojaloop/2525:** transfers are not being assigned to a settlementWindow on transfers version=1.1 ([central-ledger/issues/#866](https://github.com/mojaloop/central-ledger/issues/866)), closes [mojaloop/#2525](https://github.com/mojaloop/project/issues/2525)
3. **mojaloop/2527:** transfers PUT callback on version=1.1 is not assigning destination headers correctly ([ml-api-adapter/issues/#866](https://github.com/mojaloop/ml-api-adapter/issues/486)), closes [mojaloop/#2527](https://github.com/mojaloop/project/issues/2527)
4. als-oracle-pathfinder fix: init and startup issues #61 ([als-oracle-pathfinder/pull/#61](https://github.com/mojaloop/als-oracle-pathfinder/pull/61))
5. Testing Toolkit:
   1. TBD

## 4. Application versions

1. ml-api-adapter: v11.1.6 -> **v11.2.0**
2. central-ledger: v13.14.0 -> **v13.14.3**
3. account-lookup-service: v11.7.7 -> **v11.8.0**
4. quoting-service: **12.0.10**
5. central-settlement: **13.4.1**
6. central-event-processor: **v11.0.2**
7. bulk-api-adapter: **v11.1.4**
8. email-notifier: **v11.0.2**
9. als-oracle-pathfinder: v11.0.0 -> **v11.0.4**
10. transaction-requests-service: **v11.1.7**
11. finance-portal-ui: **v10.4.3**
12. finance-portal-backend-service: **v15.0.2**
13. settlement-management: **v11.0.0**
14. operator-settlement: **v11.0.0**
15. event-sidecar: **v11.0.1**
16. event-stream-processor: **v11.0.0-snapshot**
17. simulator: **v11.1.3**
18. mojaloop-simulator: **v11.6.1**
19. sdk-scheme-adapter: **v11.18.8**
20. ml-testing-toolkit: v13.5.1 -> **v13.?**
21. ml-testing-toolkit-ui: v13.5.2 -> **v13.?**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v11.2.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.14.3
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v11.8.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v12.0.10
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.4.1
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v11.0.2
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v11.1.4
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v11.0.2
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v11.0.4
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v11.1.7
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
21. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v13.?
22. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.?

## 6. Operational Chart versions

1. EFK: **v12.0.0**
2. Promfana: **v11.0.0**

## 7. Breaking changes

N/A

## 8. Upgrade notes

1. This release is fully compatible with prior v13.0.x releases, for Golden Path tests to fully pass you must ensure that your Central-Ledger Database has been correctly configured to support a UTF8 character-sets. Refer to the [mojaloop/#2471](https://github.com/mojaloop/project/issues/2471#issuecomment-917089800) & [mojaloop/#2522](https://github.com/mojaloop/central-ledger/issues/2522) for more information. This is due to the Golden-Path Tests enhancements to cater for updated regex for Accented & other Unicode Characters ((mojaloop/1452)[https://github.com/mojaloop/project/issues/1452]). The [Central-ledger v13.14.0](https://github.com/mojaloop/central-ledger/releases/tag/v13.14.0) migration scripts will modify the Quote Party table to the utf8 character set ([mojaloop/#2480](https://github.com/mojaloop/project/issues/2480)). If you disable the migration scripts, ensure that you make this configuration change manually prior to upgrade.

		WARNING:
			1. The Migration script 500601_party-2480.js will convert the `party` table's character-set to utf8mb4 with utf8mb4_unicode_ci collation. This cannot be undone automatically (i.e. through a rollback), but can be done manually if required.
			2. Migration script 501002_quoteExtension-2522.js is converting `quoteExtension` 'value' column to use the following character set utf8mb4 with utf8mb4_unicode_ci collation. This cannot be undone automatically (i.e. through a rollback), but can be done manually if required.
			3. Migration script 940101_quotePartyIdInfoExtension-2522.js is converting `quotePartyIdInfoExtension` table to use the following character set utf8mb4 with utf8mb4_unicode_ci collation. This cannot be undone automatically (i.e. through a rollback), but can be done manually if required.

		The migration script will print out the current character-set and collation as per the following example:

		```bash
		❯ kubectl -n moja get po| grep centralledger-service
		moja-centralledger-service-645dfc6674-fzpfr                      1/1     Running     0          8m49s
		❯ kubectl -n moja logs moja-centralledger-service-645dfc6674-fzpfr -c run-migration

		> @mojaloop/central-ledger@13.14.0 migrate /opt/central-ledger
		> run-s migrate:latest seed:run


		> @mojaloop/central-ledger@13.14.0 migrate:latest /opt/central-ledger
		> knex $npm_package_config_knex migrate:latest

		Working directory changed to /opt/central-ledger/config
		WARNING: Migration script 500601_party-2480.js is converting PARTY table to use the following character set utf8mb4 with utf8mb4_unicode_ci collation
		WARNING: Migration script 500601_party-2480.js - take note of the current configuration if you wish to revert= [{"character_set_name":"latin1","collation_name":"latin1_swedish_ci"}]
		Batch 2 run: 1 migrations

		> @mojaloop/central-ledger@13.14.0 seed:run /opt/central-ledger
		> knex seed:run $npm_package_config_knex

		Working directory changed to /opt/central-ledger/config
		Ran 23 seed files
		```

## 9. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.3)' Golden Path collections expects:
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
	- Testing Toolkit Test Cases: [v13.0.2](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.2)

## 10. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2352 - Mojaloop Helm support for Kubernetes 1.22](https://github.com/mojaloop/project/issues/2352)
4. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)

## 11. Contributors

- Contributing organizations: BMGF, CrossLake, ModusBox
- ModusBox: @elnyry-sam-k, @mdebarros, @vijayg10, @kleyow, @lewisdaly

_Note: companies in alphabetical order_
