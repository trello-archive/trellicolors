palette = require './data.coffee'
slugify = require './slugify.coffee'
fs = require 'fs'

makeJsonFile = =>
  data = {}

  for name, colors of palette
    for weight, hex of colors
      key = "#{slugify(name)}-#{weight}"
      data[key] = hex

  json = JSON.stringify(data, null, 2)

  fs.writeFile "build/brand-colors.json", json, (err) ->
    if err
      console.log err

module.exports = makeJsonFile
