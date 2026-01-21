#!/usr/bin/env bash
set -euo pipefail
set +x

# ------------------------------------------------------------------------------
# Setup GPG
# ------------------------------------------------------------------------------
echo ">>> Setting up GPG..."

mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

# Import secret key
echo "$GPG_SECRET_KEY" | base64 -d > ~/.gnupg/secring.gpg

# Import public key
echo "$GPG_PUBLIC_KEY" | base64 -d > ~/.gnupg/pubring.gpg

# --- Extract key UID (email) ---
KEY_UID=$(gpg --list-secret-keys --with-colons | awk -F: '/^uid:/ {print $10; exit}')
if [[ -z "$KEY_UID" ]]; then
  echo "No UID found in secret key!"
  exit 1
fi
echo "Using GPG key: $KEY_UID"

# Save passphrase
echo "$GPG_PASSPHRASE" > ./passphrase.txt
chmod 600 ./passphrase.txt

# ------------------------------------------------------------------------------
# Helm repo setup
# ------------------------------------------------------------------------------
LOCAL_HELM_MOJALOOP_REPO_URI=${HELM_MOJALOOP_REPO_URI:-'https://mojaloop.github.io/helm/repo'}

#
# Script to Package all charts, and create an index.yaml in ./repo directory
#

trap 'echo "Command failed...exiting. Please fix me!"' ERR

echo ">>> Removing old charts..."
find ./ -name "charts" | xargs rm -Rf || true

mkdir -p ./repo

if [ -n "${1:-}" ]; then
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
        als-msisdn-oracle
        als-static-oracle
        centralledger/chart-handler-admin-transfer
        centralledger/chart-handler-timeout
        centralledger/chart-handler-transfer-fulfil
        centralledger/chart-handler-transfer-get
        centralledger/chart-handler-transfer-position
        centralledger/chart-handler-transfer-position-batch
        centralledger/chart-handler-transfer-prepare
        centralledger/chart-service
        centralledger
        centralsettlement/chart-service
        centralsettlement
        connection-manager
        emailnotifier
        centraleventprocessor
        ml-api-adapter
        quoting-service
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
        merchant-registry-svc
        ml-operator
        inter-scheme-proxy-adapter
        ory-services
    )
fi

# ------------------------------------------------------------------------------
# Package and Sign Charts
# ------------------------------------------------------------------------------
for chart in "${charts[@]}"; do
    echo ">>> Packaging chart: $chart"

    if [ -z "${BUILD_NUM:-}" ] || [ -z "${GIT_SHA1:-}" ]; then
        # Probably running on someone's machine
        helm package --sign \
            --key "$KEY_UID" \
            --keyring ~/.gnupg/secring.gpg \
            --passphrase-file ./passphrase.txt \
            -u -d ./repo "$chart"

    elif [[ -z "${GITHUB_TAG:-}" && ${CIRCLE_BRANCH:-} =~ ^(major|minor|patch)/(.*)$ ]]; then
        set -u
        # Build a pre-relase version from pre-relase branches major/name, minor/name, patch/name
        # Can be used with helm upgrade --version '>=x.x.x-name.0 <x.x.x-name.999999' to avoid picking
        # unintended versions from multiple active branches doing snapshot releases        
        CURRENT_VERSION=$(grep '^version: [0-9]\+\.[0-9]\+\.[0-9]\+$' "$chart/Chart.yaml" | cut -d' ' -f2)
        NEW_VERSION=$(echo "${CURRENT_VERSION}" | awk -F. -v OFS=. '{$NF += 1 ; print}')-${BASH_REMATCH[2]}.${CIRCLE_BUILD_NUM}
        helm package --sign \
            --key "$KEY_UID" \
            --keyring ~/.gnupg/secring.gpg \
            --passphrase-file ./passphrase.txt \
            -u -d ./repo "$chart" --version="$NEW_VERSION"
        set +u

    elif [ -z "${GITHUB_TAG:-}" ] || [[ ${GITHUB_TAG:-} == *"snapshot"* ]]; then
        set -u
        # When $GITHUB_TAG is not present, we'll build a development version. This versioning
        # scheme, utilising the incrementing "BUILD_NUM" means users can request the latest
        # development version using the --devel argument to `helm upgrade` or `helm install`.
        # Development versions can be found with `helm search --devel`. Additionally, it is
        # possible to specify a development version in requirements.yaml.        
        CURRENT_VERSION=$(grep '^version: [0-9]\+\.[0-9]\+\.[0-9]\+$' "$chart/Chart.yaml" | cut -d' ' -f2)
        NEW_VERSION="$CURRENT_VERSION-$BUILD_NUM-${GIT_SHA1:0:7}"
        helm package --sign \
            --key "$KEY_UID" \
            --keyring ~/.gnupg/secring.gpg \
            --passphrase-file ./passphrase.txt \
            -u -d ./repo "$chart" --version="$NEW_VERSION"
        set +u
    else # we're probably running in CI, this is a job triggered by a tag/release
        # When $GITHUB_TAG is present, we're actually releasing the chart- so we won't modify any
        # versions
        helm package --sign \
            --key "$KEY_UID" \
            --keyring ~/.gnupg/secring.gpg \
            --passphrase-file ./passphrase.txt \
            -u -d ./repo "$chart"
    fi
done

# ------------------------------------------------------------------------------
# Helm repo index
# ------------------------------------------------------------------------------
cd ./repo
helm repo index . --url "$LOCAL_HELM_MOJALOOP_REPO_URI"

# Export public key for consumers
gpg --export "$KEY_UID" > ./moja-helm-pubring.gpg

cd ..

echo -e "\
Packaging completed. \n \
Ensure you check the output for any errors. \n \
Ignore any http errors when connecting to \"local\" chart repository.\n \
\n \
Charts, provenance files, and public key are available in ./repo \n \
You can download the public key with: \n \
  curl -s $LOCAL_HELM_MOJALOOP_REPO_URI/moja-helm-pubring.gpg > ~/.gnupg/pubring.gpg \n \
and verify with: \n \
  helm pull <chart> --verify \n \
Run the following command to serve a local repository: helm serve --repo-path ./repo \n \
\n \
Happy Helming!
"
