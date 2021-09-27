# Thirdparty API Service

The Thirdparty API Service is a service that implements the [Mojaloop Thirdparty API]((https://github.com/mojaloop/mojaloop-specification/tree/master/thirdparty-api)).

It is stateless, and routes requests between DFSPs, PISPs and Auth-Svc components.

## Dependencies

- admin-api-svc (previously known as central-ledger/Admin API)
- participant-list-service - service that implements `GET /services/{Type}` Thirdparty API

## Participant List Service 

The [Mojaloop 3P API Specification](https://github.com/mojaloop/mojaloop-specification/tree/master/thirdparty-api) includes a new resource, `/services/{Type}`, where Participants can look up other 
participants based on their role on a switch.

For 3P-API v1.0, we implemented the Services lookup using a dedicated instance of the Mojaloop
testing toolkit [`ml-testing-toolkit](../ml-testing-toolkit) which provides a simple mock for the `/services` resource.

Future implementations will implement this endpoint with more features, such as the ability for 
hub operators to add and remove services to this list, or additional service `Type`s.