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
Migration job suffix - hash of image version for declarative GitOps-friendly job naming.
Job only recreates when image version changes.
*/}}
{{- define "connection-manager.migrationSuffix" -}}
{{- .Values.api.image.version | sha256sum | trunc 8 -}}
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
