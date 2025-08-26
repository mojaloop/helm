# Helm Provenance and Integrity

Helm provenance refers to the process of verifying the authenticity and integrity of Helm charts using cryptographic signatures. It ensures that a Helm chart has not been tampered with and comes from a trusted source.

Helm has provenance tools which help chart users verify the integrity and origin of a package. Using industry-standard tools based on PKI, GnuPG, and well-respected package managers, Helm can generate and verify signature files.

**Note: This feature is introduced in mojaloop with version 17.1.0**

## Overview

Integrity is established by comparing a chart to a provenance record. Provenance records are stored in provenance files, which are stored alongside a packaged chart. For example, if a chart is named `myapp-1.2.3.tgz`, its provenance file will be `myapp-1.2.3.tgz.prov`.

Provenance files are generated at packaging time (`helm package --sign` ...), and can be checked by multiple commands, notably `helm install --verify`.

## The Workflow

### 1. Prerequisites

Helm charts are first packaged and then securely signed using GnuPG keys. Therefore, before signing a Helm chart, it is essential to have GnuPG key pairs available. The following section provides a detailed guide on setting up and using GnuPG keys for signing Helm charts.

- **A. Installing GnuPG**
- **B. Generating a GPG Key Pair**
- **C. Viewing the GPG keys**
- **D. Exporting Keys to the Keyring**
- **E. Displaying the Secret Key**

#### A. Installing GnuPG

- **macOS:**
  ```sh
  brew install gnupg
  ```
- **Debian-based systems:**
  ```sh
  sudo apt-get install gnupg
  ```

#### B. Generating a GPG Key Pair

To create a new GPG key pair, run the following command:

```sh
gpg --full-generate-key
```

You will be prompted to configure the following options:

1. **Key type –** Choose the type of key to generate. _(Default: RSA and RSA (sign and encrypt))_
2. **Key size –** Define the key length _(Default: 3072 bits for RSA)_.
3. **Key validity period –** Specify how long the key should remain valid.
4. **User identification –** Provide details including your name (User ID), email, and a comment.
5. **Passphrase –** A passphrase is required to access the secret key or generate a signature.

#### C. Viewing GPG Keys

- List public keys:
  ```sh
  gpg --list-keys
  ```
- List secret (private) keys:
  ```sh
  gpg --list-secret-keys
  ```

#### D. Exporting Keys to the Keyring

- Export public key:
  ```sh
  gpg --export > ~/.gnupg/pubring.gpg
  ```
- Export secret (private) key:
  ```sh
  gpg --export-secret-keys > ~/.gnupg/secring.gpg
  ```

#### E. Displaying the Secret Key (Base64 Encoded)

To output the secret key in a Base64-encoded format:

```sh
cat ~/.gnupg/secring.gpg | base64
```

Copy the output and set it as an environment variable in the environment where Helm packaging takes place. This ensures that the signing process has access to the necessary cryptographic credentials.

---

### 2. Helm Package and Sign

Helm charts are first packaged—a process that bundles the chart’s files into a compressed archive (`.tgz`). Once packaged, the chart is signed using a GnuPG key to verify its authenticity and integrity to generate a provenance file (`.prov`).

#### **Prerequisites:**

1. Set the Secret Key as an Environment Variable: `GPG_SECRET_KEY`
2. Save the passphrase in `passphrase.txt` to avoid multiple prompts.

#### **Steps:**

1. Install GnuPG in .circleci/config.yml:

```sh
    apk --no-cache add --update gnupg
```

These commands are incorporated in `package.sh` 

2. Save the Secret Key to the Keyring:
   ```sh
   echo $GPG_SECRET_KEY | base64 --decode > ~/.gnupg/secring.gpg
   ```
3. Package the Helm Chart with a Signed Provenance File:

   ```sh
   helm package --sign --key <user_name> --keyring ~/.gnupg/secring.gpg --passphrase-file ./passphrase.txt -u -d ./repo <chart_name> --version <version>
   ```

   - `--sign` : Signs the package using the specified GPG key.
   - `--key 'user_name'` : Specifies the GPG key to use for signing.
   - `--keyring ~/.gnupg/secring.gpg` : Defines the keyring location where the secret key is stored.
   - `--passphrase-file ./passphrase.txt` : Uses a file containing the passphrase to sign the package.
   - `-u` : Updates the index file if it exists.
   - `-d ./repo` : Specifies the destination directory for the packaged chart.
   - `--version <version>` : Specifies the chart version, which can be a development release.

4. This command generates `.tgz` (Helm chart archive) and `.prov` (provenance) files.<br>

5. We also export the public key pubpubring.gpg and add it to the chart repo so users can download it and use it to    verify the helm chart
  ```sh
  gpg --export "$KEY_UID" > ./moja-helm-pubring.gpg
  ```

This command is incorporated in `.circleci/publish_helm_charts.sh`

5. Push the Generated Files to the GitHub Pages Branch:
   ```sh
   git add ./*.tgz ./*.prov ./moja-helm-pubring.gpg
   git push -q origin $GITHUB_TARGET_BRANCH
   ```

---

### 3. Helm Install and Helm Verify since mojaloop version 17.1.0

These commands ensure that the Helm chart being installed is authentic and untampered by checking its cryptographic signature against the corresponding `.prov` file. This guarantees that the chart was packaged and signed by a trusted source, helping to maintain the integrity and security of the deployment.


**Note: This feature will not work with mojaloop versions prior to 17.1.0**

#### **1. Add Mojaloop Repo to Your Helm Config**

Before installing Mojaloop, add the official Mojaloop Helm repository to your local Helm configuration. This command registers Mojaloop’s Helm charts, making them available for installation.

```sh
helm repo add mojaloop https://mojaloop.io/helm/repo/
helm repo update
```

#### **2. Download the public key to verify the helm chart**
  You need to download the public key and store it in `~/.gnupg/pubring.gpg` file
  ```sh
  curl -s https://mojaloop.github.io/helm/repo/moja-helm-pubring.gpg > ~/.gnupg/pubring.gpg
  ```
  `~/.gnupg/pubring.gpg` is the default public key used by the helm in verify command.

  Alternatively, you can store the key in any other file and use it explicitly in the helm verify commands

  e.g.
  ```sh
  curl -s https://mojaloop.github.io/helm/repo/moja-helm-pubring.gpg > ./moja-helm-pubring.gpg

  helm --namespace demo install --verify moja mojaloop/mojaloop --create-namespace --dry-run --keyring ./moja-helm-pubring.gpg

  ```
#### **3. Test Installation Without Deploying It**

Before performing an actual deployment, you can simulate the installation to verify the chart and configurations by performing a dry run.

```sh
helm --namespace demo install --verify moja mojaloop/mojaloop --create-namespace --dry-run
```

#### **4. Installing and Verifying the Latest Version**

To install the latest version of Mojaloop while verifying its signature:

```sh
helm --namespace demo install --verify moja mojaloop/mojaloop --create-namespace
```

#### **5. Installing and Verifying Development Versions**

To install the latest development version:

```sh
helm --namespace demo install --verify moja mojaloop/mojaloop --create-namespace --devel
```

To install any custom version:

```sh
helm --namespace demo install --verify moja mojaloop/mojaloop --version <version_number> --create-namespace
```
