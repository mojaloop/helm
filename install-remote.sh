#!/usr/bin/env bash
#
# Install https://mojaloop.io using its released Helm charts from remote repo.
# Pre-requisits for this script: Working kubectl & helm.
# Initially contributed by Michael http://Vorburger.ch

## Ensure that you are using Helm v3

set -euox pipefail
cd "$(dirname "$0")"

# Grab available helm version
HELM_CHECK=$(helm version --short)

# ## Add dependency repos
helm repo add stable https://charts.helm.sh/stable
helm repo add incubator https://charts.helm.sh/incubator
helm repo add kiwigrid https://kiwigrid.github.io
helm repo add kokuwa https://kokuwaio.github.io/helm-charts
helm repo add elastic https://helm.elastic.co
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add codecentric https://codecentric.github.io/helm-charts

# ## Add Mojaloop repo
helm repo add mojaloop http://mojaloop.io/helm/repo/

# ## Update all repos
helm repo update


if [[ $HELM_CHECK =~ ^.*v3.*$ ]]; then # was Helm v3 found?
    echo "Install Remote script processing with Helm v3 version: $HELM_CHECK"

    # ## Install Nginx Ingress-Controller
    helm --namespace kube-public install stable/nginx-ingress

    # ## Install Mojaloop
    helm --namespace demo install moja mojaloop/mojaloop
else # We must assume Helm v2 is installed
    echo "Install Remote script processing with Helm v2 version: $HELM_CHECK"

    # ## Install Nginx Ingress-Controller
    helm --namespace kube-public install stable/nginx-ingress

    # ## Install Mojaloop
    helm --namespace demo install --name moja mojaloop/mojaloop
fi
