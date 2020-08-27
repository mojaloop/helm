#!/usr/bin/env bash

#
# Script to Lint all charts
#

echo "Linting all Charts..."

set -ex

LOCAL_HELM_MOJALOOP_REPO_URI=${HELM_MOJALOOP_REPO_URI:-'https://docs.mojaloop.io/helm/repo'}

trap 'echo "Command failed...exiting. Please fix me!"' ERR

declare -a charts=(
    eventstreamprocessor
    simulator
    monitoring/promfana
    monitoring/efk
    account-lookup-service
    als-oracle-pathfinder
    centralkms
    forensicloggingsidecar
    centralledger
    centralenduserregistry
    centralsettlement
    emailnotifier
    centraleventprocessor
    central
    ml-api-adapter
    quoting-service
    finance-portal
    finance-portal-settlement-management
    transaction-requests-service
    bulk-centralledger/
    bulk-api-adapter/
    mojaloop-bulk/
    mojaloop
    kube-public/ingress-nginx/
    kube-system/ntpd/
    mojaloop-simulator
    ml-testing-toolkit
)

echo "\n"

for chart in "${charts[@]}"
do
    echo "Linting $chart - Starting"
    helm lint $chart
done

echo "\
Chart linting completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
