{{/* 

title: Interface mocking
author: https://github.com/matryer
description: Generate mocks of interfaces for use in test code
tags: testing,mocking,mock,stub,stubbing

*/}}{{ $code := . }}{{range .Packages}}package {{$code.TargetPackageName}}

import (
	"sync/atomic"
{{- range .Imports }}
	"{{ .Name }}"
{{- end }}
)
{{range .Interfaces}}{{$interface := .}}
// {{$interface.Name}}Mock is a mock implementation of {{$interface.Name}}.
type {{$interface.Name}}Mock struct {
	{{- range .Methods}}
	// {{.Name}}Func provides a mock implementation of {{.Name}}.
	{{.Name}}Func func{{. | Signature}}
	// {{.Name}}Calls represents the number of times {{.Name}} was called.
	{{.Name | Camel}}Calls int64
	{{- end}}
}
{{range .Methods}}
// {{.Name}} calls {{.Name}}Func.
func (m *{{$interface.Name}}Mock) {{.Name}}{{. | Signature}} {
	if m.{{.Name}}Func == nil {
		panic("call to {{$interface.Name}}Mock.{{.Name}} with nil {{.Name}}Func")
	}
	atomic.AddInt64(&m.{{.Name | Camel}}Calls, 1) // safe increase
	{{- if .ReturnArgs }}
	return m.{{.Name}}Func({{ .Args | ArgListNames }})
	{{- else }}
	m.{{.Name}}Func({{ .Args | ArgListNames }})
	{{- end }}
}

// {{.Name}}Calls gets the number of times the {{.Name}} method
// was called.
func (m *{{$interface.Name}}Mock) {{.Name}}Calls() int {
	return int(atomic.LoadInt64(&m.{{.Name | Camel}}Calls))
}
{{end}}
{{- end}}
{{- end}}