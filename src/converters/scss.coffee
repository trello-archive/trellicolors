palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = "// Trello Brand Colors\n"

  for gruop, colors of palette
    data += "\n"
    for name, hex of colors
      data += "$#{slugify(name)}: #{hex};\n"

  write('brand-colors.scss', data)
  write('brand-colors.sass', data)
