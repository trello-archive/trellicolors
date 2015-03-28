palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = "// Trello Brand Colors\n"

  for name, colors of palette
    data += "\n"
    for weight, hex of colors
      data += "@#{slugify(name)}-#{weight}: #{hex};\n"

  write('brand-colors.less', data)
