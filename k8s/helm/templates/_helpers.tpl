{{- define "config_map.labels" -}}
currentDate: {{ dateInZone "2006-01-02" (now) "UTC" | quote }}
version: {{ .Chart.Version | quote }}
{{- end -}}

{{- define "probes.actuator" -}}
{{- $port := . -}}
startupProbe:
  httpGet:
    path: /actuator/health
    port: {{ $port }}
  initialDelaySeconds: 5
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 60
livenessProbe:
  httpGet:
    path: /actuator/health/liveness
    port: {{ $port }}
  initialDelaySeconds: 20
  periodSeconds: 20
  timeoutSeconds: 5
  failureThreshold: 5
readinessProbe:
  httpGet:
    path: /actuator/health/readiness
    port: {{ $port }}
  initialDelaySeconds: 5
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 5
{{- end -}}
