#!/bin/bash

#
# Script to update all Helm Chart Dependencies
#

echo "Linting all Charts..."

# Function to check the last command's result exited with a value of 0, otherwise the script will exit with a 1
function checkCommandResult () {
    if [ $? -eq 0 ]; then
        echo ""
    else
        echo "lintdate failed...exiting. Please fix me!";
        exit 1
    fi
}

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf
find ./ -name "tmpcharts"| xargs rm -Rf

## Disabled as Simulator has no requirements at this time
#echo "Updating Simulator..."
#helm lint ./simulator
#checkCommandResult

echo "Linting Promfana..."
helm lint ./monitoring/promfana
checkCommandResult

echo "Linting EFK..."
helm lint ./monitoring/efk
checkCommandResult

echo "Linting Account Oracle Service..."
helm lint ./account-oracle-service
checkCommandResult

echo "Linting Account Lookup Service..."
helm lint ./account-lookup-service
checkCommandResult

echo "Linting Central-KMS..."
helm lint ./centralkms
checkCommandResult

echo "Linting Forensic Logging Sidecar..."
helm lint ./forensicloggingsidecar
checkCommandResult

echo "Linting Central-Ledger..."
helm lint ./centralledger
checkCommandResult

echo "Linting Mock Pathfinder..."
helm lint ./mockpathfinder
checkCommandResult

echo "Linting Central-End-User-Registry..."
helm lint ./centralenduserregistry
checkCommandResult

echo "Linting Central-Directory..."
helm lint ./centraldirectory
checkCommandResult

echo "Linting Central-Settlement..."
helm lint ./centralsettlement
checkCommandResult

echo "Linting interop-switch..."
helm lint ./interop-switch
checkCommandResult

echo "Linting ml-api-adapter..."
helm lint ./ml-api-adapter
checkCommandResult

echo "Linting Email Notifier..."
helm lint ./emailnotifier
checkCommandResult

echo "Linting Central Event Processor..."
helm lint ./centraleventprocessor
checkCommandResult

echo "Linting Central..."
helm lint ./central
checkCommandResult

echo "Linting Mojaloop..."
helm lint ./mojaloop
checkCommandResult

echo "\
Chart linting completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
