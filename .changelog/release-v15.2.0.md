# Helm Release Notes

Date | Revision | Description
---------|----------|---------
 2023-10-23 | 0 | Initial draft
 2023-10-31 | 1 | RC.1
 2023-11-03 | 2 | Release

- For *BREAKING CHANGES*, please review the section `#5` "Breaking Changes" below.
- For *KNOWN ISSUES*, please review the section `#8` "Known Issues" below.

## 0. Summary

Enhancements and non-breaking changes to the [v15.1.0 Release](https://github.com/mojaloop/helm/blob/master/.changelog/release-v15.1.0.md), which includes:

1. Nodejs version of core and supporting services upgraded to v18.17.1 LTS
2. Performance improvements and metrics around core services: ALS, Central Ledger, Quoting Service based on characterisation and fixes, enhancements done
3. General maintenance and bug fixes

## 1. New Features

1. **Performance fixes, enhancements and maintenance:**  
      * **mojaloop/#2880** simplify liquidity cover check and fix issue with validation (for main) (https://github.com/mojaloop/central-ledger/issues/918) ([825faf7](https://github.com/mojaloop/central-ledger/commit/825faf7c1c918b12eddedeb97eea0a2d563457e4)) - https://github.com/mojaloop/central-ledger/releases/tag/v17.0.4
      * **mojaloop/#2928** Upgrade Mojaloop Simulator Logging ([mojaloop-simulator/#2928](https://github.com/mojaloop/mojaloop-simulator/pull/148)), closes [mojaloop/#3564](https://github.com/mojaloop/project/issues/3564)
      * **mojaloop/#3264** SDK - Implement restart functionality for Bulk related outbound requests after PM4ML onboarding ([sdk-scheme-adapter](https://github.com/mojaloop/sdk-scheme-adapter/pull/454)), closes [mojaloop/3264](https://github.com/mojaloop/project/issues/3264)
      * **mojaloop/#3396**  Performance Maintenance characterisation for ALS - Add instrumentation ([account-lookup-service/pull/457](https://github.com/mojaloop/account-lookup-service/pull/457)), closes [mojaloop/#3396](https://github.com/mojaloop/project/issues/3396)  
      * **mojaloop/#3419** Perform benchmark tests ([central-ledger/pull/961](https://github.com/mojaloop/central-ledger/pull/961), )
      * **mojaloop/#3419** json stringify on every response (https://github.com/mojaloop/central-ledger/issues/961) ([6798bfd](https://github.com/mojaloop/central-ledger/commit/6798bfda51be18c2d44c22e10ef67bc76c8b2195)) - https://github.com/mojaloop/central-ledger/releases/tag/v17.0.5, closes [mojaloop/#3419](https://github.com/mojaloop/project/issues/3419)
      * **mojaloop/#3432** Adds quoting service Performance characterization upgrades and dashboards([quoting-service/pull/#311](https://github.com/mojaloop/quoting-service/pull/311), [quoting-service/pull/313](https://github.com/mojaloop/quoting-service/pull/313), [quoting-service/pull/31]), closes [mojaloop/#3432](https://github.com/mojaloop/project/issues/3432)
      * **mojaloop/#3470** Profile ML-API-Adapter Notification Handler ([ml-api-adapter/pull/510](https://github.com/mojaloop/ml-api-adapter/pull/510), [ml-api-adapter/pull/512](https://github.com/mojaloop/ml-api-adapter/pull/512), ), closes [mojaloop/#3470](https://github.com/mojaloop/project/issues/3470)
      * **mojaloop/#3472**  Enhance Kafka lib (vNow) to 3452 performance stream recommendations([central-services-stream/pull/129](https://github.com/mojaloop/central-services-stream/pull/129)), closes [mojaloop/#3472](https://github.com/mojaloop/project/issues/3472) 
      * **mojaloop/#3480**  JSON.stringify degrades performance on high call count function in default LOG_LEVEL=info ([central-services-shared/pull/343](https://github.com/mojaloop/central-services-shared/pull/343)), closes [mojaloop/#3480](https://github.com/mojaloop/project/issues/3480)  
      * **mojaloop/#3489**  Implement the batching design for position prepare messages ([central-ledger/pull/970](https://github.com/mojaloop/central-ledger/pull/970), [central-ledger/pull/972](https://github.com/mojaloop/central-ledger/pull/972), [central-ledger/pull/975](https://github.com/mojaloop/central-ledger/pull/975)), closes [mojaloop/#3489](https://github.com/mojaloop/project/issues/3489)  
      * **mojaloop/#3498** alter message keys for prepare, fulfil and timeout (https://github.com/mojaloop/central-ledger/issues/965) ([db3e3b2](https://github.com/mojaloop/central-ledger/commit/db3e3b2f0450f1093f1f20eb4f49b4f4de53ddd0)), closes https://github.com/mojaloop/project/issues/3498 - from https://github.com/mojaloop/central-ledger/releases/tag/v17.1.0
      * **mojaloop/#3519** add topic name override config map logic (https://github.com/mojaloop/central-ledger/issues/969) ([b99d091](https://github.com/mojaloop/central-ledger/commit/b99d09129f328aab60e4059035be4d263ecd9f98)), closes https://github.com/mojaloop/project/issues/3519 - https://github.com/mojaloop/central-ledger/releases/tag/v17.2.0
      * **mojaloop/#3537** Performance Characterise Quotes ([quoting-service/pull/#313](https://github.com/mojaloop/quoting-service/pull/313), [quoting-service/pull/#315](https://github.com/mojaloop/quoting-service/pull/315)), closes [mojaloop/#3537](https://github.com/mojaloop/project/issues/3537)  
      * **mojaloop/#3564** Quoting Service stalls on large concurrent requests/loads ([quoting-service/319](https://github.com/mojaloop/quoting-service/pull/319)), closes [mojaloop/#3564](https://github.com/mojaloop/project/issues/3564)
      * **mojaloop/#3565** Re-enable caching on ([quoting-service/#318](https://github.com/mojaloop/quoting-service/pull/318)), closes [mojaloop/#3565](https://github.com/mojaloop/project/issues/3565)
      * **mojaloop/3599** Add Support for custom annotation to helm chart deployments/statefulsets ([helm](https://github.com/mojaloop/helm/pull/581)), closes [mojaloop/#3599](https://github.com/mojaloop/project/issues/3599)

2. **NodeJS upgrades:**  
      * **mojaloop/#3386** SDK-Scheme-Adapter NodeJS Upgrade ([sdk-scheme-adapter/pull/453](https://github.com/mojaloop/sdk-scheme-adapter/pull/453), [sdk-scheme-adapter/pull/454](https://github.com/mojaloop/sdk-scheme-adapter/pull/454), [sdk-scheme-adapter/pull/455](https://github.com/mojaloop/sdk-scheme-adapter/pull/455))
      * **mojaloop/#3433** Central-Ledger NodeJS Upgrade ([central-ledger/pull/#964](https://github.com/mojaloop/central-ledger/pull/964)), closes [mojaloop/#3433](https://github.com/mojaloop/project/issues/3433)
      * **mojaloop/#3434** Central-Settlement NodeJS Upgrade ([central-settlement/pull/394](https://github.com/mojaloop/central-settlement/pull/394), [central-settlement/pull/395](https://github.com/mojaloop/   central-settlement/pull/395)), closes [mojaloop/#3434](https://github.com/mojaloop/project/issues/3434)
      * **mojaloop/#3435** Account Lookup Service NodeJs Upgrade ([account-lookup-service/pull/462](https://github.com/mojaloop/quoting-service/pull/309)), closes [mojaloop/#3435](https://github.com/mojaloop/   project/issues/3435)  
      * **mojaloop/#3437** ALS-Consent-Oracle NodeJS Upgrade ([als-consent-oracle/pull/30](https://github.com/mojaloop/als-consent-oracle/pull/30)), closes [mojaloop/#3437](https://github.com/mojaloop/project/   issues/3437)
      * **mojaloop/#3438** Quoting Service NodeJS Upgrade ([quoting-service/pull/309](https://github.com/mojaloop/quoting-service/pull/309)), closes [mojaloop/#3438](https://github.com/mojaloop/project/issues/   3438)  
      * **mojaloop/#3439** Transaction-Request-Service NodeJS Upgrade ([transaction-request-service](https://github.com/mojaloop/transaction-requests-service/pull/97)), closes [mojaloop/#3434](https://github.com/   mojaloop/project/issues/3439)
      * **mojaloop/#3440** Auth-Service NodeJS Upgrade ([auth-service/pull/133](https://github.com/mojaloop/auth-service/pull/133)), closes [mojaloop/#3440](https://github.com/mojaloop/project/issues/3440)
      * **mojaloop/#3443** event-sidecar NodeJS Upgrade ([event-sidecar/pull/54](https://github.com/mojaloop/event-sidecar/pull/54), [event-sidecar/pull/55](https://github.com/mojaloop/event-sidecar/pull/55)),    closes [mojaloop/#3443](https://github.com/mojaloop/project/issues/3443)
      * **mojaloop/#3444** Mojaloop-Simulator NodeJS Upgrade ([mojaloop-simulator/pull/168](https://github.com/mojaloop/mojaloop-simulator/pull/168)), closes [mojaloop/#3444](https://github.com/mojaloop/project/   issues/3444)
      * **mojaloop/#3446** Update Node JS version for the email-notifier ([email-notifier/pull/209](https://github.com/mojaloop/email-notifier/pull/209)), closes [mojaloop/#3446](https://github.com/mojaloop/   project/issues/3446)
      * **mojaloop/#3447** Bulk-Api-Adapter NodeJS Upgrade ([bulk-api-adapter/pull/99](https://github.com/mojaloop/bulk-api-adapter/pull/99), [bulk-api-adapter/pull/100](https://github.com/mojaloop/   bulk-api-adapter/pull/100))
      * **mojaloop/#3448** Update Node JS version for the core libraries - central-services-stream ([central-services-stream/pull/130](https://github.com/mojaloop/central-services-stream/pull/130)), closes    [mojaloop/#3448](https://github.com/mojaloop/project/issues/3448)  
      * **mojaloop/#3450** Update Node JS version for the core libraries - central-services-health ([central-services-metrics/pull/161](https://github.com/mojaloop/central-services-metrics/pull/161)), closes    [mojaloop/#3450](https://github.com/mojaloop/project/issues/3450)  
      * **mojaloop/#3451** Update Node JS version for the core libraries - central-services-health ([central-services-health/pull/256](https://github.com/mojaloop/central-services-health/pull/256)), closes    [mojaloop/#3451](https://github.com/mojaloop/project/issues/3451)
      * **mojaloop/#3453** Update Node JS version for the core libraries - central-services-error-handling ([central-services-error-handling/pull/184](https://github.com/mojaloop/central-services-error-handling/   pull/184)), closes [mojaloop/#3453](https://github.com/mojaloop/project/issues/3453)
      * **mojaloop/#3454** Update Node JS version for the core libraries - sdk-standard-components ([event-sdk/pull/73](https://github.com/mojaloop/event-sdk/pull/73)), closes [mojaloop/#3454](https://github.com/   mojaloop/project/issues/3454)
      * **mojaloop/#3455** Update Node JS version for the core libraries - event-sdk([sdk-standard-components/pull/186](https://github.com/mojaloop/sdk-standard-components/pull/186)), closes [mojaloop/#3455]   (https://github.com/mojaloop/project/issues/3455)  
      * **mojaloop/#3455** Update Node JS version for the core-lib central-services-logger ([central-services-logger/pull/44](https://github.com/mojaloop/central-services-logger/pull/44)), closes [mojaloop/#3455]   (https://github.com/mojaloop/project/issues/3455)  
      * **mojaloop/#3458** Update Node JS version for the ttk toolkit([thirdparty-sdk/pull/167](https://github.com/mojaloop/thirdparty-sdk/pull/167)), closes [mojaloop/#3458](https://github.com/mojaloop/project/   issues/3458)
      * **mojaloop/#3460** Update Node JS version for the ttk shared lib([ml-testing-toolkit-shared-lib/pull/13](https://github.com/mojaloop/ml-testing-toolkit-shared-lib/pull/13)), closes [mojaloop/#3460]   (https://github.com/mojaloop/project/issues/3460)  
      * **mojaloop/#3461** ML-API-Adapter NodeJS Upgrade ([ml-testing-toolkit-client-lib/pull/8](https://github.com/mojaloop/ml-testing-toolkit-client-lib/pull/8)), closes [mojaloop/#3461](https://github.com/   mojaloop/project/issues/3461)
      * **mojaloop/#3475** Upgrade Node JS version for the core libraries - api-snippets ([api-snippets/pull/164](https://github.com/mojaloop/api-snippets/pull/164)), closes [mojaloop/#3475](https://github.com/   mojaloop/project/issues/3475)  
      * **mojaloop/#3476** Upgrade Node JS version for the core libraries - ml-number ([ml-number/pull/26](https://github.com/mojaloop/ml-number/pull/26)), closes [mojaloop/#3476](https://github.com/mojaloop/   project/issues/3476)  
      * **mojaloop/#3518** Acentral-services-database NodeJs Upgrade ([database-lib/pull/154](https://github.com/mojaloop/database-lib/pull/154)), closes [mojaloop/#3518](https://github.com/mojaloop/project/   issues/3518)  
      * **mojaloop/#3521** Thirdparty-API-Service NodeJS Upgrade ([thirdparty-api-service/pull/91](https://github.com/mojaloop/thirdparty-api-svc/pull/91), [third-party-api-svc/pull/92](https://github.com/   mojaloop/thirdparty-api-svc/pull/92)), closes [mojaloop/#3521](https://github.com/mojaloop/project/issues/3521)
      * **mojaloop/#3425** ML-API-Adapter NodeJS Upgrade ([ml-api-adapter/pull/513](https://github.com/mojaloop/ml-api-adapter/pull/513), [ml-api-adapter/pull/514](https://github.com/mojaloop/ml-api-adapter/pull/   514)), closes [mojaloop/#3425](https://github.com/mojaloop/project/issues/3425) 

## 2. Bug Fixes

1. **mojaloop/#2734** Failures in daily cronjob GP tests ([mojaloop-simulator](https://github.com/mojaloop/mojaloop-simulator/pull/146)), closes [mojaloop/2734](https://github.com/mojaloop/project/issues/2734)
2. **mojaloop/#3474** CL Cache expiration values higher than default causes transfer to fail ([central-ledger/pull/966](https://github.com/mojaloop/central-ledger/pull/966)), closes [mojaloop/#3474](https://github.com/mojaloop/project/issues/3474)
3. **mojaloop/#3527** CL v17.2.0 might have issues on payee notifications, Duplicate transfer ID check as well ([object-store-lib](https://github.com/mojaloop/object-store-lib/pull/47)), closes [mojaloop/3527](https://github.com/mojaloop/project/issues/3527)
4. **mojaloop/#3529** CL high latency in transfer processing([central=ledger](https://github.com/mojaloop/central-ledger/pull/981)), closes [mojaloop/#3529](https://github.com/mojaloop/project/issues/3529)
5. **mojaloop/#3579** Provisioning and GP test failing because of Funds In timing problems ([testing-toolkit-test-cases/pull/129](https://github.com/mojaloop/testing-toolkit-test-cases/pull/129))
6. **mojaloop/#3580** fix missing toDestination on handling the fspiop source/destination ([central-ledger/pull/982](https://github.com/mojaloop/central-ledger/pull/982)), closes [mojaloop/3580](https://github.com/mojaloop/project/issues/3580)
7. **mojaloop/#3589** Bulk API Adapter failing due to object-lib-store bug ([bulk-api-adapter/pull/102](https://github.com/mojaloop/bulk-api-adapter/pull/102))
8. **mojaloop/#4597** Setup and GP failures when upgrading Mojaloop from v15.1.0 to v15.2.0-rc ([testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/pull/129)), closes [mojaloop/3597](https://github.com/mojaloop/project/issues/3597)

## 3. Application versions

1. ml-api-adapter: v14.0.0 -> [v14.0.4](https://github.com/mojaloop/ml-api-adapter/releases/tag/v14.0.4) ([Compare](https://github.com/mojaloop/ml-api-adapter/compare/v14.0.0...v14.0.4))
2. central-ledger: v17.0.3 -> [v17.3.0]((https://github.com/mojaloop/central-ledger/releases/tag/v17.3.0)) ([Compare](https://github.com/mojaloop/central-ledger/compare/v17.0.3...v17.3.0))
3. account-lookup-service: 14.1.0 -> [v14.2.5](https://github.com/mojaloop/account-lookup-service/releases/tag/v14.2.5) ([Compare](https://github.com/mojaloop/account-lookup-service/compare/v14.1.0...v14.2.5))
4. quoting-service: v15.0.2 -> [v15.5.0](https://github.com/mojaloop/quoting-service/releases/tag/v15.5.0) ([Compare](https://github.com/mojaloop/quoting-service/compare/v15.0.2...v15.5.0))
5. central-settlement: v15.0.0 -> [v15.0.4](https://github.com/mojaloop/central-settlement/releases/tag/v15.0.4) ([Compare](https://github.com/mojaloop/central-settlement/compare/v15.0.0...v15.0.4))
6. bulk-api-adapter: v15.0.3 -> [v16.0.1](https://github.com/mojaloop/bulk-api-adapter/releases/tag/v16.0.1) ([Compare](https://github.com/mojaloop/bulk-api-adapter/compare/v15.0.3...v16.0.1))
7. central-event-processor: [v12.0.0](https://github.com/mojaloop/central-event-processor/releases/tag/v12.0.0)
8. email-notifier: v12.0.0 -> [v13.0.1](https://github.com/mojaloop/email-notifier/releases/tag/v13.0.1) ([Compare](https://github.com/mojaloop/email-notifier/compare/v12.0.0...v13.0.1))
9. als-oracle-pathfinder: [v12.0.0](https://github.com/mojaloop/als-oracle-pathfinder/releases/tag/v12.0.0)
10. transaction-requests-service: v14.1.0 -> [v14.1.1](https://github.com/mojaloop/transaction-requests-service/releases/tag/v14.1.1) ([Compare](https://github.com/mojaloop/transaction-requests-service/compare/v14.1.0...v14.1.1))
11. event-sidecar: v12.0.0 -> [v13.0.1](https://github.com/mojaloop/event-sidecar/releases/tag/v13.0.1) ([Compare](https://github.com/mojaloop/event-sidecar/compare/v12.0.0...v13.0.1))
12. event-stream-processor: [v12.0.0-snapshot.7](https://github.com/mojaloop/event-stream-processor/releases/v12.0.0-snapshot.7)
13. simulator: [12.0.0](https://github.com/mojaloop/simulator/releases/tag/v12.0.0)
14. mojaloop-simulator: v14.0.1 -> [v15.0.0](https://github.com/mojaloop/mojaloop-simulator/releases/tag/v15.0.0) ([Compare](https://github.com/mojaloop/event-sidecar/compare/v14.0.1...v15.0.0))
15. sdk-scheme-adapter: v23.0.1 -> [v23.1.1](https://github.com/mojaloop/sdk-scheme-adapter/releases/tag/v23.1.1) ([Compare](https://github.com/mojaloop/sdk-scheme-adapter/compare/v23.0.1...v23.1.1))
16. ml-testing-toolkit: v16.1.1 -> [v17.0.0](https://github.com/mojaloop/ml-testing-toolkit/releases/tag/v17.0.0) ([Compare](https://github.com/mojaloop/sml-testing-toolkit/compare/v16.1.1...v17.0.0))
17. ml-testing-toolkit-ui: [v15.4.0](https://github.com/mojaloop/ml-testing-toolkit-ui/releases/tag/v15.3.0)22. ml-testing-toolkit-client-lib: [v1.2.0](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.0)
18. ml-testing-toolkit-client-lib: v1.2.0 -> [v1.2.1](https://github.com/mojaloop/ml-testing-toolkit-client-lib/releases/tag/v1.2.1)  ([Compare](https://github.com/mojaloop/ml-testing-toolkit-ui/compare/v1.2.0...v1.2.1))
19. auth-service: v14.0.0 -> [v14.0.1](https://github.com/mojaloop/auth-service/releases/tag/v14.0.1) ([Compare](https://github.com/mojaloop/auth-service/compare/v14.0.0...v14.0.1))
20. als-consent-oracle: v0.2.0 -> [v0.2.1](https://github.com/mojaloop/als-consent-oracle/releases/tag/v0.2.1) ([Compare](https://github.com/mojaloop/als-consent-oracle/compare/v0.2.0...v0.2.1))
21. thirdparty-api-svc: v13.0.2 -> [v13.0.4](https://github.com/mojaloop/thirdparty-api-svc/releases/tag/v13.0.4) ([Compare](https://github.com/mojaloop/thirdparty-api-svc/compare/v13.0.2...v13.0.4))
22. thirdparty-sdk: v15.1.0 -> [v15.1.1](https://github.com/mojaloop/thirdparty-sdk/releases/tag/v15.1.1) ([Compare](https://github.com/mojaloop/thirdparty-sdk/compare/v15.1.0...v15.1.1))


## 4. API Versions

This release supports the following versions of the [Mojaloop family of APIs](https://docs.mojaloop.io/api):

| API         | Supported Versions                                                                                                                                    | Notes |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| FSPIOP      | [v1.1](https://docs.mojaloop.io/api/fspiop/v1.1/api-definition.html), [v1.0](https://docs.mojaloop.io/api/fspiop/v1.0/api-definition.html) |       |
| Settlements | [v2.0](https://docs.mojaloop.io/api/settlement)                                                                                            |       |
| Admin       | [v1.0](https://docs.mojaloop.io/api/administration/central-ledger-api.html)                                                                |       |
| Oracle      | [v1.0](https://docs.mojaloop.io/legacy/api/als-oracle-api-specification.html)                                                              |       |
| Thirdparty  | [v1.0](https://docs.mojaloop.io/api/thirdparty)                                                                                            |       |

## 5. Testing notes

1. This release has been validated against the following Dependency Test Matrix:

    | Dependency | Version |  Notes   |
    | ---------- | ------- | --- |
    | Kubernetes | v1.28 | [AWS EKS](https://aws.amazon.com/eks/), [AWS EKS Supported Version Notes](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)  |
    | containerd  |  v1.6.19  |  |
    | Nginx Ingress Controller | [helm-ingress-nginx-4.7.0](https://github.com/kubernetes/ingress-nginx/releases/tag/helm-chart-4.7.0) / [ingress-controller-v1.8.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.8.0) |     |
    |  Amazon Linux   |  v2   |     |
    |  MySQL   |  bitnami/mysql:8.0.32-debian-11-r0   |     |
    |  Kafka   |  bitnami/kafka:3.3.1-debian-11-r1   |     |
    |  Redis   |  bitnami/redis:7.0.5-debian-11-r7   |     |
    |  MongoDB   |  bitnami/mongodb:6.0.2-debian-11-r11   |     |
    |  Testing Toolkit Test Cases   |  [v15.2.0](https://github.com/mojaloop/testing-toolkit-test-cases/releases/tag/v15.2.0)   |     |
    |  example-mojaloop-backend   |  v15.0.0   |  [README](https://github.com/mojaloop/helm/blob/master/example-mojaloop-backend/README.md)   |

2. It is recommended that all Mojaloop deployments are verified using the [Mojaloop Testing Toolkit](https://docs.mojaloop.io/documentation/mojaloop-technical-overview/ml-testing-toolkit/). More information can be found in the [Mojaloop Deployment Guide](https://docs.mojaloop.io/documentation/deployment-guide).

3. The [testing-toolkit-test-cases](https://github.com/mojaloop/testing-toolkit-test-cases/releases) (See above Dependency Test Matrix for exact version required for this release) Golden Path collections expects:
    - the Quoting service operating mode to be set quoting-service.config.simple_routing_mode_enabled=true (in helm mojaloop/values.yaml under quoting-service config). If this is incorrectly configured, it will result in several failures in the quoting-service tests (7 expected failures). If this is disabled, ensure that you update the corresponding test-case environment variable parameter **SIMPLE_ROUTING_MODE_ENABLED** ( in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues) to match.
    - the **on-us transfers** (in mojaloop/values.yaml "enable_on_us_transfers: false" under centralledger-handler-transfer-prepare -> config and  cl-handler-bulk-transfer-prepare -> config) configuration to be disabled. The test-case environment variable parameter (**ON_US_TRANSFERS_ENABLED** (in helm mojaloop/values.yaml ml-testing-toolkit -> extraEnvironments.hub-k8s-default-environment.json.inputValues), the same name used on postman collections) must similarly match this value.

4. Simulators
    - We recommend using Testing Toolkit instead of Postman which is better suited for the async nature of the Mojaloop API specification (see above)
    - [Mojaloop-Simulator](https://github.com/mojaloop/mojaloop-simulator) is enabled by default (six instances used for single transfers usually and three more specific to bulk).
    - Ensure that correct Postman Scripts are used if you wish to test against the Mojaloop-Simulators:
        - Setup Mojaloop Hub: [MojaloopHub_Setup](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopHub_Setup.postman_collection.json)
        - Setup Mojaloop Simulators for testing : [MojaloopSims_Onboarding](https://github.com/mojaloop/postman/blob/v12.0.0/MojaloopSims_Onboarding.postman_collection.json)
        - Golden path tests: [Golden_Path_Mojaloop](https://github.com/mojaloop/postman/blob/v12.0.0/Golden_Path_Mojaloop.postman_collection.json)
    - Legacy Simulators are still required and deployed by default; disabling this will cause issues since there is Account Lookup directory mocking functionality in this service.

5. Thirdparty Testing Toolkit Test Collections are not repeatable. Please refer to the following issue for more information [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717). It is possible to manually cleanup persistent data to re-run the test if required.

6. Bulk API Helm Tests

    Refer to the [Testing Deployments](https://github.com/mojaloop/helm/blob/master/README.md#testing-deployments) section in the main README for detailed information on how to enable bulk-api-adapter tests.

7. Thirdparty API Helm Tests

    Refer to [thirdparty/README.md#validating-and-testing-the-3p-api](https://github.com/mojaloop/helm/blob/master/thirdparty/README.md#validating-and-testing-the-3p-api) on how to enabled and execute Thirdparty verification tests.

8. Testing the new Bulk functionality (sdk-scheme-adapter)

    For details regarding deployment and validation of simulators needed for bulk (for adoption provided in sdk-scheme-adapter) refer to [deploying Mojaloop TTK simulators](https://github.com/mojaloop/helm/blob/master/mojaloop-ttk-simulators/README.md).

## 6. Known Issues

1. [#2119 - Idempotency for duplicate quote request](https://github.com/mojaloop/project/issues/2119)
2. [#2322 - Helm install failing with with "medium to large" release names](https://github.com/mojaloop/project/issues/2322)
3. [#2317 - Mojaloop Helm deployments are not compatible when deployed to ARM-arch based hosts](https://github.com/mojaloop/project/issues/2317)
4. [#2435 - Quoting-Service is incorrectly handling failed responses to FSPs when forwarding requests](https://github.com/mojaloop/project/issues/2435)
5. Test issues causing instability/intermitant failures on Test Case Results
    1. [#2717 - Thirdparty TTK Test-Collection is not repeatable](https://github.com/mojaloop/project/issues/2717)
    2. [#2925 - Helm Test Intermittent failure with 'Generic ID not found](https://github.com/mojaloop/project/issues/2925)

## 7. Contributors

- Organizations: BMGF, InFiTX
- Individuals: @chris-me-law , @dfry , @elnyry-sam-k , @PaulGregoryBaker , @mdebarros , @vijayg10 , @aaronreynoza , @oderayi, @elijah0kello

*Note: companies are in alphabetical order, individuals are in no particular order.*

**Full Changelog**: https://github.com/mojaloop/helm/compare/v15.1.0...v15.2.0