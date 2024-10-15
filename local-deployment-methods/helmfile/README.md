
## Helmfile

### Install helmfile

https://github.com/helmfile/helmfile#installation

### Install Mojaloop

```
cd local-deployment-methods/helmfile
sh update-charts-dep.sh
helmfile apply
```

## K3D

### Install and create K3D cluster

```
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d cluster create --k3s-arg "--no-deploy=traefik@server:*" mycluster
kubectl get nodes
```

```
k3d cluster create --api-port 6550 -p "80:80@loadbalancer" --agents 2
export KUBECONFIG="$(k3d kubeconfig write k3s-default)"

```

### Deploy ingress controller

https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

```
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```
Or
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.43.0/deploy/static/provider/baremetal/deploy.yaml
```

## Microk8s

brew install ubuntu/microk8s/microk8s

microk8s install --channel=1.29/edge

microk8s enable ingress


## Minikube

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube
minikube start
minikube addons enable ingress

## Vagrant
brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant

brew cask install virtualbox

## Docker desktop MacOS

helm upgrade --install ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--namespace ingress-nginx --create-namespace

