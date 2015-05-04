module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'deploy'.cyan
  shell:
    sync:
      command: "aws s3 sync --size-only #{pkg.deploy} s3://vtex-io-us/#{pkg.name}/"
    cp:
      command: "aws s3 cp --recursive #{pkg.deploy} s3://vtex-io-us/#{pkg.name}/"
    # O Bucket vtex-io usa a região São Paulo, para fallback em caso de problemas com vtex-io-us
    sync_br:
      command: "aws s3 sync --size-only #{pkg.deploy} s3://vtex-io/#{pkg.name}/"
    cp_br:
      command: "aws s3 cp --recursive #{pkg.deploy} s3://vtex-io/#{pkg.name}/"
