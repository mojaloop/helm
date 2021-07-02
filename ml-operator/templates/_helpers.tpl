{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ml-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ml-operator.labels" -}}
helm.sh/chart: {{ include "ml-operator.chart" . }}
{{ include "ml-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ml-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ml-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}