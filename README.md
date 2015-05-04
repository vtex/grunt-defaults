# grunt-defaults

A Grunt convention-over-configuration meta-project.

## Usage

Add `@vtex/grunt-defaults` as a dependency on your project:

    npm i --save-dev @vtex/grunt-defaults

Each file in `configs/` exports a function that returns some piece of grunt configuration.

Use them to build the config object in your `Gruntfile`:

```
defaults = require '@vtex/grunt-defaults'
_ = require 'underscore'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  config = _.extend(
    defaults.webpack(pkg),
    {
      open:
        options:
          delay: 500
        dev:
          path: 'http://localhost:<%= connect.options.port %>/webpack-dev-server/'
    }
  )

  tasks =
    default: ['open:dev', 'webpack-dev-server']

  grunt.config.init config
  require('load-grunt-tasks')(grunt, {pattern: ['grunt-*']})
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks

```

## Contributing

Add a file to `configs/` that exports a function returning a grunt config object.

`index.coffee` auto-discovers new files.

------

VTEX - 2015
