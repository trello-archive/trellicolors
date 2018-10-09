slugify = (string, doUnderscore) ->

  string = string
    .replace(/[^\w ]+/g,'')
    .replace(/\ +/g,'-')

  if doUnderscore
    string = string.replace(/\-/g,'_')

  return string

module.exports = slugify
