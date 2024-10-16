# Docker Image Re-Builder from Helm Charts

## Overview

The official **Mojaloop Docker images** are currently only available for the **AMD64** platform. When deploying Mojaloop Helm charts on an **ARM-based macOS**, these images run in **emulation mode**, which significantly slows down performance compared to native applications. 

This script aims to address that issue by:

1. Extracting Mojaloop Docker image references from the Helm chart.
2. Cloning the respective repositories from GitHub.
3. Checking out the appropriate tags.
4. Rebuilding the Docker images for **ARM64** architecture.

By building native ARM64 images, the goal is to improve the performance during local testing and development. **In the future**, it is hoped that Mojaloop’s official Docker images will natively support ARM architecture, eliminating the need for such custom builds.


---

## Prerequisites

- **Git**: Ensure `git` is installed on your system.
- **Docker**: Docker daemon must be running and accessible.
- **Helm**: Helm must be installed and the charts should be accessible from the specified path.

---

## Usage

Make the script executable and run it from your terminal:  

```bash
cd local-deployment-methods/docker_arm_rebuild
chmod +x rebuild.sh
./rebuild.sh
```

## Script Parameters and Components

### Variables:

- HELM_RELEASE:
  The name used for the Helm release. Example: moja.

- HELM_CHART:
  Path to the Helm chart folder to extract the templates. Example: ../../mojaloop/ or 

## Example Output
```
Building Docker image from repo https://github.com/mojaloop/account-lookup-service.git with tag v15.4.0-snapshot.33
Skipping duplicate image: mojaloop/central-ledger:v15.3.1
Skipping non-mojaloop image: some-other-service:latest
```

## Limitations
- Helm Chart Assumptions:
  The script assumes all Helm chart image references follow the format mojaloop/repo-name:tag.

- ARM64 Architecture:
  The script builds Docker images for ARM64 only. Adjust the docker build command if other architectures are needed.

---

# Deploying Mojaloop on macOS using Docker Desktop

## Prerequisites

Before deploying Mojaloop, ensure the following tools are installed and configured on your macOS machine:

- **Docker Desktop for macOS**: Ensure Kubernetes is enabled in Docker Desktop.
- **Helm**: Install Helm for managing your Kubernetes deployments.
- **Helmfile**: Install Helmfile to manage multiple Helm charts effectively.

---

## Step-by-Step Deployment

### 1. Adjust Resource Limits in Docker Desktop

To run Mojaloop smoothly, adjust the CPU and memory allocations in Docker Desktop:

1. Open **Docker Desktop**.
2. Navigate to **Settings** (⚙️) → **Resources**.
3. Set:
   - **CPUs**: 8 cores  
   - **Memory**: 16 GB RAM  
4. Click **Apply & Restart** to save the changes.

### 2. Install Ingress NGINX Controller

Mojaloop requires an Ingress controller to route external traffic to the services. Use the following Helm command to install.

**Ingress NGINX**:

```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

### 3. Prepare Helm Chart Dependencies

Navigate to the root directory of the project and run the update-charts-dep.sh script to update the chart dependencies:

```
sh update-charts-dep.sh
```

### 4. Deploy Mojaloop Using Helmfile

Change to the local-deployment-methods/helmfile directory, where the Helmfile configuration is located. Then, run the following commands to deploy Mojaloop:

```
cd local-deployment-methods/helmfile
sh update-charts-dep.sh
helmfile apply
```
