{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mojaloop-simulator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Prepend a list of dictionaries to a list of container env vars. Prepended in such an order that the
env vars in the containers will take precedence over any env vars in the dictionaries. Then each
dictionary provided will take precedence over subsequent dictionaries. Put another way, the
dictionary list is in order of highest precedence to lowest precedence.
*/}}
{{- define "mojaloop-simulator.prependDictsToContainerEnv" -}}
{{- $ctx := . }}
{{- range $_, $initCont := $ctx.initConts -}}
  {{- range $_, $dict := $ctx.dicts -}}
    {{- range $varName, $varVal := $dict -}}
      {{- $_ := set $initCont "env" (prepend $initCont.env (dict "name" $varName "value" $varVal)) -}}
    {{- end -}}
  {{- end -}}
{{/*
Because we need to quote the env vars, we'll print them manually, then print every _other_ key on
the init container afterward.
*/}}
- env:
  {{- range $_, $envVal := $initCont.env }}
  - name: {{ $envVal.name }}
    value: {{ $envVal.value | quote }}
  {{- end }}
{{- range $k, $v := $initCont }}
{{- if not (eq $k "env") }}
{{ (dict $k $v) | toYaml | indent 2 }}
{{ end -}}
{{- end -}}
{{- end -}}
{{- end -}}
