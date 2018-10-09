palette = require '../data/palette.coffee'
write = require '../utils/write.coffee'
hexRgb = require 'hex-rgb'

module.exports = ->
  console.log "i'm workin."

  data = {"compatibleVersion":"2.0", "pluginVersion":"2.14", "colors": []}

  for group, colors of palette

    # Add hexes

    for name, hex of colors
      # Sketch Palette uses percent value for red, green, blue, and alpha.
      rgba = hexRgb(hex)

      # sketch palette expects a percent value, but hex-rgb exports as 0-255
      red = rgba.red / 255
      green = rgba.green / 255
      blue = rgba.blue / 255

      # hex-rgb exports alpha as 255 if omitted, or 0-1 if included.
      if rgba.alpha == 255
        alpha = 1
      else
        alpha = rgba.alpha

      percentRgba = { red, green, blue, alpha }

      data.colors.push percentRgba

    # Add padding
    # There are 8 columns per row in the Sketch picker.
    # This helps organize the colors a bit.

    numColors = Object.keys(colors).length
    cols = 8
    continue if Number.isInteger(numColors / cols)

    rows = Math.floor(numColors / cols)

    remainder = cols - (numColors - (rows * cols))
    for x in [1..remainder]
      blank = { 'red': '1', 'green': '1', 'blue': '1', 'alpha': '1' }
      data.colors.push blank


  json = JSON.stringify(data)

  write('trello.sketchpalette', json)
