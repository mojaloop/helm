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
  {{- if .Capabilities.APIVersions.Has "batch/v1" -}}
    {{- print "batch/v1" -}}
  {{- else -}}
    {{- print "batch/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{- define "ml-testing-toolkit-cli.jobtemplate" }}
template:
  metadata:
    labels:
      app.kubernetes.io/name: {{ include "ml-testing-toolkit-cli.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
      app.kubernetes.io/version: {{ .Chart.Version }}
      app.kubernetes.io/managed-by: {{ .Release.Service }}
      helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
    ## Adding custom labels, if update the values.yaml in 'job.labels'
    {{- with .Values.job.templateLabels }}
      {{ toYaml .| indent 6 | trim }}
    {{- end }}
  spec:
    restartPolicy: Never
    {{- include "ml-testing-toolkit-cli.template.containers" . | nindent 4 -}}
    {{- include "ml-testing-toolkit-cli.template.volumes" . | nindent 4 -}}
{{- end }}

{{- define "ml-testing-toolkit-cli.template.containers" }}
{{- $serviceFullName := include "ml-testing-toolkit-cli.fullname" . -}}
containers:
- name: {{ .Chart.Name }}
  image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
  imagePullPolicy: {{ .Values.image.pullPolicy }}
  {{- if .Values.image.pullSecrets }}
  imagePullSecrets:
  {{ toYaml .Values.image.pullSecrets | indent 10 }}
  {{- end }}
  command: ["/bin/sh", "-c"]
  args:
  - |
    {{- include "common.tplvalues.render" (dict "value" .Values.script "context" $) | nindent 12 }}
  envFrom:
  - secretRef:
      name: {{ template "ml-testing-toolkit-cli.fullname" . }}-aws-creds
  volumeMounts:
    - name: {{ $serviceFullName }}-env
      mountPath: /opt/app/cli-testcase-environment.json
      subPath: cli-testcase-environment.json
    - name: {{ $serviceFullName }}-conf
      mountPath: /opt/app/cli-default-config.json
      subPath: cli-default-config.json
{{- end }}

{{- define "ml-testing-toolkit-cli.template.volumes" }}
volumes:
- name: {{ template "ml-testing-toolkit-cli.fullname" . }}-conf
  configMap:
    name: {{ template "ml-testing-toolkit-cli.fullname" . }}-conf
    items:
      - key: cli-default-config.json
        path: cli-default-config.json
- name: {{ template "ml-testing-toolkit-cli.fullname" . }}-env
  configMap:
    name: {{ template "ml-testing-toolkit-cli.fullname" . }}-env
    items:
      - key: cli-testcase-environment.json
        path: cli-testcase-environment.json
{{- end }}
