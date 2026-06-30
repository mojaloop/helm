{{/*
Stable per-purpose password derivation shared across the credentials
Secret, the Postgres init-SQL Secret, and the per-service DSN Secrets.
Every call in one render produces the same string for the same purpose;
across renders the lookup branch keeps the value stable on upgrade.

Usage:
  {{ include "iam.derivedPassword" (dict "ctx" . "purpose" "postgres") }}
  {{ include "iam.derivedPassword" (dict "ctx" . "purpose" "hydra") }}

If ml-iam-postgresql-credentials exists in the cluster, the helper reuses
the stored value under key '<purpose>-password'. Otherwise it derives a
deterministic 24-char string from Release/Chart identifiers + purpose.
Operators can rotate later with
`kubectl delete secret ml-iam-postgresql-credentials` followed by a
helm upgrade.
*/}}
{{- define "iam.derivedPassword" -}}
{{- $ctx := .ctx -}}
{{- $purpose := .purpose -}}
{{- $key := printf "%s-password" $purpose -}}
{{- $existing := lookup "v1" "Secret" $ctx.Release.Namespace "ml-iam-postgresql-credentials" -}}
{{- if and $existing $existing.data (index $existing.data $key) -}}
{{- index $existing.data $key | b64dec -}}
{{- else -}}
{{- printf "%s/%s/%s/%s" $ctx.Release.Name $ctx.Release.Namespace $ctx.Chart.Name $purpose | sha256sum | trunc 24 -}}
{{- end -}}
{{- end -}}
