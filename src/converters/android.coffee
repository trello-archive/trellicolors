palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'
hexRgb = require 'hex-rgb'

module.exports = ->
  data = """<?xml version="1.0" encoding="utf-8"?>
    <resources xmlns:tools="http://schemas.android.com/tools">\n"""

  for group, colors of palette
    data += "\n"
    for item in colors
      if item.alpha
        # Android uses #AARRGGBB, so get hex value of alpha and prepend to hex
        i = Math.round(item.alpha * 100) / 100;
        alpha = Math.round(i * 255);
        alphaHex = (alpha + 0x10000).toString(16).substr(-2).toUpperCase();
        value = "#" + alphaHex + item.hex.substr(1)
        data += "    <color name=\"#{item.varname}\" tools:ignore=\"UnusedResources\">#{value}</color>\n"
      else
        data += "    <color name=\"#{item.varname}\" tools:ignore=\"UnusedResources\">#{item.hex}</color>\n"

  data += "\n</resources>"

  write('brand_colors.xml', data)
