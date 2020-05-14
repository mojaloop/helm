#!/usr/bin/env bash

#
# Script to update all Helm Chart Dependencies
#

echo "Updating all Charts..."

# Function to check the last command's result exited with a value of 0, otherwise the script will exit with a 1
function checkCommandResult () {
    if [ $? -eq 0 ]; then
        echo ""
    else
        echo "Dep update failed...exiting. Please fix me!";
        exit 1
    fi
}

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf
find ./ -name "tmpcharts"| xargs rm -Rf

## Disabled as Simulator has no requirements at this time
#echo "Updating Simulator..."
#helm dep up ./simulator
#checkCommandResult

echo "Updating Event Stream Processor..."
helm dep up ./eventstreamprocessor
checkCommandResult

echo "Updating Promfana..."
helm dep up ./monitoring/promfana
checkCommandResult

echo "Updating EFK..."
helm dep up ./monitoring/efk
checkCommandResult

echo "Updating Account Lookup Service..."
helm dep up ./account-lookup-service
checkCommandResult

echo "Updating ALS Oracle Pathfinder..."
helm dep up ./als-oracle-pathfinder
checkCommandResult

echo "Updating Central-KMS..."
helm dep up ./centralkms
checkCommandResult

echo "Updating Forensic Logging Sidecar..."
helm dep up ./forensicloggingsidecar
checkCommandResult

echo "Updating Central-Ledger..."
helm dep up ./centralledger
checkCommandResult

echo "Updating Central-End-User-Registry..."
helm dep up ./centralenduserregistry
checkCommandResult

echo "Updating Central-Settlement..."
helm dep up ./centralsettlement
checkCommandResult

echo "Updating ml-api-adapter..."
helm dep up ./ml-api-adapter
checkCommandResult

echo "Updating quoting-service..."
helm dep up ./quoting-service
checkCommandResult

echo "Updating finance-portal..."
helm dep up ./finance-portal
checkCommandResult

echo "Updating finance-portal-settlement-management..."
helm dep up ./finance-portal-settlement-management
checkCommandResult

echo "Updating transaction-request-service..."
helm dep up ./transaction-requests-service
checkCommandResult

echo "Updating Email Notifier..."
helm dep up ./emailnotifier
checkCommandResult

echo "Central Event Processor..."
helm dep up ./centraleventprocessor
checkCommandResult

echo "Updating Central..."
helm dep up ./central
checkCommandResult

echo "Updating bulk-centralledger..."
helm dep up ./bulk-centralledger/
checkCommandResult

echo "Updating bulk-api-adapter..."
helm dep up ./bulk-api-adapter/
checkCommandResult

echo "Updating Mojaloop Bulk..."
helm dep up ./mojaloop-bulk
checkCommandResult

echo "Updating Mojaloop..."
helm dep up ./mojaloop
checkCommandResult

echo "Updating Mojaloop Simulator..."
helm dep up ./mojaloop-simulator
checkCommandResult

echo "\
Chart updates completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
