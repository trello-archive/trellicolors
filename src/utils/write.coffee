fs = require 'fs'

write = (name, data) ->
  fs.writeFile "build/#{name}", data, (err) ->
    if err
      console.log err

module.exports = write
