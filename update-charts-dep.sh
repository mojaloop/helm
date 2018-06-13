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

echo "Updating Central-KMS..."
helm dep up ./centralkms
checkCommandResult

echo "Updating Forensic Logging Sidecar..."
helm dep up ./forensicloggingsidecar
checkCommandResult

echo "Updating Central-Ledger..."
helm dep up ./centralledger
checkCommandResult

echo "Updating Central Hub..."
helm dep up ./centralhub
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

echo "Updating interop-switch..."
helm dep up ./interop-switch
checkCommandResult

echo "Updating ml-api-adapter..."
helm dep up ./ml-api-adapter
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
