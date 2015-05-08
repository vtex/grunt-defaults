path = require 'path'

module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'webpack'.cyan

  distConfig = options.distConfig ? require path.join(process.cwd(), 'webpack.dist.config.js')
  devConfig = options.devConfig ? require path.join(process.cwd(), 'webpack.config.js')

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
