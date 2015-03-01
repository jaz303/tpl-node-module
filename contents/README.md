# {{ $module_name }}

## Installation

{% if $frontend_module %}

### Browserify

{% end %}

Get it:

    $ npm install --save {{ $module_name }}

Require it:

	var {{ $module_name }} = require('{{ $module_name }}');

{% if $frontend_module %}

### UMD

Copy or paste `build/{{ $module_name }}.js` or `build/{{ $module_name }}.min.js` into your project.

{% end %}

## Copyright &amp; License

&copy; {{ $today.year }} {{ $author_name }} [ [@{{ $author_twitter }}](http://twitter.com/{{ $author_twitter }}) / [{{ $author_email }}](mailto:{{ $author_email }}) ]

Released under the {{ $license }} license.
