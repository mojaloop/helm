#!/usr/bin/env bash

#
# Script to Render all charts
#

echo "Render all Charts..."

set -eo pipefail

trap 'echo "Command failed...exiting. Please fix me!"' ERR

rm -rf test
mkdir test

if [ "$1" ]; then
    declare -a charts=("$1")
else
    declare -a charts=(
        example-mojaloop-backend
        ml-testing-toolkit
        ml-testing-toolkit-cli
        sdk-scheme-adapter/chart-service
        sdk-scheme-adapter
        mojaloop-ttk-simulators/chart-sim1
        mojaloop-ttk-simulators/chart-sim2
        mojaloop-ttk-simulators/chart-sim3
        mojaloop-ttk-simulators
        eventstreamprocessor
        simulator
        # monitoring/promfana - Disabled linting due to outdated versions
        # monitoring/efk - Disabled linting due to outdated versions
        account-lookup-service
        als-oracle-pathfinder
        als-msisdn-oracle
        als-static-oracle
        # centralkms # Deprecated - No longer supported
        # forensicloggingsidecar # Deprecated - No longer supported
        centralledger
        # centralenduserregistry # Deprecated - No longer supported
        centralsettlement
        emailnotifier
        centraleventprocessor
        ml-api-adapter
        quoting-service
        # finance-portal # Deprecated - No longer supported
        # finance-portal-settlement-management # Deprecated - No longer supported
        transaction-requests-service
        bulk-centralledger/
        bulk-api-adapter/
        mojaloop-bulk/
        mojaloop-simulator
        mojaloop
        # kube-system/ntpd/ # Deprecated - No longer supported
        ml-operator
        thirdparty/chart-auth-svc
        thirdparty/chart-consent-oracle
        thirdparty/chart-tp-api-svc
        inter-scheme-proxy-adapter
    )
fi

for chart in "${charts[@]}"
do
    echo "---=== Rendering $chart ===---"
    helm template --api-versions apps/v1/Deployment --api-versions batch/v1 $chart | yq -s '"test/'$chart'/" + .kind + "-" + .metadata.name'
done

