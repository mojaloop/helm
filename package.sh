#!/bin/bash

LOCAL_HELM_MOJALOOP_REPO_URI=${HELM_MOJALOOP_REPO_URI:-'https://docs.mojaloop.io/helm/repo'}

#
# Script to Package all charts, and created an index.yaml in ./repo directory
#

# Function to check the last command's result exited with a value of 0, otherwise the script will exit with a 1
function checkCommandResult () {
    if [ $? -eq 0 ]; then
        echo ""
    else
        echo "Command failed...exiting. Please fix me!";
        exit 1
    fi
}

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf

mkdir ./repo

echo "Updating Event Stream Processor..."
helm package -u -d ./repo ./eventstreamprocessor
checkCommandResult

echo "Packaging Simulator..."
helm package -u -d ./repo ./simulator
checkCommandResult

echo "Packaging Promfana..."
helm package -u -d ./repo ./monitoring/promfana
checkCommandResult

echo "Packaging EFK..."
helm package -u -d ./repo ./monitoring/efk
checkCommandResult

echo "Packaging Account Lookup Service..."
helm package -u -d ./repo  ./account-lookup-service
checkCommandResult

echo "Packaging ALS Oracle Pathfinder..."
helm package -u -d ./repo  ./als-oracle-pathfinder
checkCommandResult

echo "Packaging Central-KMS..."
helm package -u -d ./repo ./centralkms
checkCommandResult

echo "Packaging Forensic Logging Sidecar..."
helm package -u -d ./repo ./forensicloggingsidecar
checkCommandResult

echo "Packaging Central-Ledger..."
helm package -u -d ./repo ./centralledger
checkCommandResult


echo "Packaging Central-End-User-Registry..."
helm package -u -d ./repo ./centralenduserregistry
checkCommandResult

echo "Packaging Central-Settlement..."
helm package -u -d ./repo ./centralsettlement
checkCommandResult

echo "Packaging Email Notifier..."
helm package -u -d ./repo ./emailnotifier
checkCommandResult

echo "Packaging Central Event Processor..."
helm package -u -d ./repo ./centraleventprocessor
checkCommandResult

echo "Packaging Central..."
helm package -u -d ./repo ./central
checkCommandResult

echo "Packaging ml-api-adapter..."
helm package -u -d ./repo ./ml-api-adapter
checkCommandResult

echo "Packaging quoting-service..."
helm package -u -d ./repo ./quoting-service
checkCommandResult

echo "Packaging finance-portal..."
helm package -u -d ./repo ./finance-portal
checkCommandResult

echo "Packaging finance-portal-settlement-management..."
helm package -u -d ./repo ./finance-portal-settlement-management
checkCommandResult

echo "Packaging transaction-requests-service..."
helm package -u -d ./repo ./transaction-requests-service
checkCommandResult

echo "Updating bulk-centralledger..."
helm package -u -d ./repo ./bulk-centralledger/
checkCommandResult

echo "Updating bulk-api-adapter..."
helm package -u -d ./repo ./bulk-api-adapter/
checkCommandResult

echo "Updating Mojaloop Bulk..."
helm package -u -d ./repo ./mojaloop-bulk/
checkCommandResult

echo "Packaging Mojaloop..."
helm package -u -d ./repo ./mojaloop
checkCommandResult

echo "Packaging Ingress-Nginx..."
helm package -u -d ./repo ./kube-public/ingress-nginx/
checkCommandResult

echo "Packaging ntpd..."
helm package -u -d ./repo ./kube-system/ntpd/
checkCommandResult

echo "Packaging Mojaloop Simulator..."
helm package -u -d ./repo ./mojaloop-simulator
checkCommandResult

echo "Packaging Mojaloop Testing Toolkit..."
helm package -u -d ./repo ./ml-testing-toolkit
checkCommandResult


cd ./repo

echo "Creating Helm repo index for '$LOCAL_HELM_MOJALOOP_REPO_URI'..."
helm repo index . --url $LOCAL_HELM_MOJALOOP_REPO_URI
checkCommandResult

echo "\
Packaging completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Run the following command to serve a local repository: helm serve --repo-path ./repo \n \
\n \
Happy Helming!
"
