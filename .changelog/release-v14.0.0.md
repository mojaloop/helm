## Helm release notes
1. For breaking changes, please review the section `#4` "Breaking Changes" below.

## 1. New Features

1. Change the basis for the liquidity check ([mojaloop/design-authority-project/issues/90](https://github.com/mojaloop/design-authority-project/issues/90)). Pull requests are [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899) & [mojaloop/central-ledger/pull/901](https://github.com/mojaloop/central-ledger/pull/901)
2. **mojaloop/#2092:** upgrade nodeJS version for core services ([ml-api-adapter/#501](https://github.com/mojaloop/ml-api-adapter/pull/501)) ([central-ledger/#902](https://github.com/mojaloop/central-ledger/issues/902)) ([account-lookup/#445](https://github.com/mojaloop/account-lookup-service/pull/445)) ([quoting-service/#302](https://github.com/mojaloop/quoting-service/pull/302)) ([sdk-standard-components/#168](https://github.com/mojaloop/sdk-standard-components/pull/168) [auth-svc/#116](https://github.com/mojaloop/auth-service/issues/116) [als-consent/#13](https://github.com/mojaloop/als-consent-oracle/issues/13) [thirdparty-api-svc/#82](https://github.com/mojaloop/thirdparty-api-svc/issues/82) [thirdparty-sdk/#142](https://github.com/mojaloop/thirdparty-sdk/issues/142)), closes [mojaloop/#2092](https://github.com/mojaloop/project/issues/2092)
3. **mojaloop/#2092:** upgrade nodeJS version for core services ([#168](https://github.com/mojaloop/sdk-standard-components/issues/168)) ([e0191bf](https://github.com/mojaloop/sdk-standard-components/commit/e0191bfa9942ccb3acb4335b41d65c2c903b770f)), closes [mojaloop/#2092](https://github.com/mojaloop/project/issues/2092)
4. **sdk-scheme-adapter:** add extensionList to quote request/response ([#269](https://github.com/mojaloop/sdk-scheme-adapter/issues/269)) ([9cbed66](https://github.com/mojaloop/sdk-scheme-adapter/commit/9cbed66f0db4190f2f34cd7ba3d531a8bbb95d79))
5. **sdk-scheme-adapter:** proper response schema for post /authorization sync response ([#270](https://github.com/mojaloop/sdk-scheme-adapter/issues/270)) ([6535c1d](https://github.com/mojaloop/sdk-scheme-adapter/commit/6535c1de145ff58db48bc5be61dae9b0133786d8))
6. **mojaloop/#2264:** add more robust header validation for inbound server ([#278](https://github.com/mojaloop/sdk-scheme-adapter/issues/278)) ([9ea24d7](https://github.com/mojaloop/sdk-scheme-adapter/commit/9ea24d748ccd58fdfb30c77e98b021aa6a607b4f)), closes [#2264](https://github.com/mojaloop/sdk-scheme-adapter/issues/2264)
7. **sdk-scheme-adapter:** port control client and service from ml connector ([#308](https://github.com/mojaloop/sdk-scheme-adapter/issues/308)) ([e6c963c](https://github.com/mojaloop/sdk-scheme-adapter/commit/e6c963c5e5faa17f6a39e0b70f34c3e3717ba090))
8. **sdk-scheme-adapter:** port use payee FSPID as GET /parties destination header if provided ([#301](https://github.com/mojaloop/sdk-scheme-adapter/issues/301)) ([3ad0ba5](https://github.com/mojaloop/sdk-scheme-adapter/commit/3ad0ba5f745b459ff6d9484c83ac3f384faf34b2))
9. **sdk-scheme-adapter:** port over prom client metrics ([#312](https://github.com/mojaloop/sdk-scheme-adapter/issues/312)) ([8de66d5](https://github.com/mojaloop/sdk-scheme-adapter/commit/8de66d505b94cddb5e3b8e857ae491f85058d395))
10. **sdk-scheme-adapter:** pull in live reconfiguration logic ([#313](https://github.com/mojaloop/sdk-scheme-adapter/issues/313)) ([ae5648a](https://github.com/mojaloop/sdk-scheme-adapter/commit/ae5648a500eaab80804db0298facc1e352482fb9))
11. **sdk-scheme-adapter:** added outbound bulk api ([#320](https://github.com/mojaloop/sdk-scheme-adapter/issues/320)) ([e2e83e9](https://github.com/mojaloop/sdk-scheme-adapter/commit/e2e83e99048a755b49123e91faa3acc03dded029))
12. **mbp/#286:** add simulator rule to trigger patch transferState=aborted notification ([#138](https://github.com/mojaloop/mojaloop-simulator/issues/138)) ([d4a407a](https://github.com/mojaloop/mojaloop-simulator/commit/d4a407aad73c4eef353fddf324db212d97f3b3f6)), closes [mbp/#286](https://github.com/mbp/mojaloop-simulator/issues/286)
13. **mojaloop-simulator:** update simulator schema for latest thirdparty api ([#128](https://github.com/mojaloop/mojaloop-simulator/issues/128)) ([1a89bdf](https://github.com/mojaloop/mojaloop-simulator/commit/1a89bdfc6a1103c468f3bd7cfb3502627e71f983))
14. **auth-service:** handle errors akin to core ml services and update verification response ([#99](https://github.com/mojaloop/auth-service/issues/99))
15. **auth-service:** update for Thirdparty-api specification v1.0 ([#106](https://github.com/mojaloop/auth-service/issues/106))
16. **thirdparty-api-svc:** update for Thirdparty-api specification v1.0 ([#65](https://github.com/mojaloop/thirdparty-api-svc/issues/65))
17. **thirdparty-sdk:** update for Thirdparty-api specification v1.0 ([#135](https://github.com/mojaloop/thirdparty-sdk/issues/135))
18. **thirdparty-sdk:** add ws client to pull updated configuration from [Payment Manager for Mojaloop](https://github.com/pm4ml) ([#147](https://github.com/mojaloop/thirdparty-sdk/issues/147))

## 2. Bug Fixes

1. **mojaloop/#2719:** post quotes fails when transactionId does not equal transactionRequestId ([central-ledger/#887](https://github.com/mojaloop/central-ledger/issues/887)) ([central-ledger/b9944d1](https://github.com/mojaloop/central-ledger/commit/b9944d15c9486ffd62b968797fb79847a512a6c8)), closes [mojaloop/#2719](https://github.com/mojaloop/project/issues/2719)
2. **mojaloop/#2704:** core-services support for non-breaking backward api compatibility ([#884](https://github.com/mojaloop/central-ledger/issues/884)) ([02cf7c2](https://github.com/mojaloop/central-ledger/commit/02cf7c25b4071bb44f62271d7e9bdbc8674a1ee7)), closes [mojaloop/#2704](https://github.com/mojaloop/project/issues/2704)
3. **mojaloop/#2522:** cl-migration scripts should configure quoting tables to utf8 follow-up ([#865](https://github.com/mojaloop/central-ledger/issues/865)) ([dcc57b8](https://github.com/mojaloop/central-ledger/commit/dcc57b8f22bc66fa4e6ae35ce04cf095fce780c6)), closes [mojaloop/#2522](https://github.com/mojaloop/project/issues/2522)
4. **mojaloop/#2480:** central-ledger migration scripts to configure quote party table utf8 support ([#862](https://github.com/mojaloop/central-ledger/issues/862)) ([bf4da0e](https://github.com/mojaloop/central-ledger/commit/bf4da0e7645edf2e701b36b9f78c32c8783136b8)), closes [mojaloop/#2480](https://github.com/mojaloop/project/issues/2480)
5. correct transfers response structure as per API def ([#271](https://github.com/mojaloop/sdk-scheme-adapter/issues/271)) ([b143281](https://github.com/mojaloop/sdk-scheme-adapter/commit/b143281f6252bf5d228c94223959c6d7805a9efb))
6. **mojaloop/#2433:** sdk-scheme-adapter-v11.18.5-release-failing-on-startup ([39cc8e2](https://github.com/mojaloop/sdk-scheme-adapter/commit/39cc8e2df09676798e0e6062d13f3de903544adf)), closes [mojaloop/#2433](https://github.com/mojaloop/sdk-scheme-adapter/issues/2433)
7. **mojaloop/#2436:** sdk-scheme-adapter inbound-API responds incorrectly for 'Unknown uri' error scenario ([132f941](https://github.com/mojaloop/sdk-scheme-adapter/commit/132f941a365bfa60b456d21b4a5d301fb3af9695)), closes [mojaloop/#2436](https://github.com/mojaloop/sdk-scheme-adapter/issues/2436)
8. **mojaloop/#2478:** sdk-scheme-adapter does not publish ws notifications when cache is restarted ([0a301c5](https://github.com/mojaloop/sdk-scheme-adapter/commit/0a301c59f3a17adc3e32d1965353b776c568ecae)), closes [mojaloop/#2478](https://github.com/mojaloop/
9. **sdk-scheme-adapter:** add config option for mismatch id's ([#291](https://github.com/mojaloop/sdk-scheme-adapter/issues/291)) ([8e9717a](https://github.com/mojaloop/sdk-scheme-adapter/commit/8e9717a02c6d19f93b78f5b293917050be0ade84))
sdk-scheme-adapter/issues/2478)
10. **sdk-scheme-adapter:** remove outdated koa2-oauth-server and bump to node 16 ([#302](https://github.com/mojaloop/sdk-scheme-adapter/issues/302)) ([9c1ae18](https://github.com/mojaloop/sdk-scheme-adapter/commit/9c1ae18375f033fe59c219fa7cc970bd4d0c72f2))
11. **sdk-scheme-adapter:** make management url config option optional ([#310](https://github.com/mojaloop/sdk-scheme-adapter/issues/310)) ([93c4048](https://github.com/mojaloop/sdk-scheme-adapter/commit/93c4048d5a604be81ce90365ff3f9cd42b531fef))
12. **sdk-scheme-adapter:** update package.json with main and type correct path ([#315](https://github.com/mojaloop/sdk-scheme-adapter/issues/315)) ([6d0f9b5](https://github.com/mojaloop/sdk-scheme-adapter/commit/6d0f9b541f79fa50cb6c89a3ac47cf97155f60ae))
13. **sdk-scheme-adapter:** update outbound interface and response oa3 defs ([#316](https://github.com/mojaloop/sdk-scheme-adapter/issues/316)) ([50d23d8](https://github.com/mojaloop/sdk-scheme-adapter/commit/50d23d8562afdeeeef2203d6196473c7b0e484a5))
14. **sdk-scheme-adapter:** correct party outbound response ([#317](https://github.com/mojaloop/sdk-scheme-adapter/issues/317)) ([752e8b4](https://github.com/mojaloop/sdk-scheme-adapter/commit/752e8b4d315a6e9c3b8ad4ff1b65761c41e3d721))
15. **sdk-scheme-adapter:** reformat error information response ([#318](https://github.com/mojaloop/sdk-scheme-adapter/issues/318)) ([ed844b1](https://github.com/mojaloop/sdk-scheme-adapter/commit/ed844b1d2da6c58d3c61622c07c326bda3ca3b86))
16. **mojaloop/#2574:** sdk-scheme-adapter is not returning party sub-id ([#120](https://github.com/mojaloop/mojaloop-simulator/issues/120)) ([b0e9504](https://github.com/mojaloop/mojaloop-simulator/commit/b0e950468ceeb129dc62f7ad8fdb84c86bf12749)), closes [mojaloop/#2574](https://github.com/mojaloop/mojaloop-simulator/issues/2574) [mojaloop/#2574](https://github.com/mojaloop/mojaloop-simulator/issues/2574) [mojaloop/#2575](https://github.com/mojaloop/mojaloop-simulator/issues/2575)

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
18. mojaloop-simulator: v11.6.1 -> **v12.1.1**
19. sdk-scheme-adapter: v11.18.11 -> **v15.0.0**
20. ml-testing-toolkit: **v14.0.4**
21. ml-testing-toolkit-ui: **v13.5.5**
22. auth-service: v11.11.1 -> **v13.0.2**
23. als-consent-service: v0.0.8 -> **v0.2.0**
24. thirdparty-api-svc: v11.21.0 -> **v13.0.2**
25. thirdparty-sdk: v11.55.1 -> **v15.1.0**

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
18. mojaloop-simulator - https://github.com/mojaloop/mojaloop-simulator/releases/tag/v12.1.1
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v15.0.0
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v14.0.4
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v13.5.5
22. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v11.11.1
23. als-consent-service - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.0.8
24. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v11.21.0
25. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v11.55.1

## 5. Breaking changes

1. **Central Ledger:** Transfer will be successful only if the payer has sufficient liquidity in their settlement account balance over and above their NET-DEBIT-CAP (NDC) limit. This is the additional check that has been added in this PR, and will be applied to the lower value. Error messages have changed as a result. For NDC limit check from `PAYER_FSP_INSUFFICIENT_LIQUIDITY` to `PAYER_LIMIT_ERROR`. The error message `PAYER_FSP_INSUFFICIENT_LIQUIDITY` occurs when the payer has an insufficient settlement account balance. [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899)

2. **mojaloop/#2092:** Major version bump for node v16 LTS support, re-structuring of project directories to align to core Mojaloop repositories with docker image now using `/opt/app` instead of `/opt/central-ledger`, `opt/account-lookup-service`, `opt/ml-api-adapter`, `/opt/quoting-service` which will impact config mounts.

3. **Mongodb dependency charts:** have been upgraded due to Bitnami's [retention policy](https://github.com/bitnami/charts/issues/10539). This impacts the following components: `central-event-processor`, `ml-testing-toolkit` (only when enabled), `bulk-api-adapter`.

4. **Thirdparty-api specification v1.0:** changes introduced in this release are breaking and will impact the following components:
   - auth-svc
   - als-consent-service
   - thirdparty-api-svc
   - thirdparty-sdk

5. **Thirdparty-sdk:** support for configuration management via [Payment Manager for Mojaloop](https://github.com/pm4ml).

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
