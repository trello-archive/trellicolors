palette = require '../data/palette.coffee'
slugify = require '../utils/slugify.coffee'
write = require '../utils/write.coffee'

module.exports = ->
  data = "// Trello Brand Colors\n"

  for group, colors of palette
    data += "\n"

    for item in colors
      if item.alpha
        alpha = item.alpha * 100
        value = "fade(#{item.hex}, #{alpha}%)"
        data += "@#{item.varname}: #{value};\n"
      else
        data += "@#{item.varname}: #{item.hex};\n"

  write('brand-colors.less', data)
