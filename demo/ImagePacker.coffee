require('../')

canvas = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0))
ctx = canvas.getContext('2d')

do ->
   images = await new ImageLoader()
      .add('test-1', '/demo/assets/test-1.png')
      .add('test-2', '/demo/assets/test-2.png')
      .add('test-3', '/demo/assets/test-3.png')
      .add('test-4', '/demo/assets/test-4.png')
      .load()

   packer = new ImagePacker()
   packer.pack(images)
   packer.draw(ctx)

   console.log packer.bins