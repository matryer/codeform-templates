{{/* 

title: Interface mocking
author: https://github.com/matryer
description: Generate mocks of interfaces for use in test code
tags: testing,mocking,mock,stub,stubbing

*/}}{{range .Packages}}package {{.Name}}
{{range .Interfaces}}{{$interface := .}}
// Mocked{{$interface.Name}} is a mock implementation of {{$interface.Name}}.
type Mocked{{$interface.Name}} struct {
	{{- range .Methods}}
	// {{.Name}}Func provides a mock implementation of {{.Name}}.
	{{.Name}}Func func{{. | Signature}}
	// {{.Name}}Calls represents the number of times {{.Name}} was called.
	{{.Name}}Calls int
	{{- end}}
}
{{range .Methods}}
// {{.Name}} calls {{.Name}}Func.
func (m *Mocked{{$interface.Name}}) {{.Name}}{{. | Signature}} {
	if m.{{.Name}}Func == nil {
		panic("call to Mocked{{$interface.Name}}.{{.Name}} with nil {{.Name}}Func")
	}
	m.{{.Name}}Calls++
	{{- if .ReturnArgs }}
	return m.{{.Name}}Func({{ .Args | ArgListNames }})
	{{- else }}
	m.{{.Name}}Func({{ .Args | ArgListNames }})
	{{- end }}
}
{{end}}
{{- end}}
{{- end}}