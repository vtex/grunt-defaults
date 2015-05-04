path = require 'path'
distConfig = require path.join(process.cwd(), 'webpack.dist.config.js')
devConfig = require path.join(process.cwd(), 'webpack.config.js')

module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'webpack'.cyan
  webpack:
    options: distConfig
    dist:
      cache: false

  'webpack-dev-server':
    options:
      hot: true
      port: options.port ? 8000
      webpack: devConfig
      contentBase: pkg.src
    start:
      keepAlive: true
