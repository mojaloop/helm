#!/bin/bash

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

echo "Updating Promfana..."
helm dep up ./monitoring/promfana
checkCommandResult

echo "Updating EFK..."
helm dep up ./monitoring/efk
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

echo "Updating Mock Pathfinder..."
helm dep up ./mockpathfinder
checkCommandResult

echo "Updating Central-End-User-Registry..."
helm dep up ./centralenduserregistry
checkCommandResult

echo "Updating Central-Directory..."
helm dep up ./centraldirectory
checkCommandResult

echo "Updating Central-Settlement..."
helm dep up ./centralsettlement
checkCommandResult

echo "Updating interop-switch..."
helm dep up ./interop-switch
checkCommandResult

echo "Updating ml-api-adapter..."
helm dep up ./ml-api-adapter
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

echo "Updating Mojaloop..."
helm dep up ./mojaloop
checkCommandResult

echo "\
Chart updates completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Happy Helming!
"
