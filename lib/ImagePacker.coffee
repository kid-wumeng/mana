module.exports = class ImagePacker extends require('./BinPacker')

   pack: (images) ->
      images.forEach (image, name) =>
         @add([name, image], image.width, image.height)
      super()
      @bins = @bins.map ([[name, image], x, y, w, h]) => [name, image, x, y, w, h]

   draw: (ctx) ->
      ctx.canvas.size(@w, @h)
      ctx.drawImage(image, x, y) for [name, image, x, y, w, h] in @bins
      return @