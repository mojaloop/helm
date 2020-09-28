# Mojaloop Testing toolkit Helm Chart

## Hosting mode

1. ./values.yaml - global.hostingMode.enabled: true
2. auth server
    - mocked: ./values.yaml - global.keycloak.enabled: false
    - keycloak: ./values.yaml - global.keycloak.enabled: true
