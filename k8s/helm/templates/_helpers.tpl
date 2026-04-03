{{- define "config_map.labels" -}}
currentDate: {{ dateInZone "2006-01-02 15:04:05" (now) "UTC" | quote }}
version: {{ .Chart.Version | quote }}
{{- end -}}
