{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mojaloop-simulator.common-labels" -}}
app.kubernetes.io/instance: {{ $.Release.Name }}
app.kubernetes.io/version: "{{ $.Chart.Version | trunc 63 }}"
app.kubernetes.io/managed-by: {{ $.Release.Service }}
helm.sh/chart: {{ printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 }}
{{- end -}}

{{/*
We prefix deployment components with the release name by default.
This can be overridden by setting .Values.prefix value to your preferred value, including an empty string for no prefix. If you require a dash separator in your custom prefix, you must include this yourself, e.g. `.Values.prefix: prefix-`.
Prefix is truncated to 10 characters long.
*/}}
{{- define "mojaloop-simulator.prefix" -}}
{{- if kindIs "invalid" .Values.prefix -}}
{{- printf "%s-sim-" .Release.Name -}}
{{- else -}}
{{- tpl .Values.prefix $ | trimAll " " -}}
{{- end -}}
{{- end -}}

{{/*
Prepend a dictionary to a list of container env vars. Prepended in such an order that the env vars
in the containers will take precedence over any env vars in the dictionary.
Usage, where `$keyVals` is a dictionary:
{{ include "mojaloop-simulator.prependDictToContainerEnv" (dict "containers" $initContainer "dict" $keyVals) }}
With multiple dictionaries (see the `merge` sprig documentation for more info):
{{ include "mojaloop-simulator.prependDictToContainerEnv" (dict "containers" $initContainer "dict" (merge $keyVals1 $keyVals2)) }}
*/}}
{{- define "mojaloop-simulator.prependDictToContainerEnv" -}}
{{- $ctx := . }}
{{- range $_, $container := $ctx.containers -}}
{{/*
Because we need to quote the env vars, we will print them manually, then print every _other_ key on
the init container afterward.
*/}}
- env:
  {{- range $varName, $varVal := $ctx.dict }}
  - name: {{ $varName }}
    value: {{ $varVal | quote }}
  {{- end }}
  {{- range $_, $envVal := $container.env }}
  - name: {{ $envVal.name }}
    value: {{ $envVal.value | quote }}
  {{- end }}
{{- range $k, $v := $container }}
{{- if not (eq $k "env") }}
{{ (dict $k $v) | toYaml | indent 2 }}
{{ end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "mojaloop-simulator.apiVersion.Deployment" -}}
  {{- if .Capabilities.APIVersions.Has "apps/v1/Deployment" -}}
    {{- print "apps/v1" -}}
  {{- else -}}
    {{- print "apps/v1beta2" -}}
  {{- end -}}
{{- end -}}

{{- define "mojaloop-simulator.apiVersion.Ingress" -}}
  {{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- else -}}
    {{- print "networking.k8s.io/v1" -}}
  {{- end -}}
{{- end -}}
