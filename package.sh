#!/bin/bash 
 
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

echo "Packaging Central-KMS..." 
helm package -u -d ./repo ./centralkms 
checkCommandResult 
 
echo "Packaging Forensic Logging Sidecar..." 
helm package -u -d ./repo ./forensicloggingsidecar 
checkCommandResult 
 
echo "Packaging Central-Ledger..." 
helm package -u -d ./repo ./centralledger 
checkCommandResult 
 
echo "Packaging Central Hub..." 
helm package -u -d ./repo ./centralhub 
checkCommandResult 
 
echo "Packaging Mock Pathfinder..." 
helm package -u -d ./repo ./mockpathfinder 
checkCommandResult 
 
echo "Packaging Central-End-User-Registry..." 
helm package -u -d ./repo ./centralenduserregistry 
checkCommandResult 
 
echo "Packaging Central-Directory..."
helm package -u -d ./repo ./centraldirectory
checkCommandResult

echo "Packaging Central-Settlement..."
helm package -u -d ./repo ./centralsettlement
checkCommandResult

echo "Packaging Email Notifier..." 
helm package -u -d ./repo ./emailnotifier 
checkCommandResult

echo "Packaging Central..." 
helm package -u -d ./repo ./central 
checkCommandResult

echo "Packaging interop-switch..."
helm package -u -d ./repo ./interop-switch
checkCommandResult

echo "Packaging ml-api-adapter..."
helm package -u -d ./repo ./ml-api-adapter
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

cd ./repo
 
echo "Creating Helm repo index..." 
helm repo index . --url http://mojaloop.io/helm/repo 
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
