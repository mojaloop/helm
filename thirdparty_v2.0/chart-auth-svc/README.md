# Auth-Svc

The Auth-Svc is a standalone service that validates and storesThirdparty Consent and 
Credential Objects.

It simplifies the Thirdparty API integration for DFSPs by abstracting away common 
functions that a DFSP needs to do relating to and validating Consents and their 
attached credentials using the `POST /consents` HTTP Request.

DFSPs can also use the Auth-Svc to verify a 3rd party transaction with 
`POST /thirdpartyRequests/verifications`, which checks that the stored publicKey for
a credential matches the private key that was used on an end user's device to sign a
transaction.


## Dependencies

This chart has the following dependencies:
- redis
- mysql

See `example_dependencies.yaml` for a simple example of installing and using the chart
with base dependencies.