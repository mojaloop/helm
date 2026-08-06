# Consent-Oracle

Consent-Oracle is an Oracle for the Account Lookup Service.

When a Consent is verified by the Auth-Svc or a DFSP, it
sends a `POST /participants/CONSENT/{ID}` to the ALS to
store the 'authoritative source' of the Consent.

## Dependencies

This chart has the following dependencies:
- mysql

See `example_dependencies.yaml` for a simple example of installing and using the chart
with base dependencies.