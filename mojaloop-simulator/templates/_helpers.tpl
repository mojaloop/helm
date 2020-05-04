{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
We prefix deployment components with the release name by default.
This can be overriden by setting .Values.prefix value.
Set .Values.prefix to ' ' (space) to eliminate the prefix completely.
Prefix is limited to 10 characters long.
*/}}
{{- define "prefix" -}}
{{- if .Values.prefix -}}
{{- .Values.prefix | trunc 10 | trimAll " " -}}
{{- else -}}
{{- printf "%s-" .Release.Name | trunc 10 -}}
{{- end -}}
{{- end -}}