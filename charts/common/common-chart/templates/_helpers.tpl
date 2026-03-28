{{- define "common-chart.selectorLabels" -}}
app: {{ .Release.Name }}
{{- end -}}

{{- define "common-chart.fullname" -}}
{{- .Values.fullname | default .Release.Name -}}
{{- end -}}