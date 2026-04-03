{{- define "config_map.labels" -}}
currentDate: {{ dateInZone "2006-01-02" (now) "UTC" | quote }}
version: {{ .Chart.Version | quote }}
{{- end -}}

{{- define "ms.probes" -}}
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

{{- define "db.probes" -}}
  startupProbe:
    exec:
      command: ["sh", "-c", "pg_isready -U postgres -d postgres"]
    initialDelaySeconds: 5
    periodSeconds: 10
    timeoutSeconds: 10
    failureThreshold: 30
  livenessProbe:
    exec:
      command: ["sh", "-c", "pg_isready -U postgres -d postgres"]
    initialDelaySeconds: 20
    periodSeconds: 15
    timeoutSeconds: 10
    failureThreshold: 5
  readinessProbe:
    exec:
      command: ["sh", "-c", "pg_isready -U postgres -d postgres"]
    initialDelaySeconds: 5
    periodSeconds: 10
    timeoutSeconds: 5
    failureThreshold: 5
{{- end -}}
