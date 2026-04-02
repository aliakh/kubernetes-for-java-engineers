{{/*
Common name helpers
*/}}
{{- define "microservices-intro-helm.name" -}}
microservices-intro
{{- end }}

{{- define "microservices-intro-helm.fullname" -}}
{{ include "microservices-intro-helm.name" . }}-{{ .Release.Name }}
{{- end }}


{{/*
Label: current date (label-safe format)
Only [A-Za-z0-9._-] allowed.
Example: 2025-11-23_17-05-33
*/}}
{{- define "microservices-intro-helm.currentDate" -}}
{{ now | date "2006-01-02_15-04-05" }}
{{- end }}


{{/*
Label: version (taken from Chart.appVersion)
*/}}
{{- define "microservices-intro-helm.version" -}}
{{ .Chart.AppVersion }}
{{- end }}


{{/*
Common reusable labels
*/}}
{{- define "microservices-intro-helm.commonLabels" -}}
app.kubernetes.io/managed-by: "Helm"
app.kubernetes.io/part-of: "microservices-intro"
helm.microservices-intro.io/date: {{ include "microservices-intro-helm.currentDate" . | quote }}
helm.microservices-intro.io/version: {{ include "microservices-intro-helm.version" . | quote }}
{{- end }}
