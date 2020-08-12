#!/usr/bin/env bash
#
# Install https://mojaloop.io using its released Helm charts from remote repo.
# Pre-requisits for this script: Working kubectl & helm.
# Initially contributed by Michael http://Vorburger.ch

set -euox pipefail
cd "$(dirname "$0")"

helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo add kiwigrid https://kiwigrid.github.io
helm repo add elastic https://helm.elastic.co

helm repo add mojaloop http://mojaloop.io/helm/repo/

helm repo update

helm --namespace kube-public install stable/nginx-ingress

helm --namespace demo --name moja install mojaloop/mojaloop
