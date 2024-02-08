## Merchant Registry Helm Charts Deployment

### Default Ingress DNS (add following records to the `/etc/hosts` file)

-   `<ip-of-k8s-node-ingress>   www.acquirer-merchant.local`

### Prerequisites

-   Kubernetes cluster
-   Helm 3
-   SendGrid API Key (for sending verification emails)

    -   Update the `sendgridApiKey` in the `./chart-acquirer-backend/values.yaml`
    -   Update the `senderEmail` in the `./chart-acquirer-backend/values.yaml`

-   Register for Google reCAPTCHA v2 and Add Ingress Domain
    -   https://www.google.com/recaptcha/admin/create
    -   Update the `./chart-acquirer-backend/values.yaml` file with the following values:
        -   `recaptchaBackendSiteKey`
    -   Update the `./chart-acquirer-frontend/values.yaml` file with the following values:
        -   `recaptchaFrontendSiteKey`

### Deploying the Helm Charts

Note For Production: Recommended to use external Third Party S3 Services (like Amazon S3, Digital Ocean Space etc.) for storing the documents and QR Images instead of the MinIO S3 instance service.
See the [`./chart-acquirer-backend/values.yaml`](./chart-acquirer-backend/values.yaml) for the configuration.

1. Build Dependency Chart

```bash
helm dep up ./
```

2. Install the Helm chart:

```bash
helm install merchant ./ --namespace mojaloop
```

### Registering Merchant Oracle in Account Lookup Service

1. Make sure the `account-lookup-service-admin` is running and accessible.
2. Make sure the `merchant-registry-oracle-clusterip-service` is accessible from the `account-lookup-service-admin` pod.
3. Run the following command to register the merchant oracle with `ALIAS` type:

Replace `<account-lookup-service-admin-ip>` and `<merchant-registry-oracle-clusterip-service>`  with the Cluster IP Addresses.
`kubectl get svc -n mojaloop` can be used to get the Cluster IP Addresses.


```bash
curl -X POST "http://<account-lookup-service-admin-ip>/oracles" \
    -H "accept: application/json" -H "Content-Type: application/json" \
    -d '{
        "oracleIdType": "ALIAS",
        "endpoint": {
          "value": "<merchant-registry-oracle-clusterip-service>:8888",
          "endpointType": "URL"
        },
        "currency": "USD",
        "isDefault": true
      }'
```

4. Verify the registration by running the following command:

```bash
curl -X GET "http://<account-lookup-service-admin-ip>/oracles" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "date: $(date -Ru)"
```

should return the registered oracle.
```json
[
    {
        "oracleId":1,
        "oracleIdType":"ALIAS",
        "endpoint":{
            "value":"10.43.83.251:8888",
            "endpointType":"URL"
        },
        "currency":"USD",
        "isDefault":1
    }
]
```

### IMPORTANT NOTES:

When updating ingress's host make sure to update the `apiUrl` of `./chart-acquirer-frontend/values.yaml` file too.
Otherwise frontend will not be able to communicate with backend.

The system utilize RabbitMQ for message queuing between services and SendGrid for email verification. 
Adopters can substitute these services with their preferred choices for a customized integration.

