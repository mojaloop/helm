{{/*
Expand the name of the chart.
*/}}
{{- define "ml-iam-services.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "ml-iam-services.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ml-iam-services.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ml-iam-services.labels" -}}
helm.sh/chart: {{ include "ml-iam-services.chart" . }}
{{ include "ml-iam-services.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ml-iam-services.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ml-iam-services.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels of one process
Usage: {{ include "ml-iam-services.componentLabels" (dict "context" . "component" "api") }}
*/}}
{{- define "ml-iam-services.componentLabels" -}}
{{ include "ml-iam-services.selectorLabels" .context }}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/*
Network-policy peers from entries of {namespace, podSelector}, an empty
namespace being the release's own
Usage: {{ include "ml-iam-services.peers" (dict "context" . "peers" .Values.networkPolicy.gateway) }}
*/}}
{{- define "ml-iam-services.peers" -}}
{{- range .peers }}
- pods:
    namespaceSelector:
      matchLabels:
        kubernetes.io/metadata.name: {{ .namespace | default $.context.Release.Namespace | quote }}
    podSelector:
      {{- toYaml (required "a networkPolicy entry names its pods in podSelector" .podSelector) | nindent 6 }}
{{- end }}
{{- end }}

{{/*
A network-policy peer naming one of the IAM's own processes
*/}}
{{- define "ml-iam-services.componentPeer" -}}
- pods:
    namespaceSelector:
      matchLabels:
        kubernetes.io/metadata.name: {{ .context.Release.Namespace | quote }}
    podSelector:
      matchLabels:
        {{- include "ml-iam-services.componentLabels" . | nindent 8 }}
{{- end }}

{{/*
The IAM build: global.iamImage when the deployment pins one, image otherwise
*/}}
{{- define "ml-iam-services.image" -}}
{{- with .Values.global }}{{ with .iamImage }}{{ . }}{{ end }}{{ end }}
{{- if not (and .Values.global .Values.global.iamImage) }}
{{- .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}
{{- end }}
{{- end }}
