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

- enabled/disabled - enabled by default:
    - `ml-testing-toolkit-backend.enabled: true/false`

- admin api authentication:
    - `ml-testing-toolkit-backend.config.'system_config.json'.OAUTH.AUTH_ENABLED: true/false`

- dependency-checks:
    - keycloak
        - `ml-testing-toolkit-backend.dependencies.keycloak.enabled: true/false`
    - mongodb
        - `ml-testing-toolkit-backend.dependencies.mongodb.enabled: true/false`
    - connectionManager
        - `ml-testing-toolkit-backend.dependencies.connectionManager.enabled: true/false`

### 1.2 ml-testing-toolkit-frontend

- enabled/disable - enabled by default:
    - `ml-testing-toolkit-frontend.enabled: true/false`

- admin api authentication:
    - `ml-testing-toolkit-frontend.config.AUTH_ENABLED: TRUE/FALSE`

### 1.3 connection-manager-backend

- enabled/disable - disabled by default:
    - `connection-manager-backend.enabled: true/false`

- admin api authentication:
    - `connection-manager-backend.config.AUTH_ENABLED: TRUE/DISABLED`

- dependency-checks:
    - keycloak:
        - `connection-manager-backend.dependencies.keycloak.enabled: true/false`
    - mysql:
        - `connection-manager-backend.dependencies.mysql.enabled: true/false`

### 1.4 connection-manager-frontend

- enabled/disable - disabled by default:
    - `connection-manager-frontend.enabled: true/false`

- admin api authentication:
    - `connection-manager-frontend-frontend.config.AUTH_ENABLED: TRUE/FALSE`

### 1.5 mysql

- enabled/disable - disabled by default:
    - `mysql.enabled: true/false`

### 1.6 mongodb

- enabled/disable - disabled by default:
    - `mongodb.enabled: true/false`

### 1.7 keycloak

- enable/disalbe - disabled by default:
    - `keycloak.enabled: true/false`

- notes:
    - when keylcloak is disabled there are 3 default users - userdsfp, userdfsp1 userdfsp2 - and password is not validated

## 2. Hosted mode
- ml-testing-toolkit-backend
    - `ml-testing-toolkit-backend.config.'system_config.json'.HOSTING_ENABLED: true`
    - `ml-testing-toolkit-backend.config.'system_config.json'.OAUTH.AUTH_ENABLED: true`
    - `ml-testing-toolkit-backend.dependencies.mongodb.enabled: true`
    - `ml-testing-toolkit-backend.dependencies.keycloak.enabled: true`
    - `ml-testing-toolkit-backend.dependencies.connectionManager.enabled: true`
- ml-testing-toolkit-frontend
    - `ml-testing-toolkit-frontend.enabled: true`
    - `ml-testing-toolkit-frontend.config.AUTH_ENABLED: TRUE`
- mongodb
    - `mongodb.enabled: true`
- keycloak
    - `keycloak.enabled: true`
- connection-manager-backend
    - `connection-manager-backend.enabled: true`
    - `connection-manager-backend.config.AUTH_ENABLED: TRUE`
    - `connection-manager-backend.dependencies.keycloak.enabled: true`
- connection-manager-frontend
    - `connection-manager-frontend.enabled: true`
    - `connection-manager-frontend.config.AUTH_ENABLED: TRUE`

