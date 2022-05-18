## Helm release notes
1. For breaking changes, please review the section `#4` "Breaking Changes" below.

### 1. New Features

1. Change the basis for the liquidity check ([mojaloop/design-authority-project/issues/90](https://github.com/mojaloop/design-authority-project/issues/90)). Pull request is [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899)

## 2. Application versions

1. central-ledger: v13.14.0 -> **v13.16.1**


## 3. Application release notes

1. central-ledger - https://github.com/mojaloop/central-ledger/releases/tag/v14.0.0


## 4. Breaking changes

1. Central Ledger - Transfer will be successful only if the payer has sufficient liquidity in their settlement account balance over and above their NET-DEBIT-CAP (NDC) limit. This is the additional check that has been added in this PR, and will be applied to the lower value. Error messages have changed as a result. For NDC limit check from `PAYER_FSP_INSUFFICIENT_LIQUIDITY` to `PAYER_LIMIT_ERROR`. The error message `PAYER_FSP_INSUFFICIENT_LIQUIDITY` occurs when the payer has an insufficient settlement account balance. [mojaloop/central-ledger/pull/899](https://github.com/mojaloop/central-ledger/pull/899)


## 5. Testing notes

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
