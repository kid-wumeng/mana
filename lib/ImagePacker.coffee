module.exports = class ImagePacker extends require('./BinPacker')

   pack: (images, ctx) =>
      # calculate (x, y)
      for [name, image] in images
         @add([name, image], image.width, image.height)
      images = super()
      # draw to canvas
      ctx.canvas.size(@w, @h)
      return images.map ([[name, image], x, y, w, h]) =>
         ctx.drawImage(image, x, y)
         return [name, image, x, y, w, h]