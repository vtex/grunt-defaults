module.exports = (pkg) ->
  console.log 'grunt-vtex >'.yellow, 'clean'.cyan
  clean:
    dist:
      files: [{
        dot: true
        src: [ pkg.dist ]
      }]
