module.exports = Image

Object.defineProperty Image::, 'w', get: -> @width
Object.defineProperty Image::, 'h', get: -> @height

Image.DEMO = ->
   ImageLoader = require('./ImageLoader')
   images = await new ImageLoader()
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .load()
   images.forEach (name, image) -> console.log name, image.w, image.h