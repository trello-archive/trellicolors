palette = require '../data/palette.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = {"pluginVersion": "1.0", "colors": []}

  for name, colors of palette
    for weight, hex of colors
      data.colors.push hex
    data.colors.push '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'

  json = JSON.stringify(data)

  write('trello.sketchpalette', json)
