{{range .Packages}}{{ $package := . }}{{range .Interfaces}}{{$package.Name}}.{{.Name}}
{{end}}