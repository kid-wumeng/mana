Dict      = require('./Dict')
BinPacker = require('./BinPacker')

module.exports = class ImagePacker extends BinPacker

   constructor: ->
      super(arguments...)
      @images = new Dict

   add: (name, image) ->
      if arguments[0] instanceof Map
         arguments[0].forEach(@add.bind(@))
      else
         @images.set(name, image)
         super(name, image.w, image.h)
      return @

   run: ->
      return super()

   draw: (ctx, cb=->) ->
      ctx.canvas.size(@size.w, @size.h)
      @bins.forEach (bin, i) =>
         ctx.clearRect(0, 0, @size.w, @size.h)
         bin.dict.forEach (name, {x, y}) =>
            ctx.drawImage(@images.get(name), x, y)
         cb(ctx.canvas, i)
      return @