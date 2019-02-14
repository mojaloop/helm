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

3. Deploy Mojaloop componenets

*Warning: This will deploy all charts.*

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo mojaloop`

e.g. `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo mojaloop`

4. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> --repo=http://mojaloop.io/helm/repo ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> --repo=http://mojaloop.io/helm/repo ingress-nginx`

## Local installation with Minikube

This procedure assumes that you have VirtualBox, Minikube, kubectl and helm installed appropriately.

Clean install, in case you had another minikube before. Remember that Minikube is installed in the user's home.

- `minikube stop`
- `minikube delete`
- `rm -rf .kube/`
- `rm -rf .minikube/`
- `rm -rf .helm/`

The memory should be in multiples of 1024

- `minikube start --memory 9216 --cpus 4`

In case you are behind a proxy, pass the environment variables like this:

- `minikube start --docker-env http_proxy=$http_proxy  --docker-env https_proxy=$http_proxy  --docker-env HTTP_PROXY=$http_proxy  --docker-env HTTPS_PROXY=$http_proxy --docker-env no_proxy=192.168.99.0/24 --docker-env NO_PROXY=192.168.99.0/24 --memory 9216 --cpus 4`

To see the pods status, once they are created proceed with:

- `kubectl get po --all-namespaces`

 It's very likely that the dashboard will throw an error (at least on binaries from GNU/Linux), for that matter do:

- `kubectl create clusterrolebinding kube-system-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default`

Now we install Tiller

- `helm init`

Generally the embedded ingress is disabled, better to leave it that way. In case is enable, disable it with:

- `minikube addons disable ingress`

Finally we install the Mojaloop

- `helm install --debug --namespace=mojaloop --name=dev --repo=http://mojaloop.io/helm/repo mojaloop`

Then we install the Ingress from the Mojaloop project with the rbac.create flag
Here the release name I put "moja" arbitrarily, special attention on this with permissions below

- `helm install --debug --namespace=kube-public --name=moja --repo=http://mojaloop.io/helm/repo ingress-nginx --set rbac.create=true`

Now some permissions in order to Ingress run successfully 

- `kubectl -n kube-public create sa nginx-ingress-controller`
- `kubectl apply -f https://gist.githubusercontent.com/bdfintechpy/c816077cefd7fa938e453d8d97afb65b/raw/8ef6d0623e9273aa93f22ab2b5d5cbb40502a5aa/nginx-ingress-controller-clusterrole.yaml`
- `kubectl -n kube-public apply -f https://gist.githubusercontent.com/bdfintechpy/25793f9dd8fb7545d4a5a5bd268d8a7f/raw/421d2032e4a36577739b60c0e673e889c1d1c6e2/nginx-ingress-controller-role.yaml`
- `kubectl -n kube-public create rolebinding nginx-ingress-controller --role=nginx-ingress-controller --serviceaccount=kube-public:nginx-ingress-controller`
- `kubectl create clusterrolebinding nginx-ingress-controller --clusterrole=nginx-ingress-controller --serviceaccount=kube-public:nginx-ingress-controller`
- `kubectl -n kube-public patch rc/moja-ingress-nginx-controller -p '{"spec": {"template": {"spec": {"serviceAccountName": "nginx-ingress-controller"}}}}'`

We re-create the ingress pod

- `kubectl -n kube-public delete po -l app=moja-ingress-nginx-controller`

Wait a while, and everything should be running

- `kubectl get po --all-namespaces`

You might want to have access to the interop-switch, you can go through ingress or directly to the interop-switch changing his type ClusterIP to NodePort, with: 

- `kubectl edit svc dev-interop-switch --namespace=mojaloop`

Show the port assigned to the service

- `minikube service list`

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
- `helm dep up centralsettlement`
- `helm dep up central`
- `helm dep up ml-api-adapter`
- `helm dep up interop-switch`
- `helm dep up mojaloop`

We are quitely waiting on recursive updates: https://github.com/kubernetes/helm/issues/2247

Alternatively please use the helper script `sh ./update-charts-dep.sh`. 

This script will ensure the correct order is maintained.

## Deployment from Source

1. Deploy specific chart

- `helm install --debug --namespace=<namespace> --name=<release-name> <chart_directory>`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./centralledger`

2. Deploy mojaloop componenets

*Warning: This will deploy all charts.*

- `helm install --debug --namespace=<namespace> --name=<release-name> ./mojaloop`

e.g. `helm install --debug --namespace=mojaloop --name=dev ./mojaloop`

3. Deploy Ingress

- `helm install --debug --namespace=<namespace> --name=<release-name> ./kube-public/ingress-nginx`

e.g. `helm install --debug --namespace=kube-public --name=<release-name> ./kube-public/ingress-nginx`

## Upgrading Deployments from Source

`helm upgrade --debug <release-name> <chart_directory>`

e.g. `helm upgrade --debug dev ./centralenduserregistry/`

## Testing Deployments

1. Add the following to your hosts file and ensure you have installed Ingress Controller on your Kubernetes Cluster:

`<ip-of-k8s-node-ingress> interop-switch.local central-kms.local forensic-logging-sidecar.local central-ledger.local central-end-user-registry.local central-directory.local central-hub.local central-settlement.local ml-api-adapter.local`

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

Package all charts, and created an index.yaml in ./repo directory

`sh package.sh`

## Monitoring Mojaloop

Refer to [Monitoring Documentation](./monitoring/README.md)
