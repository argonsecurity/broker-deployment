{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chart.fullname" -}}
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
{{- define "chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
CommonPodLabels:
example:
metadata:
  labels: 
{{ include common.podLabels . | indent 4 }}
*/}}
{{- define "common.podLabels" -}}
{{- if .Values.global.commonPodLabels }}
{{- with .Values.global.commonPodLabels -}}
{{ toYaml . }}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Image:
example: {{ include common.image .Values.brokerBitbucket }}
*/}}
{{- define "common.image" -}}
{{- $registry := coalesce .image.registry .global.registry "docker.io" -}}
{{- $repository := .image.repository -}}
{{- $tag := .image.tag | default "latest" -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end -}}