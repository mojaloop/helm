# Mojaloop Helm Charts

Mojaloop published Helm Repo: http://mojaloop.io/helm/repo/

Refer to Helm docs for more information: https://docs.helm.sh/

## Deployment from Repo

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo <chart_name>`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo centralledger`

2. Deploy specific chart overriding values

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo -f <values_file> <chart_name>`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo -f ./values.yaml centralledger`

Refer to the following default chart config file for values: http://mojaloop.io/helm/<chart_name>/values.yaml

3. Deploy ALL Central componenets

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo central`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo central`

4. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> --repo=http://mojaloop.io/helm/repo ingress-nginx`

## Upgrading Deployments from Repo

`helm upgrade --debug <release-name> --repo=http://mojaloop.io/helm/repo <chart_name>`

e.g. `helm upgrade --debug dev --repo=http://mojaloop.io/helm/repo centralenduserregistry`

## Update Chart Dependencies for Source

Note: Please ensure that you update the Chart dependencies in the order show below.

- `helm dep up centralkms`
- `helm dep up forensicloggingsidecar`
- `helm dep up centralledger`
- `helm dep up centralhub`
- `helm dep up mockpathfinder`
- `helm dep up centralenduserregistry`
- `helm dep up centraldirectory`
- `helm dep up central`

We are quitely waiting on recursive updates: https://github.com/kubernetes/helm/issues/2247

Alternatively please use the helper script `sh ./update-charts-dep.sh`. 

This script will ensure the correct order is maintained.

## Deployment from Source

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> <chart_directory>`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./centralledger`

2. Deploy ALL Central componenets

- `helm install --debug --namespace=<namespace> --name=<release-name> ./central`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./central`

3. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> ./kube-public/ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> ./kube-public/ingress-nginx`

## Upgrading Deployments from Source

`helm upgrade --debug <release-name> <chart_directory>`

e.g. `helm upgrade --debug dev ./centralenduserregistry/`

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

e.g. `helm del --purge dev`

## Debugging Charts

1. Execute a dry-run to display all the Kubernetes deployment files

 `helm install --dry-run --debug --namespace=<namespace> --name=<release-name> <chart_directory>`

2. Use Helm Linter to check for any issues

`helm lint --strict <chart_directory>`

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

### Package
1.) Package charts

<<<<<<< HEAD
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
   
12. Switch to develop branch
    git checkout -b origin/develop
    git pull origin develop

13. Update all dependencies

    `sh ./update-chars-dep.sh`

### Deploy Ingress
14. Deploy Ingress Nginx via Helm

    `helm install --namespace=kube-public --name=minikube -f ./config-ingress.yaml ./kube-public/ingress-nginx`

### Deploy Central

14. Deploy Central via Helm

    `helm install --namespace=mojaloop --name=dev -f ./config-central.yaml ./central`

### Test Deplyoments

`sh package.sh`
