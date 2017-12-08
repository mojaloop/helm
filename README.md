# Mojaloop Helm Charts

Refer to Helm docs for more information: https://docs.helm.sh/

## Update Chart Dependencies

- `helm dep up central`
- `helm dep up centraldirectory`
- `helm dep up centralenduserregistry`
- `helm dep up centralhub`
- `helm dep up centralkms`
- `helm dep up centralledger`
- `helm dep up forensicloggingsidecar`
- `helm dep up mockpathfinder`

Useful command to execute a dep update against all the directories: `find . -mindepth 1 -maxdepth 1 -type d -exec helm dep up {} \;`

We are quitely waiting on recursive updates: https://github.com/kubernetes/helm/issues/2247

## Deployment

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> <chart-directory>`

e.g. `helm install --debug --namespace=test --name=r1 ./centralledger`

2. Deploy ALL Central componenets

- `helm install --debug --namespace=<namespace> --name=<release-name> ./central`

e.g. `helm install --debug --namespace=test --name=r1 ./central`

3. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> ./kube-public/ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> ./kube-public/ingress-nginx`

## Upgrading Deployments

`helm upgrade --debug <release-name> <chart-directory>`

e.g. `helm upgrade --debug r1 ./centralenduserregistry/`

## Testing Deployments

1. Add the following to your hosts file and ensure you have installed Ingress Controller on your Kubernetes Cluster:

`<ip-of-k8s-node-ingress> central-kms.local forensic-logging-sidecar.local central-ledger.local central-end-user-registry.local central-directory.local central-hub.local`

If your running Minikube, you can use the following cmd to discover your `<ip-of-k8s-node-ingress>`: 

`minikube ip`


2. Curl Health End-points for Central Ledger
http://central-ledger.local/admin/accounts

`curl http://central-ledger.local/health`

`curl http://central-ledger.local/admin/health`

Expected output:

`{"status":"OK"}`

3. Confirm Central Ledger DB Connectivity

`curl http://central-ledger.local/admin/accounts`

Expected output:

`[{"name":"LedgerName","id":"central-ledger.local/accounts/LedgerName","created":"2017-12-06T20:57:05.760Z","is_disabled":false,"_links":{"self":"central-ledger.local/accounts/LedgerName"}}]`

4. Open the Central Management Hub in your browser

http://central-hub.local/members

Check to see that an account name "LedgerName" is displayed

## Removing Deployments

`helm del --purge <release-name>`

e.g. `helm del --purge r1`

## Debugging Charts

1. Execute a dry-run to display all the Kubernetes deployment files

 `helm install --dry-run --debug --namespace=<namespace> --name=<release-name> <chart-directory>`

2. Use Helm Linter to check for any issues

`helm lint --strict <chart-directory>`

## Helper scripts

### Ingress
1.) Deploy Ingress
This will deploy a new Ingress Nginx Controller with TCP and HTTP Ingress

`sh deploy-ingress.sh -r lb -e -o ./config-ingress.yaml`

2.) Undeploy Ingress

`sh clean.sh -r lb -e`

### Central
1.) Deploy Central
This will deploy a new Ingress Nginx Controller with TCP and HTTP Ingress

`sh deploy-central.sh -r dev -e -o ./config-central.yaml`

2.) Undeploy Central

`sh clean.sh -r dev -e`


## Deploy Mojaloop on a local Minikube environment

### Setup local K8s environment
1. Install VirtualBox
    
    Refer to: https://www.virtualbox.org/wiki/Downloads

2. Install Docker
    
    MacOS: `brew install docker`

3. Install Kubectl
    
    MacOS: `brew install kubectl`

4. Install Minikube
    
    MacOS: `brew cask install minikube`

5. Install Helm
    
    MacOS: `brew install kubernetes-helm`

6. Initialise MiniKube
    
    `minikube start`

7. Initialise Helm
    
    `helm init` 

8. Get your Minikube IP address

    `minikube ip`

9. Update your /etc/hosts file with the following entry inserting your minikube IP from the last step

    `<minikube-ip> central-kms.local forensic-logging-sidecar.local central-ledger.local central-end-user-registry.local central-directory.local central-hub.local`

### Setup Helm Charts for deployment

10. Clone Helm repo

    `git clone git@github.com:mojaloop/helm.git`

11. Change to helm repo directory

    `cd helm`
   
12. Update all dependencies

    `sh ./update-chars-dep.sh`

### Deploy Ingress
13. Deploy Ingress Nginx via Helm

    `helm install -namespace=kube-public -name=minikube -f ./config-ingress.yaml ./kube-public/ingress-nginx`

### Deploy Central

14. Deploy Central via Helm

    `helm install -namespace=mojaloop -name=dev -f ./config-central.yaml ./central`

### Test Deplyoments

15. Refer to testing section above.
