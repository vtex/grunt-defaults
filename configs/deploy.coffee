module.exports = (pkg, options = {}) ->
  console.log 'grunt-vtex >'.yellow, 'deploy'.cyan
  shell:
    sync:
      command: "aws s3 sync --size-only #{pkg.dist} s3://vtex-io-us/#{pkg.name}/#{pkg.version}/"
    cp:
      command: "aws s3 cp --recursive #{pkg.dist} s3://vtex-io-us/#{pkg.name}/#{pkg.version}/"
    # O Bucket vtex-io usa a região São Paulo, para fallback em caso de problemas com vtex-io-us
    sync_br:
      command: "aws s3 sync --size-only #{pkg.dist} s3://vtex-io/#{pkg.name}/#{pkg.version}/"
    cp_br:
      command: "aws s3 cp --recursive #{pkg.dist} s3://vtex-io/#{pkg.name}/#{pkg.version}/"
    # Tarefas para copiar o package.json para a raiz do projeto publicado
    cp_pkg:
      command: "aws s3 cp package.json s3://vtex-io-us/#{pkg.name}/#{pkg.version}/"
    cp_br_pkg:
      command: "aws s3 cp package.json s3://vtex-io/#{pkg.name}/#{pkg.version}/"
