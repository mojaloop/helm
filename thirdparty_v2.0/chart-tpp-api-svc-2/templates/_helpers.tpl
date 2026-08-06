{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tpp-api-svc-2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "tpp-api-svc-2.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "tpp-api-svc-2.labels" -}}
helm.sh/chart: {{ include "tpp-api-svc-2.chart" . }}
app.kubernetes.io/name: {{ include "tpp-api-svc-2.name" . }}
{{ include "tpp-api-svc-2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tpp-api-svc-2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tpp-api-svc-2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "apiVersion.Deployment" -}}
  {{- if .Capabilities.APIVersions.Has "apps/v1/Deployment" -}}
    {{- print "apps/v1" -}}
  {{- else -}}
    {{- print "apps/v1beta2" -}}
  {{- end -}}
{{- end -}}

{{- define "apiVersion.Ingress" -}}
  {{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- else -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- end -}}
{{- end -}}
