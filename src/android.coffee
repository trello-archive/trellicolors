palette = require './data.coffee'
slugify = require './slugify.coffee'
fs = require 'fs'

makeAndroidXmlFile = =>
  data = """<?xml version="1.0" encoding="utf-8"?>
    <resources xmlns:tools="http://schemas.android.com/tools">\n"""

  for name, colors of palette
    data += "\n"
    for weight, hex of colors
      data += "    <color name=\"#{slugify(name, true)}_#{weight}\" tools:ignore=\"UnusedResources\">#{hex}</color>\n"

  data += "\n</resources>"

  fs.writeFile "build/brand_colors.xml", data, (err) ->
    if err
      console.log err

module.exports = makeAndroidXmlFile
