converters = require './src/converters'

for key, task of converters
  task() 
  console.log "Converting #{key}…"

console.log "\nDone! Everything is in /build!"
