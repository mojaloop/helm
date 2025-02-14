{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "als-msisdn-oracle.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "als-msisdn-oracle.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "als-msisdn-oracle.labels" -}}
helm.sh/chart: {{ include "als-msisdn-oracle.chart" . }}
app.kubernetes.io/name: {{ include "als-msisdn-oracle.name" . }}
{{ include "als-msisdn-oracle.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "als-msisdn-oracle.selectorLabels" -}}
app.kubernetes.io/name: {{ include "als-msisdn-oracle.name" . }}
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
