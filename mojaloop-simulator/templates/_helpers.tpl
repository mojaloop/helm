{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
We prefix deployment components with the release name by default.
This can be overriden by setting .Values.prefix value to empty string.
Prefix is limited to 10 characters long.
*/}}
{{- define "prefix" -}}
{{- if kindIs "invalid" .Values.prefix -}}
{{- printf "%s-" .Release.Name | trunc 10 -}}
{{- else -}}
{{- .Values.prefix | trunc 10 | trimAll " " -}}
{{- end -}}
{{- end -}}