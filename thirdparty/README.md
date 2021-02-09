# helm/thirdparty

Charts to enable Thirdparty APIs


> Note:  
> At the moment, these components are not bundled with the Mojaloop helm chart
> but instead are published to be isntalled alongside the existing Mojalooop  
> helm charts

## Installing this chart helm repo

```bash
cd thirdparty
# install the databases separately
kubectl apply -f ./thirdparty_deployment_base.yaml

# install the chart
helm upgrade install thirdparty mojaloop/thirdparty
```


## Installing this chart from source

```bash
cd thirdparty
# install the databases separately
kubectl apply -f ./thirdparty_deployment_base.yaml

# install the chart
helm upgrade --install thirdparty ./
```

## Components

- Account-Lookup-Service (deprecated - functionality will be moved to Thirdparty-API-Adapter)
- Auth-Service
- Endpoint-Registry (ie. central-ledger)
- Oracle-Consent
- Thirdparty-API-Adapter
- Transaction-Requests-Service (deprecated - functionality will be moved to Thirdparty-API-Adapter)


<!-- TODO: Diagram -->