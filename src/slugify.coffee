slugify = (string) ->
  return string.toLowerCase()
    .replace(/[^\w ]+/g,'')
    .replace(/ +/g,'-')

module.exports = slugify
