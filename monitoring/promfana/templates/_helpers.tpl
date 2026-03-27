{{/*
Return the Grafana admin secret name.
*/}}
{{- define "promfana.grafanaAdminSecretName" -}}
{{- if .Values.grafanaAdminSecret.name -}}
{{ .Values.grafanaAdminSecret.name }}
{{- else -}}
{{ printf "%s-grafana-admin" .Release.Name }}
{{- end -}}
{{- end -}}

{{/*
Return the Prometheus datasource URL.
*/}}
{{- define "promfana.prometheusDatasourceURL" -}}
{{ printf "http://%s.%s.svc:%v" .Values.prometheusDatasource.serviceName .Release.Namespace .Values.prometheusDatasource.servicePort }}
{{- end -}}
