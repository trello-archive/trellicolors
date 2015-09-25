# Trellicolors

This script converts the Trello brand colors into various formats.

Various formats include…

- LESS, SCSS, and SASS variables
- XML (for Android)
- JSON

If you’re just looking for exported files, see `/build`.


# Applying colors

For how to use the palette, see the [Trello Brand
Guide](https://trello.com/about/branding#colors).


# Sketch Palette

We have one! To import…

- Install the [sketch-palettes
plugin](https://github.com/andrewfiorillo/sketch-palettes).
- Then follow the usage instructions to import
`/build/trello.sketchpalette`


# I want to contribute!

Okay! You need to…

- Install node
- Run `npm install`
- And finally, run `npm run convert`

The source is in `/src` and `index.coffee`. `convert` uses nodemon so
your changes (and errors) will show up as soon as you make them.
