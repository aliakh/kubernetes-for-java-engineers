{{- define "configmap.labels" -}}
current-date: {{ dateInZone "2006-01-02" (now) "UTC" | quote }}
version: {{ .Chart.Version | quote }}
{{- end -}}

{{- define "dbName" -}}
{{ printf "%s-db" . }}
{{- end -}}

{{- define "serviceName" -}}
{{ printf "%s-service" . }}
{{- end -}}

{{- define "dbProbes" -}}
startupProbe:
  exec:
    command:
      - sh
      - -c
      - pg_isready -U postgres -d postgres
  failureThreshold: {{ .db.startup.failureThreshold }}
  periodSeconds: {{ .db.startup.periodSeconds }}
livenessProbe:
  exec:
    command:
      - sh
      - -c
      - pg_isready -U postgres -d postgres
  initialDelaySeconds: {{ .db.liveness.initialDelaySeconds }}
  periodSeconds: {{ .db.liveness.periodSeconds }}
  timeoutSeconds: {{ .db.liveness.timeoutSeconds }}
  failureThreshold: {{ .db.liveness.failureThreshold }}
readinessProbe:
  exec:
    command:
      - sh
      - -c
      - pg_isready -U postgres -d postgres
  initialDelaySeconds: {{ .db.readiness.initialDelaySeconds }}
  periodSeconds: {{ .db.readiness.periodSeconds }}
  timeoutSeconds: {{ .db.readiness.timeoutSeconds }}
  failureThreshold: {{ .db.readiness.failureThreshold }}
{{- end -}}

{{- define "containerProbes" -}}
startupProbe:
  httpGet:
    port: {{ .deployment.port }}
    path: {{ .deployment.startup.path }}
  failureThreshold: {{ .deployment.startup.failureThreshold }}
  timeoutSeconds: {{ .deployment.startup.timeoutSeconds }}
livenessProbe:
  httpGet:
    port: {{ .deployment.port }}
    path: {{ .deployment.liveness.path }}
  initialDelaySeconds: {{ .deployment.liveness.initialDelaySeconds }}
  periodSeconds: {{ .deployment.liveness.periodSeconds }}
  failureThreshold: {{ .deployment.liveness.failureThreshold }}
  timeoutSeconds: {{ .deployment.liveness.timeoutSeconds }}
readinessProbe:
  httpGet:
    port: {{ .deployment.port }}
    path: {{ .deployment.readiness.path }}
  initialDelaySeconds: {{ .deployment.readiness.initialDelaySeconds }}
  periodSeconds: {{ .deployment.readiness.periodSeconds }}
  timeoutSeconds: {{ .deployment.readiness.timeoutSeconds }}
  failureThreshold: {{ .deployment.readiness.failureThreshold }}
{{- end -}}