# Third Party API Service (v2.0)

The `tpp-api-svc` service is an asynchronous pass-through Third Party API service for PISP use-cases, implementing the Mojaloop Third Party API for the Mojaloop 2.0 Reference Architecture.

It is stateless, and routes requests between DFSPs, PISPs and Auth-Svc components.

## Dependencies

- auth-svc
- consent-oracle

> Note: this dependency list has not been confirmed by the Mojaloop maintainers on issue #4517 — kept consistent with the v1.0 service for now.
