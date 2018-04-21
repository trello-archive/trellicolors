palette = require '../data/palette.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = {"pluginVersion": "1.0", "colors": []}

  for name, colors of palette

    # Add hexes

    for weight, hex of colors
      data.colors.push hex

    # Add padding
    # There are 8 columns per row in the Sketch picker.
    # This helps organize the colors a bit.

    numColors = Object.keys(colors).length
    cols = 8
    continue if Number.isInteger(numColors / cols)

    rows = Math.floor(numColors / cols)

    remainder = cols - (numColors - (rows * cols))
    for x in [1..remainder]
      data.colors.push '#ffffff'


  json = JSON.stringify(data)

  write('trello.sketchpalette', json)
