{{- define "metadata.labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}

{{- define "configmap.labels" -}}
current-date: {{ dateInZone "2006-01-02" (now) "UTC" | quote }}
version: {{ .Chart.Version | quote }}
{{- end -}}
