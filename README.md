# Codeform templates

This repository contains Codeform templates which are all accessible
via the `template:{path}` source.

For example, the [packages inspection template](https://github.com/matryer/codeform-templates/blob/master/inspect/packages.tpl) 
is accessible via `template:inspect/packages`.

## Contributing

The idea is that together we build up a series of useful utilities, which will
eventually be browsable and searchable.

In that spirit, any templates should begin with a metadata payload which will be
ignored at render time, inside a template comment:

```liquid
{{/* 

title: Template title
author: https://github.com/matryer
description: Generate mocks of interfaces for use in test code
example.source: https://link.to/some/source/file
tags: testing,mocking,something

*/}}
```

* `title` - Human readable but short title of the template
* `description` - Short one-line description of the template
* `author` - Link to GitHub user account
* `example.source` - URL of source file that will be used to preview the template
* `tags` - Comma separated list of related tags
