{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
We prefix deployments artifacts with the release name by default.
This can be overriden by setting .Values.prefix value.
Prefix is limited to 10 characters long.
*/}}
{{- define "prefix" -}}
{{- if .Values.prefix -}}
{{- .Values.prefix | trunc 10 -}}
{{- else -}}
{{- printf "%s-" .Release.Name | trunc 10 -}}
{{- end -}}
{{- end -}}