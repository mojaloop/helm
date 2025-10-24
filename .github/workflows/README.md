
# Create Release PR Workflow

## Overview
The `Create Release PR` GitHub Workflow automates the creation of a release pull request (PR) for Mojaloop. It updates Helm chart dependencies, generates a changelog, deploys a test environment on Kubernetes, and runs validation tests. This workflow is manually triggered via GitHub’s `workflow_dispatch` event, offering flexibility with customizable inputs for release naming, versioning, and deployment configuration.

## Features
1. Gathers latest releases of services based on input parameters.
2. Deploys a test environment using Helm and Kubernetes.
3. Generates a changelog based on the last release tag.
4. Integrates with AWS and external repositories like `oss-core-env` to get config.
5. Runs Testing Toolkit (TTK) tests to validate the deployment.

## Prerequisites
- **GitHub Repository Access**: Write permissions to the target repository.
- **Secrets Configured**:
  - `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_ACCOUNT_ID`: AWS credentials.
  - `AUTO_RELEASE_TOKEN`: GitHub token with repo and workflow scope.
  - `AUTO_RELEASE_KUBECONFIG`: Kubernetes config for deployment.
- **Variables Configured**:
  - `AWS_DEFAULT_REGION`, `AWS_DEFAULT_OUTPUT`: AWS CLI settings.
- **External Repositories**: Access to `mojaloop/oss-core-env` and `testing-toolkit-test-cases`.

## Workflow Inputs
Customize the workflow via the GitHub UI or API:

| Input Name                  | Description                                      | Required | Default Value                     |
|-----------------------------|--------------------------------------------------|----------|-----------------------------------|
| `branch`                    | Source branch (e.g., `main`)                     | No       | `main`                            |
| `release_name`             | Release name (e.g., `Acacia`)                    | No       | None                              |
| `release_version`          | Release version (e.g., `v1.0.0`)                 | No       | Auto-determined if unset          |
| `last_release_tag`          | Previous release tag (e.g., `v0.9.0`)            | No       | None                              |
| `example_backend_version`   | Backend version (e.g., `v1.0.0`)                 | Yes      | `v15.0.0`                         |
| `deployment_release_name`   | Deployment name (e.g., `moja1`)                  | Yes      | `moja2`                           |
| `deployment_namespace`      | Kubernetes namespace (e.g., `moja1`)             | Yes      | `moja2`                           |
| `deployment_values_file`    | Helm values file path in `oss-core-env`          | Yes      | `helm-values-moja2-mojaloop-v16.0.0.yaml` |

## Usage

### Running the Workflow
1. Go to the repository’s **Actions** tab on GitHub.
2. Select **Create Release PR** from the workflow list.
3. Click **Run workflow**.
4. Fill in the required inputs (e.g., `example_backend_version`, `deployment_release_name`).
5. Optionally adjust optional inputs (e.g., `release_name`, `release_version`).
6. Click **Run workflow** to start the process.

### What Happens
- **Checkout**: Pulls code from the specified branch.
- **Setup**: Installs Helm (v3.13.3), `mo`, `updatecli` (v0.71.0), and `jq`.
- **Chart Updates**: Syncs Helm chart dependencies from multiple repositories.
- **Changelog**: Generates a changelog from the last release tag.
- **Versioning**: Determines or uses the provided release version.
- **Release Prep**: Updates TTK test cases and Mojaloop chart versions.
- **PR Creation**: Creates a draft PR with release notes.
- **Deployment**: Deploys to Kubernetes using `oss-core-env` values.
- **Testing**: Runs TTK tests and cleans up temporary files.

## Outputs
- **Draft Pull Request**: Contains updated charts, changelog, and release notes in the `release/release-candidate-<release_name>-<release_version>-<run_id>` branch.
- **Test Environment**: Deployed in the specified Kubernetes namespace (e.g., `moja2`).
- **Test Results**: TTK test outcomes (logged, continues on error).

## Directory Structure
Relevant files and scripts:
```
.github/
├── workflows/
│   └── create-release-pr.yml       # Workflow definition
│   └── scripts/
│       ├── update-charts.sh        # Updates Helm chart dependencies
│       ├── generate-changelog.sh   # Generates changelog
│       ├── determine-release-version.sh  # Determines release version
│       └── generate-release-note.sh     # Creates release note
└── manifests/
└── third-pass/
└── mojaloop.yaml           # Updatecli config for TTK versions
mojaloop/
└── Chart.yaml                      # Mojaloop Helm chart
```

## Security Notes
- **Secrets**: Sensitive data (AWS keys, GitHub token, kubeconfig) is stored in GitHub Secrets.
- **Permissions**: Ensure the `AUTO_RELEASE_TOKEN` has sufficient scope (`repo`, `workflow`).
- **Cleanup**: Temporary files (e.g., `.tmp/`) are removed post-execution.

## Dependencies
- **Helm Repositories**:
  - `stable`, `incubator`, `kokuwa`, `elastic`, `codecentric`, `bitnami`, `mojaloop-charts`, `redpanda`, `mojaloop`
- **Tools**: `Helm v3.13.3`, `updatecli v0.71.0`, `mo`, `jq`.
- **External Repos**: `mojaloop/oss-core-env`, `testing-toolkit-test-cases`.

## Troubleshooting
- **Workflow Fails**: Check GitHub Actions logs for errors in script execution or missing secrets.
- **Deployment Issues**: Verify `AUTO_RELEASE_KUBECONFIG` and namespace access.
- **Version Errors**: Ensure `release_version` or `last_release_tag` follows semantic versioning (e.g., `v1.0.0`).

## Contributing
To modify this workflow:
1. Edit `.github/workflows/create-release-pr.yml`.
2. Update scripts in `.github/workflows/scripts/` as needed.
3. Test changes in a feature branch and submit a PR to `main`.


## Helm Chart Dependency Update Script

### Overview
The `update-charts.sh` script automates the process of updating Helm chart dependencies for a Mojaloop project. It leverages `updatecli` to synchronize versions from GitHub releases, published Helm charts, and locally referenced charts. The script runs in two passes: the first pass updates dependencies from external sources, and the second pass iteratively updates local chart dependencies until no further changes are needed. This ensures all chart versions are consistent and up-to-date.

This script is typically invoked as part of a GitHub Workflow (e.g., `create-release-pr.yml`) and requires specific tools and environment variables to function.
You can also run this script locally for debugging. You need to have the github Personal Access Token and setup the environment variable `AUTO_RELEASE_TOKEN`
```
export AUTO_RELEASE_TOKEN=xxxxxxxx
```

---

### Script Details
- **File**: `.github/workflows/scripts/update-charts.sh`
- **Purpose**: Updates Helm chart dependencies using Updatecli and Helm.
- **Requirements**:
  - Bash shell
  - `updatecli` (dependency management tool)
  - Helm (chart management tool)
- **Usage**: `./update-charts.sh`
- **Environment Variables**:
  - `AUTO_RELEASE_TOKEN`: GitHub token for authenticated API access (required).

---

### Script Breakdown

#### First Pass: Update External Dependencies
```bash
# First pass - update with github releases and published helm charts
updatecli apply --config .github/workflows/manifests/first-pass
```
Runs `updatecli` with the `first-pass` manifests to update dependencies from GitHub releases and external Helm charts. This step fetches the latest versions of all components ( manifests listed under `.github/workflows/manifests/first-pass`) from GitHub and Helm repositories, updating `Chart.yaml` and `values.yaml` files accordingly

#### Second Pass: Update Local Dependencies
```bash
pass_count=0

# Repeatedly run the second-pass manifests until no changes are detected
while ! (grep -q "* Changed:	0" $dir/output.log); do
    echo -e "\nUpdating charts ... pass: $((++pass_count))\n"
    ./update-charts-dep.sh
    find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's/^\.\///g' | xargs -I {} helm repo index {}
    updatecli apply --config .github/workflows/manifests/second-pass |& tee $dir/output.log
done
```
Iteratively updates locally referenced chart dependencies until no further changes occur with the `second-pass` manifests(listed under `.github/workflows/manifests/second-pass`) . This iterative approach resolves interdependencies among local charts, ensuring versions stabilize.

##### Explanation:
1. `pass_count=0`: Initializes a counter to track iterations.
2. `while ! (grep -q "* Changed: 0" $dir/output.log)`: Loops until Updatecli reports zero changes (indicating convergence).
3. `echo -e "\nUpdating charts ... pass: $((++pass_count))\n"`: Logs the current pass number for visibility.
4. `./update-charts-dep.sh`: Runs a helper script to update chart dependencies
5. `find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's/^\.\///g' | xargs -I {} helm repo index {}`: Indexes all top-level directories as Helm repositories, excluding hidden ones (e.g., .git).
6. `updatecli apply --config .github/workflows/manifests/second-pass |& tee $dir/output.log`: Applies the second-pass manifests, piping output to both the console and output.log.

### First Pass Manifests
Updates Helm chart dependencies from external sources (GitHub releases and published charts).

Example `account-lookup-service.yaml`
```yaml
name: account-lookup-service

sources:
  account-lookup-service:
    kind: githubrelease
    spec:
      owner: mojaloop
      token: '{{ requiredEnv "AUTO_RELEASE_TOKEN" }}'
      repository: account-lookup-service
  als-oracle-pathfinder:
    kind: githubRelease
    spec:
      owner: mojaloop
      token: '{{ requiredEnv "AUTO_RELEASE_TOKEN" }}'
      repository: als-oracle-pathfinder
  event-sidecar:
    kind: githubRelease
    spec:
      owner: mojaloop
      token: '{{ requiredEnv "AUTO_RELEASE_TOKEN" }}'
      repository: event-sidecar
  common:
    kind: helmchart
    spec:
      url: https://mojaloop.github.io/charts/repo
      name: common

conditions:
  docker-account-lookup-service:
    sourceid: account-lookup-service
    kind: dockerimage
    spec:
      image: mojaloop/account-lookup-service
  docker-als-oracle-pathfinder:
    sourceid: als-oracle-pathfinder
    kind: dockerimage
    spec:
      image: mojaloop/als-oracle-pathfinder
  docker-event-sidecar:
    sourceid: event-sidecar
    kind: dockerimage
    spec:
      image: mojaloop/event-sidecar

targets:
  appVersion-account-lookup-service:
    sourceid: account-lookup-service
    kind: file
    spec:
      file: account-lookup-service/Chart.yaml
      matchpattern: '(account-lookup-service:) (v[\d\.]+)(-snapshot(\.\d+)?)?'
      replacepattern: '$1 {{ source "account-lookup-service" }}'
  appVersion-als-oracle-pathfinder:
    sourceid: als-oracle-pathfinder
    kind: file
    spec:
      file: account-lookup-service/Chart.yaml
      matchpattern: '(als-oracle-pathfinder:) (v[\d\.]+)(-snapshot(\.\d+)?)?'
      replacepattern: '$1 {{ source "als-oracle-pathfinder" }}'
  account-lookup-service:
    sourceid: account-lookup-service
    kind: helmchart
    spec:
      name: account-lookup-service
      file: values.yaml
      key: $.account-lookup-service.image.tag
  # ... (additional targets for admin, pathfinder, common, etc.)
  ```

  #### Explanation

  - Sources: Fetch latest versions
    - `githubRelease`: Queries GitHub for release tags
    - `helmchart`: Queries the `common` chart version from `https://mojaloop.github.io/charts/repo`
  - Conditions: Verifies Docker image tags exist
  - Targets: Updates files
    - `Chart.yaml`: Replaces `appVersion` fields with fetched versions.
    - `values.yaml`: Updates image tags (e.g., `$.account-lookup-service.image.tag`)

### Second Pass Manifests
Updates dependencies among locally referenced Helm charts

Example: `account-lookup-service.yaml`
```yaml
name: account-lookup-service

sources:
  account-lookup-service:
    kind: helmchart
    spec:
      url: file://./account-lookup-service
      name: account-lookup-service
  account-lookup-service-admin:
    kind: helmchart
    spec:
      url: file://./account-lookup-service
      name: account-lookup-service-admin
  account-lookup-service-handler-timeout:
    kind: helmchart
    spec:
      url: file://./account-lookup-service
      name: account-lookup-service-handler-timeout
  als-oracle-pathfinder:
    kind: helmchart
    spec:
      url: file://./account-lookup-service
      name: als-oracle-pathfinder

conditions: {}

targets:
  account-lookup-service:
    sourceid: account-lookup-service
    kind: helmchart
    spec:
      name: account-lookup-service
      file: Chart.yaml
      key: $.dependencies[0].version
    transformers:
      - addprefix: '">= '
      - addsuffix: '"'
  account-lookup-service-admin:
    sourceid: account-lookup-service-admin
    kind: helmchart
    spec:
      name: account-lookup-service
      file: Chart.yaml
      key: $.dependencies[1].version
    transformers:
      - addprefix: '">= '
      - addsuffix: '"'
  # ... (additional targets for handler-timeout, pathfinder)

```
  #### Explanation

  - Sources: Fetches versions from local Helm charts (e.g., `file://./account-lookup-service`).
  - Conditions: VNone (assumes local charts are valid).
  - Targets: Updates `Chart.yaml` dependency versions (e.g., `$.dependencies[0].version`) with a `">= X.Y.Z"` format, ensuring compatibility constraints. Here the `$.dependencies[0]` refers to the first entry under `sources` in the same file. It is important to get the correct index number.


### Third Pass Manifests
This `updatecli` manifest updates references to the Mojaloop Testing Toolkit test cases in the `mojaloop/values.yaml` file by fetching the latest release version from the `mojaloop/testing-toolkit-test-cases` GitHub repository.

Example: `mojaloop.yaml`
```yaml

name: mojaloop

sources:
  ml-testing-toolkit-test-cases:
    kind: githubrelease
    spec:
      owner: mojaloop
      token: '{{ requiredEnv "AUTO_RELEASE_TOKEN" }}'
      repository: testing-toolkit-test-cases
  ml-testing-toolkit-test-cases-trimmed:
    kind: githubrelease
    spec:
      owner: mojaloop
      token: '{{ requiredEnv "AUTO_RELEASE_TOKEN" }}'
      repository: testing-toolkit-test-cases
    transformers:
      - trimprefix: v

targets:
  ml-testing-toolkit--ml-testing-toolkit-backend--config_files:
    sourceid: ml-testing-toolkit-test-cases
    kind: file
    spec:
      file: mojaloop/values.yaml
      # matches e.g. https://github.com/mojaloop/testing-toolkit-test-cases/raw/v15.3.0-snapshot.1 (with or without the snapshot version)
      matchpattern: '(https://github.com/mojaloop/testing-toolkit-test-cases/raw)/(v[\d\.]+)(-snapshot(\.\d+)?)?'
      replacepattern: '$1/{{ source "ml-testing-toolkit-test-cases" }}'
  ml-testing-toolkit--ml-ttk-posthook-setup--config-zip:
    sourceid: ml-testing-toolkit-test-cases
    kind: file
    spec:
      file: mojaloop/values.yaml
      # matches e.g. https://github.com/mojaloop/testing-toolkit-test-cases/archive/v15.3.0-snapshot.1.zip (with or without the snapshot version)
      matchpattern: '(https://github.com/mojaloop/testing-toolkit-test-cases/archive)/(v[\d\.]+)(-snapshot(\.\d+)?)?(\.zip)'
      replacepattern: '$1/{{ source "ml-testing-toolkit-test-cases" }}$5'
  ml-testing-toolkit--config-collections:
    name: bump test-cases version
    sourceid: ml-testing-toolkit-test-cases-trimmed
    kind: file
    spec:
      file: mojaloop/values.yaml
      matchpattern: '(testing-toolkit-test-cases)-([\d\.]+)(-snapshot(\.\d+)?)?'
      replacepattern: '$1-{{ source "ml-testing-toolkit-test-cases-trimmed" }}'

```

  #### Explanation
  - Sources: Fetches the latest release version from the `mojaloop/testing-toolkit-test-cases` GitHub repository
    - `ml-testing-toolkit-test-cases`: Provides the full version (e.g., `v15.3.0`).
    - `ml-testing-toolkit-test-cases-trimmed`: Strips the `v` prefix (e.g., `15.3.0`) using a transformer.
  - Conditions: None (assumes GitHub releases are valid).
  - Targets: Updates specific version references in `mojaloop/values.yaml`
    - `ml-testing-toolkit--ml-testing-toolkit-backend--config_files`: Updates raw file URLs (e.g., `https://github.com/mojaloop/testing-toolkit-test-cases/raw/v15.3.0`) with the full version from `ml-testing-toolkit-test-cases`.
    - `ml-testing-toolkit--ml-ttk-posthook-setup--config-zip`: Updates ZIP archive URLs (e.g., `https://github.com/mojaloop/testing-toolkit-test-cases/archive/v15.3.0.zip`) with the full version.
    - `ml-testing-toolkit--config-collections`: Updates a version string (e.g., `testing-toolkit-test-cases-15.3.0`) with the trimmed version from `ml-testing-toolkit-test-cases-trimmed`.

## License
This project is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0), consistent with Mojaloop Foundation standards.
