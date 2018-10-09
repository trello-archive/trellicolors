palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = {}

  for group, colors of palette
    for name, hex of colors
      key = "#{slugify(name)}"
      data[key] = hex

  json = JSON.stringify(data, null, 2)

  write('brand-colors.json', json)

  json = JSON.stringify(data)

  write('brand-colors.min.json', json)
