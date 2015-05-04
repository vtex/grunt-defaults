fs = require 'fs'
path = require 'path'
normalizedPath = path.join(__dirname, 'configs')
require 'color'
configs = {}
for file in fs.readdirSync(normalizedPath)
  configPath = './configs/' + file
  configs[file.replace('.coffee', '')] = require(configPath)

module.exports = configs
