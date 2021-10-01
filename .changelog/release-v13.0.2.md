## Helm release notes
1. GitHub issue: https://github.com/mojaloop/project/issues/2382
2. For breaking changes, please review the section `#7` "Breaking Changes" below.
3. Revisions:

Date | Revision | Description
---------|----------|---------
 2021-09-17 | 0 | Initial release

### 1. Maintenance updates

1. Patch bump to Mojaloop Helm Charts
2. Bump to Quoting-Service Helm Chart
   * Updated Quoting-Service from 12.0.6 to 12.0.10
3. Bump to Account-Lookup-Service Helm Charts
   * Updated Account-Lookup-Service from 11.7.0 to 11.7.7
4. Included Mojaloop-Simulator helm chart changes to fix [mojaloop/2405](https://github.com/mojaloop/project/issues/2405)
5. Added missing Kafka Consumer configs for `allow.auto.create.topics` - This may have caused some handlers to fail on startup as they cannot find the specific topic depending on their startup order
6. Updated MySQL configs to use UTF8 as the default character-set to support unicode-character [mojaloop/2471](https://github.com/mojaloop/project/issues/2471)
7. Added waitForCache initContainers on the Mojaloop-Simulator's SDK-Scheme-Adapter deployment, this fixes an issue when upgrading from previous versions where the cache pod is restarted after the actual Adapter is upgraded, thereby losing connectivity to Redis - the result being that all WS subscriptions from the Test-API will be lost thereby causing GP tests to fail
8. Updated Testing-Toolkit Backend statefulset to include `checksum/config` annotation containing the checksum for configMaps to ensure that pods are restarted on config changes [mojaloop/2476](https://github.com/mojaloop/project/issues/2476)
9. Updated supported charts to include `checksum/*` annotations for configMaps and secrets - this should ensure that pods will gracefully restart if their respective config/secrets are modified

### 2. New Features

1. **#2264:** add more robust header validation for inbound server ([sdk-scheme-adapter/pull/278](https://github.com/mojaloop/sdk-scheme-adapter/pull/278) closes [mojaloop/2264](https://github.com/mojaloop/project/issues/2264))
2. feat: added ilp packet to transfer object ([sdk-scheme-adapter/pull/280](https://github.com/mojaloop/sdk-scheme-adapter/pull/280))
3. Central-ledger migration scripts should configure the Quote Party table to utf8 character set ([central-ledger/pull/862](https://github.com/mojaloop/central-ledger/pull/862) closes [mojaloop/2480](https://github.com/mojaloop/project/issues/2480))
4. Testing Toolkit:
   1. Added a demo friendly test runner in TTK ([ml-testing-toolkit-ui/pull/115](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/115))
   2. TTK hosted mode: Optional JWS & mTLS ([ml-testing-toolkit-ui/pull/116](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/116) and [ml-testing-toolkit/pull/184](https://github.com/mojaloop/ml-testing-toolkit/pull/184) closes [mojaloop/project/issues/2376](https://github.com/mojaloop/project/issues/2376))
   3. Provisioned payment manager api in TTK ([ml-testing-toolkit/pull/182](https://github.com/mojaloop/ml-testing-toolkit/pull/182))
   4. feat: improved ttk inbound scripts ([ml-testing-toolkit/pull/187](https://github.com/mojaloop/ml-testing-toolkit/pull/187))
   5. Updated Golden-Path Tests to cater for updated regex for Accented & other Unicode Characters ([testing-toolkit-test-cases/pull/49](https://github.com/mojaloop/testing-toolkit-test-cases/pull/49), [testing-toolkit-test-cases/pull/48](https://github.com/mojaloop/testing-toolkit-test-cases/pull/48) closes [mojaloop/1452](https://github.com/mojaloop/project/issues/1452))
   6. Support for parameterized FspIds in TTK's Provisioning & Golden-Path Collections ([testing-toolkit-test-cases/pull/50](https://github.com/mojaloop/testing-toolkit-test-cases/pull/50) closes [mojaloop/2477](https://github.com/mojaloop/project/issues/2477))

### 3. Bug Fixes

1. Several bug-fixes to SDK-Scheme-Adapter for TLS configs, and Extension-lists ([sdk-scheme-adapter/pull/279](https://github.com/mojaloop/sdk-scheme-adapter/pull/279))
2. **#2358:** firstname, middlename and lastname regex not supporting myanmar script unicode strings ([ml-testing-toolkit/pull/186](https://github.com/mojaloop/ml-testing-toolkit/pull/186), [sdk-scheme-adapter/pull/281](https://github.com/mojaloop/sdk-scheme-adapter/pull/281), [account-lookup-service/pull/423](https://github.com/mojaloop/account-lookup-service/pull/423), [account-lookup-service/pull/425](https://github.com/mojaloop/account-lookup-service/pull/425), [quoting-service/pull/278](https://github.com/mojaloop/quoting-service/pull/278), [transaction-requests-service/pull/77](https://github.com/mojaloop/transaction-requests-service/pull/77) closes [mojaloop/2358](https://github.com/mojaloop/project/issues/2358))
3. **#2373:** Mojaloop Oracle Simulator is not correctly filtering results when SubId request param is provided ([simulator/pull/230](https://github.com/mojaloop/simulator/pull/230) closes [mojaloop/2373](https://github.com/mojaloop/project/issues/2373))
4. **#2374:** ALS is sending out multiple requests to participants for both Oracle records that match non-subId and subId result set ([account-lookup-service/pull/424](https://github.com/mojaloop/account-lookup-service/pull/424) closes [mojaloop/#2374](https://github.com/mojaloop/project/issues/2374))
5. **2405:** Helm release v13.0.x upgrades fail after several iterations ([helm/commit/7feed6fb120e4fafa2d5cbc8cd9643736750af4b](https://github.com/mojaloop/helm/commit/7feed6fb120e4fafa2d5cbc8cd9643736750af4b) closes [mojaloop/2405](https://github.com/mojaloop/project/issues/2405))
6. **2433:** sdk-scheme-adapter v11.18.6 release failing on startup ([sdk-scheme-adapter/pull/282](https://github.com/mojaloop/sdk-scheme-adapter/pull/282) closes [mojaloop/2433](https://github.com/mojaloop/project/issues/2433))
7. **2436:** SDK-Scheme-Adapter Inbound API responds incorrectly for 'Unknown URI' Error scenario ([sdk-scheme-adapter/pull/283](https://github.com/mojaloop/sdk-scheme-adapter/pull/283) closes [mojaloop/2436](https://github.com/mojaloop/project/issues/2436))
8. **2439:** quoting-service model.validateQuoteRequest doesn't perform correct validation when simpleRoutingMode is TRUE ([quoting-service/pull/280](https://github.com/mojaloop/quoting-service/pull/280) closes [mojaloop/2439](https://github.com/mojaloop/project/issues/2439))
9. **2445:** TTKs Iteration Runner on Moja1 & Moja2 fails with "Terminated" regardless on the number of Iterations configured. ([ml-testing-toolkit/pull/184](https://github.com/mojaloop/ml-testing-toolkit/pull/184) closes [mojaloop/2445](https://github.com/mojaloop/project/issues/2445))
10. **2400:** TTK demo test runner option to "import from GitHub" causing browser crash ([ml-testing-toolkit-ui/pull/117](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/117) closes [mojaloop/2400](https://github.com/mojaloop/project/issues/2400))
11. **2470:** Central-services-shared streamingProtocol encode/decode functionality working incorrectly ([central-services-shared/pull/313](https://github.com/mojaloop/central-services-shared/pull/313), [mojaloop/account-lookup-service/pull/428](https://github.com/mojaloop/account-lookup-service/pull/428) closes [mojaloop/2470](https://github.com/mojaloop/project/issues/2470))
12. **2474:** TTK test-cases that contain Unicode characters from Github imports are incorrectly parsed ([ml-testing-toolkit-ui/pull/120](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/120), [ml-testing-toolkit-ui/commit/9d2ad7c37db761672ac8c88831305e48855f8a45](https://github.com/mojaloop/ml-testing-toolkit-ui/commit/9d2ad7c37db761672ac8c88831305e48855f8a45) closes [mojaloop/2474](https://github.com/mojaloop/project/issues/2474))
13. SDK-Scheme-Adapter does not publish WS notifications when Cache is restarted ([sdk-scheme-adapter/pull/285](https://github.com/mojaloop/sdk-scheme-adapter/pull/285) closes [mojaloop/2478](https://github.com/mojaloop/project/issues/2478))

## 4. Application versions

1. ml-api-adapter: **v11.1.6**
2. central-ledger:  13.12.1 -> **v13.14.0**
3. account-lookup-service: v11.7.0 -> **v11.7.7**
4. quoting-service: v12.0.6 -> **12.0.10**
5. central-settlement: v13.2.0 -> **13.4.1**
6. central-event-processor: **v11.0.2**
7. bulk-api-adapter: **v11.1.4**
8. email-notifier: **v11.0.2**
9. als-oracle-pathfinder: **v11.0.0**
10. transaction-requests-service: v11.1.5 -> **v11.1.7**
11. finance-portal-ui: **v10.4.3**
12. finance-portal-backend-service: **v15.0.2**
13. settlement-management: **v11.0.0**
14. operator-settlement: **v11.0.0**
15. event-sidecar: **v11.0.1**
16. event-stream-processor: **v11.0.0-snapshot**
17. simulator: **v11.1.3**
18. mojaloop-simulator: **v11.4.3**
19. sdk-scheme-adapter: v11.17.1 -> **v11.18.8**
20. ml-testing-toolkit: v13.2.2 -> **v13.5.1**
21. ml-testing-toolkit-ui: v13.2.2 -> **v13.5.2**

## 5. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v11.1.6
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v13.14.0
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v11.7.7
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v12.0.10
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v13.4.1
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v11.0.2
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v11.1.4
8. email-notifier - https://github.com/mojaloop/email-notifier/releases/tag/v11.0.2
9. als-oracle-pathfinder - https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v11.0.0
10. transaction-requests-service - https://github.com/mojaloop/transaction-requests-service/releases/tag/v11.1.7
11. finance-portal-ui - https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3
12. finance-portal-backend-service - https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2
13. settlement-management - https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0
14. operator-settlement - https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0
15. event-sidecar - https://github.com/mojaloop/event-sidecar/releases/tag/v11.0.1
16. event-stream-processor - https://github.com/mojaloop/event-stream-processor/releases/v11.0.0-snapshot
17. simulator - https://github.com/mojaloop/simulator/releases/tag/v11.1.3
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v11.4.3
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v11.18.8
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v13.5.1
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.5.2

## 6. Operational Chart versions

1. EFK: **v12.0.0**
2. Promfana: **v11.0.0**

## 7. Breaking changes

N/A

## 8. Upgrade notes

1. This release is fully compatible with prior v13.0.x releases, for Golden Path tests to fully pass you must ensure that your Central-Ledger Database has been correctly configured to support a UTF8 character-sets. Refer to the [mojaloop/2471](https://github.com/mojaloop/project/issues/2471#issuecomment-917089800) for more information. This is due to the Golden-Path Tests enhancements to cater for updated regex for Accented & other Unicode Characters ((mojaloop/1452)[https://github.com/mojaloop/project/issues/1452]). The [Central-ledger v13.14.0](https://github.com/mojaloop/central-ledger/releases/tag/v13.14.0) migration scripts will modify the Quote Party table to the utf8 character set ([mojaloop/2480](https://github.com/mojaloop/project/issues/2480)). If you disable the migration scripts, ensure that you make this configuration change manually prior to upgrade.

		WARNING: The Migration script 500601_party-2480.js will convert the PARTY table's character-set to utf8mb4 with utf8mb4_unicode_ci collation. This cannot be undone automatically (i.e. through a rollback), but can be done manually if required.

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

		However it is recommended that you check the PARTY table's character-set and collation before doing the upgrade.

2. If you have customized the TTK's configuration for `ml-testing-toolkit.extraEnvironments.hub-k8s-default-environment.json` in the `mojaloop/values.yaml`, note the following new inputValues have been added as part of [mojaloop/1452](https://github.com/mojaloop/project/issues/1452). Ensure you add these before running the Provisioning and Golden-Path collections when running [testing-toolkit-test-cases/releases/tag/v13.0.2](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.2) versions:

		```json
		"toAccentIdType": "MSISDN",
		"toAccentIdValue": "97039819999",
		"toAccentIdDOB": "2000-01-01",
		"toAccentIdFirstName": "Seán",
		"toAccentIdMiddleName": "François",
		"toAccentIdLastName": "Nuñez",
		"toAccentIdFspId": "payeefsp",
		"toBurmeseIdType": "MSISDN",
		"toBurmeseIdValue": "2224448888",
		"toBurmeseIdDOB": "1990-01-01",
		"toBurmeseIdFirstName": "ကောင်းထက်စံ",
		"toBurmeseIdMiddleName": "အောင်",
		"toBurmeseIdLastName": "ဒေါ်သန္တာထွန်",
		"toBurmeseIdFspId": "payeefsp",
		```

3. If upgrades fail due to a similar error reported by one of the Mojaloop-Simulators' SDK-Scheme-Adapter components as follows:

		```log
		Error: UPGRADE FAILED: cannot patch "moja-sim-payeefsp-scheme-adapter" with kind Deployment: The order in patch list:
		[map[name:IN_SERVER_KEY_PATH value:./secrets/inbound-key.pem] map[name:IN_SERVER_KEY_PATH value:/secrets/inbound-key.pem] map[name:OUT_CA_CERT_PATH value:/secrets/outbound-cacert.pem] map[name:OUT_CA_CERT_PATH value:./secrets/outbound-cacert.pem] map[name:OUT_CLIENT_CERT_PATH value:/secrets/outbound-cert.pem] map[name:OUT_CLIENT_CERT_PATH value:./secrets/outbound-cert.pem] map[name:OUT_CLIENT_KEY_PATH value:./secrets/outbound-key.pem] map[name:OUT_CLIENT_KEY_PATH value:/secrets/outbound-key.pem] map[name:OAUTH_CLIENT_KEY value:] map[name:OAUTH_CLIENT_SECRET value:] map[name:OAUTH_TOKEN_ENDPOINT value:]]
		doesn't match $setElementOrder list
		```

		In the above example, one can modify the `Deployment: moja-sim-payeefsp-scheme-adapter` descriptor by removing any duplicate environment variables (e.g. `IN_SERVER_KEY_PATH`, `OUT_CA_CERT_PATH`, etc), and then retrying the upgrade. This issue is related to [mojaloop/2405](https://github.com/mojaloop/project/issues/2405). This is a list of the environment variables that are most likely to be duplicated depending on your current installed configuration:

		* IN_CA_CERT_PATH
		* IN_SERVER_CERT_PATH
		* IN_SERVER_KEY_PATH
		* OUT_CA_CERT_PATH
		* OUT_CLIENT_CERT_PATH
		* OUT_CLIENT_KEY_PATH
		* JWS_SIGNING_KEY_PATH

		It was possible to have these configured by both the `mojaloop/values.yaml` and the `Helm Deployment.yaml template` itself in v13.0.1 and earlier releases - thus causing the duplicates. These are now solely configured the `mojaloop/values.yaml` as part of this release going forward.

## 9. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v13.0.2)' Golden Path collections expects:
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
