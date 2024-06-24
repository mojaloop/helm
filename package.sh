#!/usr/bin/env bash

set -e

LOCAL_HELM_MOJALOOP_REPO_URI=${HELM_MOJALOOP_REPO_URI:-'https://mojaloop.github.io/helm/repo'}

#
# Script to Package all charts, and create an index.yaml in ./repo directory
#

trap 'echo "Command failed...exiting. Please fix me!"' ERR

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf

mkdir -p ./repo

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
        monitoring/promfana
        monitoring/efk
        account-lookup-service
        als-oracle-pathfinder
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
        thirdparty/chart-auth-svc
        thirdparty/chart-consent-oracle
        thirdparty/chart-tp-api-svc
        thirdparty
        mojaloop
        kube-system/ntpd/
        ml-operator
    )
fi

for chart in "${charts[@]}"
do
    if [ -z $BUILD_NUM ] || [ -z $GIT_SHA1 ]; then # we're most likely not running in CI
        # Probably running on someone's machine
        helm package -u -d ./repo "$chart"
    elif [ -z $GITHUB_TAG ] || [[ $GITHUB_TAG == *"snapshot"* ]]; then # we're probably running in CI, but this is not a job triggered by a tag or it's a snapshot release
        set -u
        # When $GITHUB_TAG is not present, we'll build a development version. This versioning
        # scheme, utilising the incrementing "BUILD_NUM" means users can request the latest
        # development version using the --devel argument to `helm upgrade` or `helm install`.
        # Development versions can be found with `helm search --devel`. Additionally, it is
        # possible to specify a development version in requirements.yaml.
        CURRENT_VERSION=$(grep '^version: [0-9]\+\.[0-9]\+\.[0-9]\+\s*$' "$chart/Chart.yaml" | cut -d' ' -f2)
        NEW_VERSION="$CURRENT_VERSION-$BUILD_NUM-${GIT_SHA1:0:7}"
        helm package -u -d ./repo "$chart" --version="$NEW_VERSION"
        set +u
    else # we're probably running in CI, this is a job triggered by a tag/release
        # When $GITHUB_TAG is present, we're actually releasing the chart- so we won't modify any
        # versions
        helm package -u -d ./repo "$chart"
    fi
done

cd ./repo

helm repo index . --url $LOCAL_HELM_MOJALOOP_REPO_URI

set +x

echo -e "\
 Packaging completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Run the following command to serve a local repository: helm serve --repo-path ./repo \n \
\n \
Happy Helming!
"
