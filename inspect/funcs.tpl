{{range .Packages}}{{ $package := . }}{{range .Funcs}}{{$package.Name}}.{{.Name}}
{{end}}{{end}}