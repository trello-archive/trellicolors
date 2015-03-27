palette = require './data.coffee'
slugify = require './slugify.coffee'
fs = require 'fs'

makeLessFile = =>
  data = "// Trello Brand Colors\n"

  for name, colors of palette
    data += "\n"
    for weight, hex of colors
      data += "@#{slugify(name)}-#{weight}: #{hex};\n"

  fs.writeFile "build/colors.less", data, (err) ->
    if err
      console.log err

module.exports = makeLessFile
