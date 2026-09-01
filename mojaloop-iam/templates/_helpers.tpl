{{/*
Build an Ory DSN for one service from .Values.database, driver form per
database.type, database.params overrides the per-driver defaults
Usage: {{ include "iam.dsn" (dict "db" .Values.database "svc" .Values.database.hydra) }}
*/}}
{{- define "iam.dsn" -}}
{{- $db := .db -}}
{{- $svc := .svc -}}
{{- if eq $db.type "mysql" -}}
{{- $params := $db.params | default "parseTime=true&max_conns=20&max_idle_conns=4" -}}
mysql://{{ $svc.user }}:{{ $svc.password }}@tcp({{ $db.host }}:{{ $db.port }})/{{ $svc.database }}?{{ $params }}
{{- else -}}
{{- $params := $db.params | default "sslmode=disable&max_conns=20&max_idle_conns=4" -}}
postgres://{{ $svc.user }}:{{ $svc.password }}@{{ $db.host }}:{{ $db.port }}/{{ $svc.database }}?{{ $params }}
{{- end -}}
{{- end -}}
