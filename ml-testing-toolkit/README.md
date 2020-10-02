# Mojaloop Testing Toolkit Helm Chart
[![Git Commit](https://img.shields.io/github/last-commit/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/commits/master)
[![Git Releases](https://img.shields.io/github/release/mojaloop/helm.svg?style=flat)](https://github.com/mojaloop/helm/releases)
[![CircleCI](https://circleci.com/gh/mojaloop/helm.svg?style=svg)](https://circleci.com/gh/mojaloop/helm)

Mojaloop published Helm Repo: http://mojaloop.io/helm/repo/

Mojaloop deployment documentation: https://docs.mojaloop.io/documentation/deployment-guide

## 1. Charts

### 1.0 notes

- make sure that dependency checks are matching respective chart condition otherwise the setup will not be executed properly

- $snake_case syntax: used in templates to set a value dynamicly
    - examples: $release_name, $connection_manager_host etc.

### 1.1 ml-testing-toolkit-backend

- enabled/disable - enabled by default
    - `ml-testing-toolkit-backend.enabled: true/false`

- dependency-checks
    - keycloak
        - `ml-testing-toolkit-backend.dependencies.keycloak.enabled: true/false`
    - mongodb
        - `ml-testing-toolkit-backend.dependencies.mongodb.enabled: true/false`
    - connectionManager
        - `ml-testing-toolkit-backend.dependencies.connectionManager.enabled: true/false`

### 1.2 ml-testing-toolkit-frontend

- enabled/disable - enabled by default
    - `ml-testing-toolkit-frontend.enabled: true/false`

### 1.3 connection-manager-backend

- enabled/disable - disabled by default
    - `connection-manager-backend.enabled: true/false`

- dependency-checks
    - keycloak
        - `connection-manager-backend.dependencies.keycloak.enabled: true/false`
    - mysql
        - `connection-manager-backend.dependencies.mysql.enabled: true/false`

### 1.4 connection-manager-frontend
- enabled/disable - disabled by default
    - `connection-manager-frontend.enabled: true/false`

### 1.5 mysql

- enabled/disable - disabled by default
    - `mysql.enabled: true/false`

### 1.6 mongodb

- enabled/disable - disabled by default
    - `mongodb.enabled: true/false`

### 1.7 keycloak

- setup 
    - `kubectl create secret generic realm-secret --from-file=<PATH_TO_REALM_FILE> -n <NAMESPACE>`
        - '/ml-testing-toolkit/realm/realm.json'

- enable/disalbe - disabled by default
    - `keycloak.enabled: true/false`

## 2. Authentication

- enabled/disable - disabled by default
    - `./chart-backend/values.yaml/config.'system_config.json'.OAUTH.AUTH_ENABLED: true/false`
    - `ml-testing-toolkit-frontend.adminApiAuthentication: TRUE/FALSE`

if it's enabled then mocked auth server is used by default. There is an option to use a [keycloak](#17-keycloak) server

- mocked server contains several users: - password is not validated
    - userdfsp, userdfsp1, userdfsp2

## 3. Hosted mode

- enabled/disable - disabled by default
    - `./chart-backend/values.yaml/config.'system_config.json'.HOSTED_MODE: true`
    - [mongodb](#16-mongodb) must be enabled
    - [authentication](#2-authentication) must be enabled