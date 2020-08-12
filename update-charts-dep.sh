#!/usr/bin/env bash

#
# Script to update all Helm Chart Dependencies
#

set -eux

trap 'echo "Dep update failed...exiting. Please fix me!"' ERR

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf
find ./ -name "tmpcharts"| xargs rm -Rf

declare -a charts=(
    eventstreamprocessor
    monitoring/promfana
    monitoring/efk
    account-lookup-service
    als-oracle-pathfinder
    centralkms
    forensicloggingsidecar
    centralledger
    centralenduserregistry
    centralsettlement
    ml-api-adapter
    quoting-service
    finance-portal
    finance-portal-settlement-management
    transaction-requests-service
    emailnotifier
    centraleventprocessor
    central
    bulk-centralledger
    bulk-api-adapter
    mojaloop-bulk
    mojaloop-simulator
    mojaloop
)

echo "Updating all Charts..."
for chart in "${charts[@]}"
do
    helm dep up "$chart"
done

set +x

echo "\
Chart updates completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
