slugify = (string, doUnderscore) ->

  string = string.toLowerCase()
    .replace(/[^\w ]+/g,'')
    .replace(/ +/g,'-')

  if doUnderscore
    string = string.replace(/\-/g,'_')

  return string

module.exports = slugify
