palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = """<?xml version="1.0" encoding="utf-8"?>
    <resources xmlns:tools="http://schemas.android.com/tools">\n"""

  for group, colors of palette
    data += "\n"
    for name, hex of colors
      data += "    <color name=\"#{name}\" tools:ignore=\"UnusedResources\">#{hex}</color>\n"

  data += "\n</resources>"

  write('brand_colors.xml', data)
