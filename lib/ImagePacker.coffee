module.exports = class ImagePacker extends require('./BinPacker')

   pack: (images, W, H, gap) ->
      items = []
      images.forEach (image, name) ->
         items.push([{image, name}, image.w, image.h])
      return super(items, W, H, gap)