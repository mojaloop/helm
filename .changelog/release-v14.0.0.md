# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2022-07-29 | 0 | Initial release
 2022-09-01 | 1 | Updates for init-containers [mojaloop/#2909](https://github.com/mojaloop/project/issues/2909)
 2022-09-08 | 2 | Updates for [mojaloop/#2734](https://github.com/mojaloop/project/issues/2734), [mojaloop/#2880](https://github.com/mojaloop/project/issues/2880)

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 1. New Features

1. Change the basis for the liquidity check ([mojaloop/design-authority-project/issues/90](https://github.com/mojaloop/design-authority-project/issues/90)). Pull requests are [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899) & [mojaloop/central-ledger/pull/901](https://github.com/mojaloop/central-ledger/pull/901)
2. **mojaloop/#2092:** upgrade nodeJS version for core services ([ml-api-adapter/#501](https://github.com/mojaloop/ml-api-adapter/pull/501)) ([central-ledger/#902](https://github.com/mojaloop/central-ledger/issues/902)) ([account-lookup/#445](https://github.com/mojaloop/account-lookup-service/pull/445)) ([quoting-service/#302](https://github.com/mojaloop/quoting-service/pull/302)) ([sdk-scheme-adapter/pull/319](https://github.com/mojaloop/sdk-scheme-adapter/pull/319)) ([sdk-standard-components/#168](https://github.com/mojaloop/sdk-standard-components/pull/168)) ([auth-svc/#116](https://github.com/mojaloop/auth-service/issues/116)) ([als-consent/#13](https://github.com/mojaloop/als-consent-oracle/issues/13)) ([thirdparty-api-svc/#82](https://github.com/mojaloop/thirdparty-api-svc/issues/82)) ([thirdparty-sdk/#142](https://github.com/mojaloop/thirdparty-sdk/issues/142)) ([simulator/pull/243](https://github.com/mojaloop/simulator/pull/243)) ([mojaloop-simulator/pull/145](https://github.com/mojaloop/mojaloop-simulator/pull/145)) ([bulk-api-adapter/pull/82](https://github.com/mojaloop/bulk-api-adapter/pull/82)) ([transaction-requests-service/pull/90](https://github.com/mojaloop/transaction-requests-service/pull/90)) ([central-settlement/pull/381](https://github.com/mojaloop/central-settlement/pull/381)) ([event-sdk/pull/67](https://github.com/mojaloop/event-sdk/pull/67)) ([event-sidecar/pull/49](https://github.com/mojaloop/event-sidecar/pull/49)) ([als-oracle-pathfinder/pull/72](https://github.com/mojaloop/als-oracle-pathfinder/pull/72)) ([email-notifier/pull/202](https://github.com/mojaloop/email-notifier/pull/202)) ([event-stream-processor/pull/61](https://github.com/mojaloop/event-stream-processor/pull/61) ([central-event-processor/pull/243](https://github.com/mojaloop/central-event-processor/pull/243))
, closes [mojaloop/#2092](https://github.com/mojaloop/project/issues/2092)
3. **sdk-scheme-adapter:** add extensionList to quote request/response ([#269](https://github.com/mojaloop/sdk-scheme-adapter/issues/269)) ([9cbed66](https://github.com/mojaloop/sdk-scheme-adapter/commit/9cbed66f0db4190f2f34cd7ba3d531a8bbb95d79))
4. **sdk-scheme-adapter:** proper response schema for post /authorization sync response ([#270](https://github.com/mojaloop/sdk-scheme-adapter/issues/270)) ([6535c1d](https://github.com/mojaloop/sdk-scheme-adapter/commit/6535c1de145ff58db48bc5be61dae9b0133786d8))
5. **mojaloop/#2264:** add more robust header validation for inbound server ([#278](https://github.com/mojaloop/sdk-scheme-adapter/issues/278)) ([9ea24d7](https://github.com/mojaloop/sdk-scheme-adapter/commit/9ea24d748ccd58fdfb30c77e98b021aa6a607b4f)), closes [#2264](https://github.com/mojaloop/sdk-scheme-adapter/issues/2264)
6. **mojaloop/#2739:**  Reconcile mojaloop-connector with sdk-scheme adapter, closes [mojaloop/#2739](https://github.com/mojaloop/project/issues/2739)
    1. **sdk-scheme-adapter:** port control client and service from ml connector ([#308](https://github.com/mojaloop/sdk-scheme-adapter/issues/308)) ([e6c963c](https://github.com/mojaloop/sdk-scheme-adapter/commit/e6c963c5e5faa17f6a39e0b70f34c3e3717ba090))
    2. **sdk-scheme-adapter:** port use payee FSPID as GET /parties destination header if provided ([#301](https://github.com/mojaloop/sdk-scheme-adapter/issues/301)) ([3ad0ba5](https://github.com/mojaloop/sdk-scheme-adapter/commit/3ad0ba5f745b459ff6d9484c83ac3f384faf34b2))
    3. **sdk-scheme-adapter:** port over prom client metrics ([#312](https://github.com/mojaloop/sdk-scheme-adapter/issues/312)) ([8de66d5](https://github.com/mojaloop/sdk-scheme-adapter/commit/8de66d505b94cddb5e3b8e857ae491f85058d395))
    4. **sdk-scheme-adapter:** pull in live reconfiguration logic ([#313](https://github.com/mojaloop/sdk-scheme-adapter/issues/313)) ([ae5648a](https://github.com/mojaloop/sdk-scheme-adapter/commit/ae5648a500eaab80804db0298facc1e352482fb9))
7. **sdk-scheme-adapter:** added outbound bulk api ([#320](https://github.com/mojaloop/sdk-scheme-adapter/issues/320)) ([e2e83e9](https://github.com/mojaloop/sdk-scheme-adapter/commit/e2e83e99048a755b49123e91faa3acc03dded029))
8. **mbp/#286:** add simulator rule to trigger patch transferState=aborted notification ([#138](https://github.com/mojaloop/mojaloop-simulator/issues/138)) ([d4a407a](https://github.com/mojaloop/mojaloop-simulator/commit/d4a407aad73c4eef353fddf324db212d97f3b3f6)), closes [mbp/#286](https://github.com/mbp/mojaloop-simulator/issues/286)
9. **mojaloop-simulator:** update simulator schema for latest thirdparty api ([#128](https://github.com/mojaloop/mojaloop-simulator/issues/128)) ([1a89bdf](https://github.com/mojaloop/mojaloop-simulator/commit/1a89bdfc6a1103c468f3bd7cfb3502627e71f983))
10. **auth-service:** handle errors akin to core ml services and update verification response ([#99](https://github.com/mojaloop/auth-service/issues/99))
11. **auth-service:** update for Thirdparty-api specification v1.0 ([#106](https://github.com/mojaloop/auth-service/issues/106))
12. **thirdparty-api-svc:** update for Thirdparty-api specification v1.0 ([#65](https://github.com/mojaloop/thirdparty-api-svc/issues/65))
13. **thirdparty-sdk:** update for Thirdparty-api specification v1.0 ([#135](https://github.com/mojaloop/thirdparty-sdk/issues/135))
14. **mojaloop/#2758:** add Certificate management functionality in thirdparty sdk (from mojaloop connector) from [Payment Manager for Mojaloop](https://github.com/pm4ml) ([thirdparty-sdk/#146](https://github.com/mojaloop/thirdparty-sdk/issues/146) [thirdparty-sdk/#147](https://github.com/mojaloop/thirdparty-sdk/issues/147)), closes [#2758](https://github.com/mojaloop/project/issues/2758)
15. **mojaloop/#2777:** add jws validation on inbound server and update reconfig for jws signing ([thirdparty-sdk/#151](https://github.com/mojaloop/thirdparty-sdk/issues/151)), closes [mojaloop/#2777](https://github.com/mojaloop/project/issues/2777)
16. **Testing Toolkit:**:
    1. Major version bump for node v16 LTS support ([ml-testing-toolkit/pull/215](https://github.com/mojaloop/ml-testing-toolkit/pull/215)), closes [mojaloop/#2784](https://github.com/mojaloop/project/issues/2784), [mojaloop/#2785](https://github.com/mojaloop/project/issues/2785), [mojaloop/#2786](https://github.com/mojaloop/project/issues/2786)
    2. Port changed from `5000` to `4040` ([ml-testing-toolkit/pull/215](https://github.com/mojaloop/ml-testing-toolkit/pull/215)), closes [mojaloop/#2675](https://github.com/mojaloop/project/issues/2675)
    3. TTK CLI is migrated from `ml-testing-toolkit` to [ml-testing-toolkit-client-lib](https://github.com/mojaloop/ml-testing-toolkit-client-lib)
    4. Callback assignments through UI ([ml-testing-toolkit/pull/204](https://github.com/mojaloop/ml-testing-toolkit/pull/204)) ([ml-testing-toolkit-ui/pull/127](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/127)), closes [mojaloop/#1809](https://github.com/mojaloop/project/issues/1809)
    5. Checkbox to disable some requests in test case editor easily ([ml-testing-toolkit/pull/204](https://github.com/mojaloop/ml-testing-toolkit/pull/204)) ([ml-testing-toolkit-ui/pull/127](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/127)), closes [mojaloop/#2335](https://github.com/mojaloop/project/issues/2335)
    6. Option for breaking a test case on error ([ml-testing-toolkit/pull/204](https://github.com/mojaloop/ml-testing-toolkit/pull/204)) ([ml-testing-toolkit-ui/pull/127](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/127)), closes [mojaloop/#2431](https://github.com/mojaloop/project/issues/2431)
    7. Added hostname and prefix to api definition listPath and hostname feature ([ml-testing-toolkit/pull/211](https://github.com/mojaloop/ml-testing-toolkit/pull/211)) ([ml-testing-toolkit-ui/pull/138](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/138)), closes [mojaloop/#2792](https://github.com/mojaloop/project/issues/2792). Refer this documentation [ml-testing-toolkit/User-Guide-API-Provisioning.md#5-prefix-and-hostnames](https://github.com/mojaloop/ml-testing-toolkit/blob/master/documents/User-Guide-API-Provisioning.md#5-prefix-and-hostnames)

## 2. Bug Fixes

1. **mojaloop/#2719:** post quotes fails when transactionId does not equal transactionRequestId ([central-ledger/#887](https://github.com/mojaloop/central-ledger/issues/887)) ([central-ledger/b9944d1](https://github.com/mojaloop/central-ledger/commit/b9944d15c9486ffd62b968797fb79847a512a6c8)), closes [mojaloop/#2719](https://github.com/mojaloop/project/issues/2719)
2. **mojaloop/#2704:** core-services support for non-breaking backward api compatibility ([#884](https://github.com/mojaloop/central-ledger/issues/884)) ([02cf7c2](https://github.com/mojaloop/central-ledger/commit/02cf7c25b4071bb44f62271d7e9bdbc8674a1ee7)), closes [mojaloop/#2704](https://github.com/mojaloop/project/issues/2704)
3. **mojaloop/#2522:** cl-migration scripts should configure quoting tables to utf8 follow-up ([#865](https://github.com/mojaloop/central-ledger/issues/865)) ([dcc57b8](https://github.com/mojaloop/central-ledger/commit/dcc57b8f22bc66fa4e6ae35ce04cf095fce780c6)), closes [mojaloop/#2522](https://github.com/mojaloop/project/issues/2522)
4. **mojaloop/#2480:** central-ledger migration scripts to configure quote party table utf8 support ([#862](https://github.com/mojaloop/central-ledger/issues/862)) ([bf4da0e](https://github.com/mojaloop/central-ledger/commit/bf4da0e7645edf2e701b36b9f78c32c8783136b8)), closes [mojaloop/#2480](https://github.com/mojaloop/project/issues/2480)
5. correct transfers response structure as per API def ([#271](https://github.com/mojaloop/sdk-scheme-adapter/issues/271)) ([b143281](https://github.com/mojaloop/sdk-scheme-adapter/commit/b143281f6252bf5d228c94223959c6d7805a9efb))
6. **mojaloop/#2433:** sdk-scheme-adapter-v11.18.5-release-failing-on-startup ([39cc8e2](https://github.com/mojaloop/sdk-scheme-adapter/commit/39cc8e2df09676798e0e6062d13f3de903544adf)), closes [mojaloop/#2433](https://github.com/mojaloop/sdk-scheme-adapter/issues/2433)
7. **mojaloop/#2436:** sdk-scheme-adapter inbound-API responds incorrectly for 'Unknown uri' error scenario ([132f941](https://github.com/mojaloop/sdk-scheme-adapter/commit/132f941a365bfa60b456d21b4a5d301fb3af9695)), closes [mojaloop/#2436](https://github.com/mojaloop/sdk-scheme-adapter/issues/2436)
8. **mojaloop/#2478:** sdk-scheme-adapter does not publish ws notifications when cache is restarted ([0a301c5](https://github.com/mojaloop/sdk-scheme-adapter/commit/0a301c59f3a17adc3e32d1965353b776c568ecae)), closes [mojaloop/#2478](https://github.com/mojaloop/project/issues/2478)
9. **sdk-scheme-adapter:** add config option for mismatch id's ([#291](https://github.com/mojaloop/sdk-scheme-adapter/issues/291)) ([8e9717a](https://github.com/mojaloop/sdk-scheme-adapter/commit/8e9717a02c6d19f93b78f5b293917050be0ade84))
10. **sdk-scheme-adapter:** remove outdated koa2-oauth-server and bump to node 16 ([#302](https://github.com/mojaloop/sdk-scheme-adapter/issues/302)) ([9c1ae18](https://github.com/mojaloop/sdk-scheme-adapter/commit/9c1ae18375f033fe59c219fa7cc970bd4d0c72f2))
11. **sdk-scheme-adapter:** make management url config option optional ([#310](https://github.com/mojaloop/sdk-scheme-adapter/issues/310)) ([93c4048](https://github.com/mojaloop/sdk-scheme-adapter/commit/93c4048d5a604be81ce90365ff3f9cd42b531fef))
12. **sdk-scheme-adapter:** update package.json with main and type correct path ([#315](https://github.com/mojaloop/sdk-scheme-adapter/issues/315)) ([6d0f9b5](https://github.com/mojaloop/sdk-scheme-adapter/commit/6d0f9b541f79fa50cb6c89a3ac47cf97155f60ae))
13. **sdk-scheme-adapter:** update outbound interface and response oa3 defs ([#316](https://github.com/mojaloop/sdk-scheme-adapter/issues/316)) ([50d23d8](https://github.com/mojaloop/sdk-scheme-adapter/commit/50d23d8562afdeeeef2203d6196473c7b0e484a5))
14. **sdk-scheme-adapter:** correct party outbound response ([#317](https://github.com/mojaloop/sdk-scheme-adapter/issues/317)) ([752e8b4](https://github.com/mojaloop/sdk-scheme-adapter/commit/752e8b4d315a6e9c3b8ad4ff1b65761c41e3d721))
15. **sdk-scheme-adapter:** reformat error information response ([#318](https://github.com/mojaloop/sdk-scheme-adapter/issues/318)) ([ed844b1](https://github.com/mojaloop/sdk-scheme-adapter/commit/ed844b1d2da6c58d3c61622c07c326bda3ca3b86))
16. **mojaloop/#2574:** sdk-scheme-adapter is not returning party sub-id ([#120](https://github.com/mojaloop/mojaloop-simulator/issues/120)) ([b0e9504](https://github.com/mojaloop/mojaloop-simulator/commit/b0e950468ceeb129dc62f7ad8fdb84c86bf12749)), closes [mojaloop/#2574](https://github.com/mojaloop/mojaloop-simulator/issues/2574) [mojaloop/#2574](https://github.com/mojaloop/mojaloop-simulator/issues/2574) [mojaloop/#2575](https://github.com/mojaloop/mojaloop-simulator/issues/2575)
17. **mojaloop/#2810:** timeout events are being produced for transfers with an internal-state of ABORTED_ERROR ([#907](https://github.com/mojaloop/central-ledger/issues/907)) ([e77de0a](https://github.com/mojaloop/central-ledger/commit/e77de0a8e7dd473d3afbb27df464d27ff5ce98a7)), closes [mojaloop/#2810](https://github.com/mojaloop/project/issues/2810)
18. **mojaloop/#2811:** sdk-scheme-adapter sending incorrect transferState on a PUT transfers Callback ([#331](https://github.com/mojaloop/sdk-scheme-adapter/issues/331)) ([f7e450c](https://github.com/mojaloop/sdk-scheme-adapter/commit/f7e450cc2568f70f6c9abbb39d9c2186787c31b7)), closes [mojaloop/#2811](https://github.com/mojaloop/sdk-scheme-adapter/issues/2811)
19. **mojaloop/#2816:** SDK-Scheme-Adapter is missing/incorrect bulkTransferState on a PUT /bulkTransfer/{id} Callback by the PayeeFSP ([#331](https://github.com/mojaloop/sdk-scheme-adapter/issues/331)) ([f7e450c](https://github.com/mojaloop/sdk-scheme-adapter/commit/f7e450cc2568f70f6c9abbb39d9c2186787c31b7)), closes [mojaloop/#2816](https://github.com/mojaloop/sdk-scheme-adapter/issues/2816)
20. **Testing Toolkit:**:
    1. Added missing test currencies to FSPIOP apis provisioned in TTK [ml-testing-toolkit/pull/205](https://github.com/mojaloop/ml-testing-toolkit/pull/205)
    2. Unable to retain the renamed folder ([ml-testing-toolkit-ui/pull/126](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/126)), closes [mojaloop/#2656](https://github.com/mojaloop/project/issues/2656)
    3. TTK does not send callbacks after processing a Callback-Rule with a FIXED_CALLBACK ([ml-testing-toolkit-ui/pull/126](https://github.com/mojaloop/ml-testing-toolkit-ui/pull/126)), closes [mojaloop/#2685](https://github.com/mojaloop/project/issues/2695)

## 3. Application versions

1. ml-api-adapter: v13.0.0 -> **v14.0.0**
2. central-ledger: v13.16.1 -> **v15.1.2.1**
3. account-lookup-service: v13.0.0 -> **v14.0.0**
4. quoting-service: v14.0.0 -> **15.0.2**
5. central-settlement: 13.4.1 -> **v15.0.0**
6. central-event-processor: v11.0.2 -> **v12.0.0**
7. bulk-api-adapter: v13.0.1 -> **v14.0.0**
8. email-notifier: v11.0.2 -> **v12.0.0**
9. als-oracle-pathfinder: v11.0.4 -> **v12.0.0**
10. transaction-requests-service: v13.0.0 -> **v14.0.1**
11. finance-portal-ui: **v10.4.3** _(DEPRECATED)_
12. finance-portal-backend-service: **v15.0.2** _(DEPRECATED)_
13. settlement-management: **v11.0.0** _(DEPRECATED)_
14. operator-settlement: **v11.0.0** _(DEPRECATED)_
15. event-sidecar: **v12.0.0**
16. event-stream-processor: v11.0.0-snapshot -> **v12.0.0-snapshot.7**
17. simulator: 12.0.0 -> **v12.0.0**
18. mojaloop-simulator: v12.1.1 -> **v13.0.1**
19. sdk-scheme-adapter: v11.18.11 -> **v18.0.2**
20. ml-testing-toolkit: v14.0.4 -> **v15.0.0**
21. ml-testing-toolkit-ui: v13.5.5 -> **v15.0.0**
22. ml-testing-toolkit-client-lib: **v1.0.0**
23. auth-service: v11.11.1 -> **v13.0.2**
24. als-consent-service: v0.0.8 -> **v0.2.0**
25. thirdparty-api-svc: v11.21.0 -> **v13.0.2**
26. thirdparty-sdk: v11.55.1 -> **v15.1.0**

## 4. Application release notes

1. ml-api-adapter - https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.0
2. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v15.1.0
3. account-lookup-service - https://github.com/mojaloop/account-lookup-service/releases/tag/v14.0.0
4. quoting-service - https://github.com/mojaloop/quoting-service/releases/tag/v15.0.2
5. central-settlement- https://github.com/mojaloop/central-settlement/releases/tag/v15.0.0
6. central-event-processor - https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0
7. bulk-api-adapter - https://github.com/mojaloop/bulk-api-adapter/releases/tag/v14.0.0
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
19. sdk-scheme-adapter - https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v18.0.2
20. ml-testing-toolkit - https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v15.0.0
21. ml-testing-toolkit-ui - https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.0.0
22. ml-testing-toolkit-client-lib - https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.0.0
23. auth-service - https://github.com/mojaloop/auth-service/releases/tag/v13.0.2
24. als-consent-service - https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.0
25. thirdparty-api-svc - https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.2
26. thirdparty-sdk-adapter - https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.0

## 5. Breaking changes

_Note: Apart from `Thirdparty-api specification`, below changes are breaking for upgrades and implementations of a Mojaloop Switch but not for FSPs or other entities interacting with a Mojaloop Switch itself._

1. **Central-Ledger:** Prior to this release, the liquidity check performed as part of transfer preparation compares the position account (plus the amount of the proposed transfer) against the (Net Debit Cap) NDC. An **additional check** has been added in this PR, to ensure that the Payer FSP has sufficient liquidity in their settlement account balance over and above their NDC. Error messages have changed as a result. For NDC limit check from `PAYER_FSP_INSUFFICIENT_LIQUIDITY` to `PAYER_LIMIT_ERROR`. The error message `PAYER_FSP_INSUFFICIENT_LIQUIDITY` occurs when the payer has an insufficient settlement account balance. [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899)

2. **mojaloop/#2092:** Major version bump for node v16 LTS support, re-structuring of project directories to align to core Mojaloop repositories with docker image now using `/opt/app` instead of `/opt/central-ledger`, `opt/account-lookup-service`, `opt/ml-api-adapter`, `/opt/quoting-service`, `/opt/bulk-api-adapter`, `/opt/transaction-requests-service`, `/opt/central-settlement`, `/opt/email-notifier`, `/opt/als-consent-oracle`, `/opt/event-stream-processor`, `/opt/central-event-processor` which will impact config mounts.

3. **Mongodb dependency charts:** have been upgraded due to Bitnami's [retention policy](https://github.com/bitnami/charts/issues/10539). This impacts the following components: `central-event-processor`, `ml-testing-toolkit` (only when enabled), `bulk-api-adapter`.

    >
    > Please familiarize yourself with the [deployment-guide/upgrade-strategy-guide](https://docs.mojaloop.io/legacy/deployment-guide/upgrade-strategy-guide.html) documentation.
    >
    > To avoid this, ensure that all backend-dependencies are deployed separately. Currently they are included in a default Mojaloop installation for convenience, and should not be used for any production-grade installation.
    >
    > In future versions of Mojaloop all backend-dependencies will be removed and a separate backend chart will be provided as an example for convenience (Similarly, this chart should not be used for any production-grade installation).
    >

    Here is an example of how this breaking change manifests itself...

    Installing `v13.1.1`:

    ```bash
    > helm -n moja install moja mojaloop/mojaloop --version 13.1.1
    ```

    Upgrading `v13.1.1` to `v14.0.0` will result in the following error:

    ```bash
    > helm -n moja upgrade moja mojaloop/mojaloop --debug --devel --version 14.0.0

    history.go:56: [debug] getting history for release moja
    upgrade.go:142: [debug] preparing upgrade for moja

    Error: UPGRADE FAILED: execution error at (mojaloop/charts/central/charts/ centraleventprocessor/charts/mongodb/templates/secrets.yaml:33:24): 
    PASSWORDS ERROR: The secret "moja-cep-mongodb" does not contain the key  "mongodb-passwords"
 
    helm.go:84: [debug] execution error at (mojaloop/charts/central/charts/ centraleventprocessor/charts/mongodb/templates/secrets.yaml:33:24): 
    PASSWORDS ERROR: The secret "moja-cep-mongodb" does not contain the key  "mongodb-passwords"
 
    UPGRADE FAILED
    ...
    ```

4. **Thirdparty-API specification:** upgrades from v0.1 to v1.0 introduced breaking changes in this release will impact the following Thirdparty components:
   - auth-svc
   - als-consent-service
   - thirdparty-api-svc
   - thirdparty-sdk

5. **Thirdparty-SDK:** support for configuration management via [Payment Manager for Mojaloop](https://github.com/pm4ml) introduced a breaking changes:
    - Configuration changed to camel-case (take note of your configuration)
    - Inbound/Outbound servers can NOT be run independently

6. **Thirdparty - auth-service, als-consent-service:** migration scripts are now compiled by Typescript instead of interpreted:
   If you have a deployment of any previous versions of `auth-service` or `als-consent-oracle` running, you will need to create new databases and manually create migration scripts for any data that you require. This is due to the migration-scripts files being dependent on their javascript compiled variants.

7. **SDK-Scheme-Adapter:** features merged from mojaloop-connector:
    - Outbound API response body has changed, now includes headers and payloads, refer to [mojaloop/sdk-scheme-adapter/v18.0.2/src/OutboundServer/api.yaml](https://github.com/mojaloop/sdk-scheme-adapter/blob/v18.0.2/src/OutboundServer/api.yaml) for updated interface specification.
    - Re-structuring of project directories to align to core Mojaloop repositories with docker image now using `/opt/app` instead of `/` (root).
    - `/secrets` folder is no longer included in docker image by default aligning to best practices. Ensure you mount and configure your secrets appropriately.

8. **Testing Toolkit:**:
   - Major version bump for node v16 LTS support, re-structuring of project directories to align to core Mojaloop repositories with docker image now using `/opt/app`.
   - Port changed from `5000` to `4040`, this may impact the callback endpoints used in the TTK environment files. And also if there are any overrides related to ports in the helm values files.
   - TTK CLI is now removed from `ml-testing-toolkit`. Please use [ml-testing-toolkit-client-lib](https://github.com/mojaloop/ml-testing-toolkit-client-lib) for TTK CLI.

## 6. Deprecations

The following components are being deprecated from the packaged Mojaloop Helm chart release:

- [finance-portal](https://github.com/mojaloop/helm/tree/master/finance-portal) Helm Chart
  - [finance-portal-ui](https://github.com/mojaloop/finance-portal-ui/releases/tag/v10.4.3)
  - [finance-portal-backend-service](https://github.com/mojaloop/finance-portal-backend-service/releases/tag/v15.0.2)
- [finance-portal-settlement-management](https://github.com/mojaloop/helm/tree/master/finance-portal-settlement-management) Helm Chart
  - [settlement-management](https://github.com/mojaloop/settlement-management/releases/tag/v11.0.0)
  - [operator-settlement](https://github.com/mojaloop/operator-settlement/releases/tag/v11.0.0)

> _Note these Helm Chart are still available for deployment in the [Mojaloop Helm Repo (http://mojaloop.io/helm/repo/)](http://mojaloop.io/helm/repo/index.yaml)._

This is due to the underlying services having been deprecated by the Micro-Services provided by the [Business Operation Framework (BOF)](https://github.com/mojaloop/business-operations-framework-docs) for Financial Management and Reporting.

More information can be found here:

- https://github.com/mojaloop/business-operations-framework-docs.

[BOF Helm charts](https://github.com/mojaloop/charts/tree/master/mojaloop/bof) to deploy the [Business Operation Framework](https://github.com/mojaloop/business-operations-framework-docs) can be found here:

- https://github.com/mojaloop/charts/tree/master/mojaloop/bof

## 7. Testing notes

1. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

2. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v14.0.0)' Golden Path collections expects:
    - the Quoting service operating mode to be set [quoting-service.config.simple_routing_mode_enabled=true](https://github.com/mojaloop/helm/blob/v13.1.0/mojaloop/values.yaml#L4664). If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter [SIMPLE_ROUTING_MODE_ENABLED](https://github.com/mojaloop/helm/blob/v14.0.0/mojaloop/values.yaml#L7420) to match.
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

## 8. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2352 - Mojaloop Helm support for Kubernetes 1.22](https://github.com/mojaloop/project/issues/2352)
4. [#2448 - Nginx Ingress Controller v1.0.0 is incompatible with Mojaloop Helm v13.0.x releases](https://github.com/mojaloop/project/issues/2448)
5. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
6. Testing Toolkit Test Case issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2734 - Failures in daily cron job running GP tests](https://github.com/mojaloop/project/issues/2734)
    3. [#2845 - QA: Replace Legacy-Simulator as a NORESPONSE_SIMPAYEE in Testing-Toolkit Goden Path Test-Suite](https://github.com/mojaloop/project/issues/2845)
    4. [#2846 - QA: Mojaloop TTK GP Test Collections to reset available liquidity after each run](https://github.com/mojaloop/project/issues/2846)

## 9. Contributors

- Organizations: BMGF, CrossLake, ModusBox
- Individuals: @elnyry-sam-k, @mdebarros, @vijayg10, @shashi165, @kleyow, @kirgene, @lewisdaly, @tdaly61

_Note: companies are in alphabetical order, individuals are in no particular order._
