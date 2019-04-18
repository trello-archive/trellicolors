palette = require '../data/palette.coffee'
write = require '../utils/write.coffee'
hexRgb = require 'hex-rgb'

module.exports = ->
  console.log "i'm workin."

  data = {"compatibleVersion":"2.0", "pluginVersion":"2.21", "colors": []}

  for group, colors of palette

    # Add hexes

    for val in colors

      # Sketch Palette uses percent value for red, green, blue.
      rgb = hexRgb(val.hex)

      # sketch palette expects a percent value, but hex-rgb exports as 0-255
      red = rgb.red / 255
      green = rgb.green / 255
      blue = rgb.blue / 255

      alpha = val.alpha

      # alpha is a percent value (between 0 and 1). 
      # 1 is solid and a safe default.
      if !alpha
        alpha = 1 

      name = val.displayname

      item = { name, red, green, blue, alpha }

      data.colors.push item

    # Add padding
    # There are 8 columns per row in the Sketch picker.
    # This helps organize the colors a bit.

    numColors = Object.keys(colors).length
    cols = 8
    continue if Number.isInteger(numColors / cols)

    rows = Math.floor(numColors / cols)

    remainder = cols - (numColors - (rows * cols))
    for x in [1..remainder]
      blank = { 'name': null, 'red': '1', 'green': '1', 'blue': '1', 'alpha': '1' }
      data.colors.push blank


  json = JSON.stringify(data)

  write('trello.sketchpalette', json)
