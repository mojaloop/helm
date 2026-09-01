{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "connection-manager.name" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "connection-manager.fullname" -}}
{{- if $.Values.fullnameOverride -}}
{{- $.Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default $.Chart.Name $.Values.nameOverride -}}
{{- if contains $name $.Release.Name -}}
{{- $.Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" $.Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "connection-manager.chart" -}}
{{- printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Migration job suffix - hash of all inputs that affect the job for GitOps-friendly naming.
Job only recreates when relevant config changes.
*/}}
{{- define "connection-manager.migrationSuffix" -}}
{{- $config := dict "image" .Values.api.image.version "migrations" .Values.migrations -}}
{{- $config | toJson | sha256sum | trunc 8 -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "connection-manager.labels" -}}
app.kubernetes.io/name: {{ include "connection-manager.name" . }}
helm.sh/chart: {{ include "connection-manager.chart" . }}
app.kubernetes.io/instance: {{ $.Release.Name }}
{{- if $.Chart.AppVersion }}
app.kubernetes.io/version: {{ $.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ $.Release.Service }}
app.kubernetes.io/part-of: ConnectionManager
{{- end -}}

{{/* Shared Vault env for the api and migration job, Constants validates it on load */}}
{{- define "connection-manager.vaultEnv" -}}
{{- with .Values.api }}
{{- if .vault.auth.k8s.enabled }}
- name: VAULT_AUTH_METHOD
  value: K8S
- name: VAULT_K8S_TOKEN_FILE
  value: {{ .vault.auth.k8s.token }}
- name: VAULT_K8S_ROLE
  value: {{ .vault.auth.k8s.role }}
- name: VAULT_K8S_AUTH_MOUNT_POINT
  value: {{ .vault.auth.k8s.mountPoint }}
{{- else if .vault.auth.appRole.enabled }}
- name: VAULT_AUTH_METHOD
  value: APP_ROLE
- name: VAULT_ROLE_ID_FILE
  value: {{ .vault.auth.appRole.roleId }}
- name: VAULT_ROLE_SECRET_ID_FILE
  value: {{ .vault.auth.appRole.roleSecretId }}
{{- end }}
- name: VAULT_ENDPOINT
  value: {{ .vault.endpoint }}
- name: VAULT_MOUNT_PKI
  value: {{ .vault.mounts.pki }}
- name: VAULT_MOUNT_INTERMEDIATE_PKI
  value: {{ .vault.mounts.intermediatePki }}
- name: VAULT_MOUNT_KV
  value: {{ .vault.mounts.kv }}
- name: VAULT_PKI_SERVER_ROLE
  value: {{ .vault.pkiServerRole }}
- name: VAULT_PKI_CLIENT_ROLE
  value: {{ .vault.pkiClientRole }}
- name: VAULT_SIGN_EXPIRY_HOURS
  value: {{ .vault.signExpiryHours | quote }}
- name: INTERNAL_CA_TTL
  value: {{ .vault.internalCaTtl | quote }}
- name: VAULT_MOUNT_DFSP_CLIENT_CERT_BUNDLE
  value: {{ .vault.mounts.dfspClientCertBundle | quote }}
- name: VAULT_MOUNT_DFSP_INT_IP_WHITELIST_BUNDLE
  value: {{ .vault.mounts.dfspInternalIPWhitelistBundle | quote }}
- name: VAULT_MOUNT_DFSP_EXT_IP_WHITELIST_BUNDLE
  value: {{ .vault.mounts.dfspExternalIPWhitelistBundle | quote }}
- name: SWITCH_FQDN
  value: {{ .switchFQDN | quote }}
- name: SWITCH_ID
  value: {{ .switchId | quote }}
{{- end }}
{{- end -}}
