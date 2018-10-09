converters = require './src/converters'

for key, task of converters
  task() 
  console.log "converting #{key}"

console.log "\nokay, everything is in /build!"
