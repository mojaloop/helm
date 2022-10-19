{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ml-testing-toolkit-frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ml-testing-toolkit-frontend.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ml-testing-toolkit-frontend.apiVersion.Deployment" -}}
  {{- if .Capabilities.APIVersions.Has "apps/v1/Deployment" -}}
    {{- print "apps/v1" -}}
  {{- else -}}
    {{- print "apps/v1beta2" -}}
  {{- end -}}
{{- end -}}

{{- define "ml-testing-toolkit-frontend.apiVersion.Ingress" -}}
  {{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- else -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- end -}}
{{- end -}}
