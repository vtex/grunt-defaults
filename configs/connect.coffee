module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'connect'.cyan
  connect:
    options:
      port: options.port ? 8000
    dist:
      options:
        open: 'http://localhost:<%= connect.options.port %>/'
        keepalive: true
        base: pkg.dist
    examples:
      options:
        open: 'http://localhost:<%= connect.options.port %>/examples/'
        keepalive: true
        base: '.'
