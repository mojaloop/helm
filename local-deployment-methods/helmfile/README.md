
# Helmfile-based Mojaloop Installation

This guide covers the steps to install and manage Mojaloop using **Helmfile**. Helmfile simplifies deploying and managing Helm charts, especially in complex environments with multiple services like Mojaloop.

---

## Prerequisites

- **Kubernetes cluster** (local or cloud-based)
- **Helm** (v3+): [Install Helm](https://helm.sh/docs/intro/install/)
- **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/)
- **Docker**: Required for building and managing images
- **Helmfile**: [Install Helmfile](https://github.com/helmfile/helmfile?tab=readme-ov-file#installation)
- **helm-diff** plugin: [Install helm-diff](https://github.com/databus23/helm-diff?tab=readme-ov-file#using-helm-plugin-manager--23x)


## Mojaloop Deployment with Helmfile

Follow the below steps assume that you have a Kubernetes cluster up and running.

```bash
helm repo add stable https://charts.helm.sh/stable
helm repo add incubator https://charts.helm.sh/incubator
helm repo add kiwigrid https://kiwigrid.github.io
helm repo add kokuwa https://kokuwaio.github.io/helm-charts
helm repo add elastic https://helm.elastic.co
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mojaloop-charts https://mojaloop.github.io/charts/repo 
helm repo add redpanda https://charts.redpanda.com
helm repo add mojaloop https://mojaloop.io/helm/repo

helm repo update

sh update-charts-dep.sh
cd local-deployment-methods/helmfile
helmfile apply
```

## Uninstalling Mojaloop
To remove the Mojaloop deployment, use:
```
helmfile destroy
```
