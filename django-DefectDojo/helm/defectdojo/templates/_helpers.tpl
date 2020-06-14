{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "defectdojo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "defectdojo.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "defectdojo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
  Determine the hostname to use for PostgreSQL/postgres.
*/}}
{{- define "postgresql.hostname" -}}
{{- if eq .Values.database "postgresql" -}}
{{- if .Values.postgresql.enabled -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Values.postgresql.postgresServer -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- define "postgres.hostname" -}}
{{- if eq .Values.database "postgres" -}}
{{- if .Values.postgres.enabled -}}
{{- printf "%s-%s" .Release.Name "postgres" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Values.postgres.postgresServer -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
  Builds the repository names for use with local or private registries
*/}}
{{- define "celery.repository" -}}
{{- printf "%s" .Values.repositoryPrefix -}}/defectdojo-django
{{- end -}}

{{- define "django.nginx.repository" -}}
{{- printf "%s" .Values.repositoryPrefix -}}/defectdojo-nginx
{{- end -}}

{{- define "django.uwsgi.repository" -}}
{{- printf "%s" .Values.repositoryPrefix -}}/defectdojo-django
{{- end -}}

{{- define "initializer.repository" -}}
{{- printf "%s" .Values.repositoryPrefix -}}/defectdojo-django
{{- end -}}

