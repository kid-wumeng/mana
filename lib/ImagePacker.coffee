module.exports = class ImagePacker extends require('./BinPacker')

   pack: (images) ->
      for [name, image] in images
         @add([name, image], image.width, image.height)
      return super()

   draw: (ctx) ->
      ctx.canvas.size(@w, @h)
      ctx.drawImage(image, x, y) for [[name, image], x, y, w, h] in @bins
      return @