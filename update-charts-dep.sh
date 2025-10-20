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
    example-mojaloop-backend
    ml-operator
    simulator
    ml-testing-toolkit
    ml-testing-toolkit-cli
    sdk-scheme-adapter/chart-service
    sdk-scheme-adapter
    mojaloop-ttk-simulators/chart-sim1
    mojaloop-ttk-simulators/chart-sim2
    mojaloop-ttk-simulators/chart-sim3
    mojaloop-ttk-simulators
    eventstreamprocessor
    monitoring/promfana
    monitoring/efk
    account-lookup-service
    als-oracle-pathfinder
    als-msisdn-oracle
    centralledger/chart-handler-admin-transfer
    centralledger/chart-handler-timeout
    centralledger/chart-handler-transfer-fulfil
    centralledger/chart-handler-transfer-get
    centralledger/chart-handler-transfer-position
    centralledger/chart-handler-transfer-position-batch
    centralledger/chart-handler-transfer-prepare
    centralledger/chart-service
    centralledger
    centralsettlement
    ml-api-adapter
    quoting-service
    transaction-requests-service
    emailnotifier
    centraleventprocessor
    bulk-centralledger
    bulk-api-adapter
    mojaloop-bulk
    mojaloop-simulator
    thirdparty/chart-auth-svc
    thirdparty/chart-consent-oracle
    thirdparty/chart-tp-api-svc
    thirdparty
    merchant-registry-svc
    inter-scheme-proxy-adapter
    merchant-registry-svc
    connection-manager
    mojaloop
)

echo "Updating all Charts..."
for chart in "${charts[@]}"
do
    echo "---=== Updating $chart ===---"
    helm dep up "$chart" --skip-refresh
done

set +x

echo "\
Chart updates completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
