palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = "// Trello Brand Colors\n"

  for group, colors of palette
    data += "\n"

    for item in colors
      if item.alpha
        value = "rgba(#{item.hex}, #{item.alpha})"
        data += "$#{item.varname}: #{value};\n"
      else
        data += "$#{item.varname}: #{item.hex};\n"

  write('brand-colors.scss', data)
  write('brand-colors.sass', data)
