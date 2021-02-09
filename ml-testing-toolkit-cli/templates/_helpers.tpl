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

{{- define "ttkCLI.jobTemplate" }}
{{- $serviceFullName := include "ml-testing-toolkit-cli.fullname" . -}}
  spec:
    backoffLimit: 0
    template:
      metadata:
        labels:
          app.kubernetes.io/name: {{ include "ml-testing-toolkit-cli.name" . }}
          app.kubernetes.io/instance: {{ .Release.Name }}
          app.kubernetes.io/version: {{ .Chart.AppVersion }}
          app.kubernetes.io/managed-by: {{ .Release.Service }}
          helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
      spec:
        restartPolicy: Never
        containers:
          - name: {{ .Chart.Name }}
            image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
            imagePullPolicy: {{ .Values.image.pullPolicy }}
            {{- if .Values.image.imagePullSecrets }}
            imagePullSecrets:
            {{ toYaml .Values.image.imagePullSecrets | indent 10 }}
            {{- end }}
            command: ["/bin/sh", "-c"]
            args:
            - echo "Downloading the test collection...";
              wget {{ .Values.config.testCasesZipUrl }} -O downloaded-test-collections.zip;
              mkdir tmp_test_cases;
              unzip -d tmp_test_cases -o downloaded-test-collections.zip;
              npm run cli -- -c cli-default-config.json -e cli-testcase-environment.json -i tmp_test_cases/{{ .Values.config.testCasesPathInZip }} -u {{ .Values.config.ttkBackendURL | replace "$release_name" .Release.Name }} --report-format html {{- if .Values.config.awsS3BucketName }} --report-target s3://{{ .Values.config.awsS3BucketName }}/{{ .Values.config.awsS3FilePath }}/report.html {{- end }} --report-auto-filename-enable true {{- if .Values.configCreds.SLACK_WEBHOOK_URL }} --slack-webhook-url $SLACK_WEBHOOK_URL {{- end }} --extra-summary-information="Test Suite:{{ .Values.config.testSuiteName }},Environment:{{ .Values.config.environmentName }}";
              echo "Done";
            envFrom:
            - secretRef:
                name: {{ template "ml-testing-toolkit-cli.fullname" . }}-aws-creds
            volumeMounts:
              - name: {{ $serviceFullName }}-volume-testcase-environment-file
                mountPath: /opt/mojaloop-testing-toolkit/cli-testcase-environment.json
                subPath: cli-testcase-environment.json
              - name: {{ $serviceFullName }}-volume-config-file-defaults
                mountPath: /opt/mojaloop-testing-toolkit/cli-default-config.json
                subPath: cli-default-config.json
        volumes:
          - name: {{ template "ml-testing-toolkit-cli.fullname" . }}-volume-config-file-defaults
            configMap:
              name: {{ template "ml-testing-toolkit-cli.fullname" . }}-config-file-defaults
              items:
                - key: cli-default-config.json
                  path: cli-default-config.json
          - name: {{ template "ml-testing-toolkit-cli.fullname" . }}-volume-testcase-environment-file
            configMap:
              name: {{ template "ml-testing-toolkit-cli.fullname" . }}-config-testcase-environment-file
              items:
                - key: cli-testcase-environment.json
                  path: cli-testcase-environment.json
{{- end }}
