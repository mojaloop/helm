{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
First, we prepend the backend env. _Then_ we prepend some init env vars. This way, Kubernetes
takes care of deduplication in the order we want. The order of precedence is this:
  1. env vars defined in the initContainer
  2. env vars defined in the backend config
  3. env vars defined in $initContainerEnv
*/}}
{{- define "mojaloop-simulator.buildInitContainerEnv" -}}
{{- $ctx := . }}
{{- $initContainerEnv := dict "SIM_NAME" .name "SIM_SCHEME_ADAPTER_SERVICE_NAME" (printf "sim-%s-scheme-adapter" .name) "SIM_BACKEND_SERVICE_NAME" (printf "sim-%s-backend" .name) "SIM_CACHE_SERVICE_NAME" (printf "sim-%s-cache" .name) -}}
{{- range $varName, $varVal := merge .env $initContainerEnv -}}
  {{- $_ := set $ctx.initCont "env" (prepend $ctx.initCont.env (dict "name" $varName "value" $varVal)) }}
{{- end -}}
{{ .initCont | toYaml }}
{{- end -}}
