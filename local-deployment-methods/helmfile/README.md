
# Helmfile-based Mojaloop Installation

This guide covers the steps to install and manage Mojaloop using **Helmfile**. Helmfile simplifies deploying and managing Helm charts, especially in complex environments with multiple services like Mojaloop.

---

## Prerequisites

- **Kubernetes cluster** (local or cloud-based)
- **Helm** (v3+): [Install Helm](https://helm.sh/docs/intro/install/)
- **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/)
- **Docker**: Required for building and managing images
- **Helmfile**: Installation instructions below
- **helm-diff** plugin: [Install helm-diff](https://github.com/databus23/helm-diff?tab=readme-ov-file#using-helm-plugin-manager--23x)


## Mojaloop Deployment with Helmfile

Follow the below steps assume that you have a Kubernetes cluster up and running.

```
sh update-charts-dep.sh
cd local-deployment-methods/helmfile
helmfile apply
```

## Uninstalling Mojaloop
To remove the Mojaloop deployment, use:
```
helmfile destroy
```
