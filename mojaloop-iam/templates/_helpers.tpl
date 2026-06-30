{{/*
Stable Postgres superuser password shared between
postgresql-credentials-secret and ory-database-secrets. Both templates
need the same value at first-install render time, before either Secret
exists in the cluster.

Strategy:
  - If ml-iam-postgresql-credentials exists in the cluster, return that.
  - Otherwise derive a deterministic 24-char value from Release/Chart
    identifiers so every template that calls this helper in the same
    render produces the same string. Operators can rotate later with
    `kubectl delete secret ml-iam-postgresql-credentials` followed by a
    helm upgrade — the chart will generate a fresh derived value.
*/}}
{{- define "iam.postgresPassword" -}}
{{- $existing := lookup "v1" "Secret" .Release.Namespace "ml-iam-postgresql-credentials" -}}
{{- if and $existing $existing.data (index $existing.data "postgres-password") -}}
{{- index $existing.data "postgres-password" | b64dec -}}
{{- else -}}
{{- printf "%s/%s/%s/postgres" .Release.Name .Release.Namespace .Chart.Name | sha256sum | trunc 24 -}}
{{- end -}}
{{- end -}}
