require('../')

canvas = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(216))
ctx = canvas.getContext('2d')

do ->
   images = await new ImageLoader()
      .set('test-1', '/demo/assets/test-1.png')
      .set('test-2', '/demo/assets/test-2.png')
      .set('test-3', '/demo/assets/test-3.png')
      .set('test-4', '/demo/assets/test-4.png')
      .load()

   canvas.size(600, 600)
   bins = new ImagePacker().pack(images, canvas.w, canvas.h, 2)

   for [{ name, image }, x, y, w, h] in bins[0]
      ctx.drawImage(image, x, y)

   console.log bins