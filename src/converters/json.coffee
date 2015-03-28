palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = {}

  for name, colors of palette
    for weight, hex of colors
      key = "#{slugify(name)}-#{weight}"
      data[key] = hex

  json = JSON.stringify(data, null, 2)

  write('brand-colors.json', json)
