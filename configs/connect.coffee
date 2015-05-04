module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'connect'.cyan
  connect:
    options:
      port: options.port ? 8000
    examples:
      options:
        open: 'http://localhost:<%= connect.options.port %>/examples/'
        keepalive: true
        base: '.'
