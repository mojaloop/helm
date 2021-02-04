{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ml-testing-toolkit-cli.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ml-testing-toolkit-cli.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ml-testing-toolkit-cli.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ml-testing-toolkit-cli.labels" -}}
helm.sh/chart: {{ include "ml-testing-toolkit-cli.chart" . }}
{{ include "ml-testing-toolkit-cli.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ml-testing-toolkit-cli.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ml-testing-toolkit-cli.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "ml-testing-toolkit-cli.apiVersion.Job" -}}
  {{- if .Capabilities.APIVersions.Has "batch/v1" -}}
    {{- print "batch/v1" -}}
  {{- else -}}
    {{- print "batch/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{- define "ml-testing-toolkit-cli.apiVersion.CronJob" -}}
  {{- print "batch/v1beta1" -}}
{{- end -}}

