{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
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
Because we need to quote the env vars, we'll print them manually, then print every _other_ key on
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
