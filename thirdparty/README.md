# thirdparty

Helm charts for Mojaloop Thirdparty API

![](./overview.svg)

## Overview

The Thirdparty API is an overlay services API that adds support for 3rd Party Payment
Initiators to a Mojaloop Switch.

### Sub-Charts
- [chart-auth-svc](./chart-auth-svc) - Central Auth-Svc
- [chart-consent-oracle](./chart-consent-oracle) - CONSENT IdType oracle for the ALS
- [chart-tp-api-svc](./chart-tp-api-svc) - Thirdparty Api Service

## Components

### Third Party API Service

The core of the 3P-API is handled by the Third Party API Service (tp-api-svc), which 
implements the Third Party API as defined in the [Mojaloop 3P API Specification](https://github.com/mojaloop/mojaloop-specification/tree/master/thirdparty-api).

The Third Party API Service routes messages between PISPs, DFSPs and the Auth Service.


### Auth Service

The Auth Service (auth-svc) is an optional component that validates and stores Consent objects;
representations of the relationship between an end User, a DFSP and a PISP. A Consent object
contains a credential, which is used to validate an authorization for a Third Party Transaction
Request.

When deploying the Third Party API Charts, the Auth-Service is _enabled_ by default.

### Consent Oracle

When a Consent is created by a DFSP, we use the Account Lookup Service to store the `fspId` of the
_owner_ of the Consent object, either the id of the Auth-Service who registered it, or if an Auth
Service is not being used by a DFSP, then the id of the DFSP who issued the Consent.

The Consent oracle stores the relationship between a `consentId` and an `fspId`.

## Deploying the 3P-API

In addition to enabling the above charts, a few options must be configured to allow 3P-API
support when you deploy Mojaloop.

For the `mojaloop/mojaloop` helm chart, enable the following in your `values.yaml`:

```yaml
... 
account-lookup-service:
  account-lookup-service:
    config:
      featureEnableExtendedPartyIdType: true # allows the ALS to support newer THIRD_PARTY_LINK PartyIdType

  account-lookup-service-admin:
    config:
      featureEnableExtendedPartyIdType: true # allows the ALS to support newer THIRD_PARTY_LINK PartyIdType
```

And run the following from the `/thirdparty` directory

```bash
# install the example dependencies for the thirdparty charts
# skip these steps if you want to deploy them yourself
cd chart-auth-svc
kubectl apply -f ./example_dependencies.yaml
cd ../chart-consent-oracle
kubectl apply -f ./example_dependencies.yaml

# install as a standalone chart, alongside Mojaloop
helm upgrade --install thirdparty mojaloop/thirdparty --values ./values.yaml
```

You could also install the thirdparty charts _with_ a mojaloop deployment by configuring the following 
in your master `values.yaml`:

```yaml
...
thirdparty:
  enabled: true
  ...

```

## Validating and testing the 3P-API

Coming Soon! We are still working on integrating the thirdparty-simulators and thirdparty-scheme-adapter into
their own charts to allow you to easily test your 3P-API deployment.