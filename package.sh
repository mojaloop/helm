#!/usr/bin/env bash

set -ex

LOCAL_HELM_MOJALOOP_REPO_URI=${HELM_MOJALOOP_REPO_URI:-'https://docs.mojaloop.io/helm/repo'}

#
# Script to Package all charts, and create an index.yaml in ./repo directory
#

trap 'echo "Command failed...exiting. Please fix me!"' ERR

echo "Removing old charts..."
find ./ -name "charts"| xargs rm -Rf

mkdir -p ./repo

declare -a charts=(
    eventstreamprocessor
    simulator
    monitoring/promfana
    monitoring/efk
    account-lookup-service
    als-oracle-pathfinder
    centralkms
    forensicloggingsidecar
    centralledger
    centralenduserregistry
    centralsettlement
    emailnotifier
    centraleventprocessor
    central
    ml-api-adapter
    quoting-service
    finance-portal
    finance-portal-settlement-management
    transaction-requests-service
    bulk-centralledger/
    bulk-api-adapter/
    mojaloop-bulk/
    mojaloop
    kube-public/ingress-nginx/
    kube-system/ntpd/
    mojaloop-simulator
    ml-testing-toolkit
)

for chart in "${charts[@]}"
do
    if [ -z $BUILD_NUM ] || [ -z $GIT_SHA1 ]; then # we're most likely not running in CI
        # Probably running on someone's machine
        helm package -u -d ./repo "$chart"
    elif [ -z $GITHUB_TAG ]; then # we're probably running in CI, but this is not a job triggered by a tag
        set -u
        # When $GITHUB_TAG is not present, we'll build a development version. This versioning
        # scheme, utilising the incrementing "BUILD_NUM" means users can request the latest
        # development version using the --devel argument to `helm upgrade` or `helm install`.
        # Development versions can be found with `helm search --devel`. Additionally, it is
        # possible to specify a development version in requirements.yaml.
        CURRENT_VERSION=$(grep '^version: [0-9]\+\.[0-9]\+\.[0-9]\+\s*$' "$chart/Chart.yaml" | cut -d' ' -f2)
        NEW_VERSION="$CURRENT_VERSION-$BUILD_NUM.$GIT_SHA1"
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

echo "\
Packaging completed.\n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Run the following command to serve a local repository: helm serve --repo-path ./repo \n \
\n \
Happy Helming!
"
