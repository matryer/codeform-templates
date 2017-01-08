{{range .Packages}}{{ $package := . }}{{range .Structs}}{{$package.Name}}.{{.Name}}
{{end}}{{end}}