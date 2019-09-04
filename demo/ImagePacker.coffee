require('../')

canvas = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0))
CTX = canvas.getContext('2d')

do ->
   packer = new ImagePacker()
   loader = new ImageLoader()
      .add('test-1', '/demo/assets/test-1.png')
      .add('test-2', '/demo/assets/test-2.png')
      .add('test-3', '/demo/assets/test-3.png')
      .add('test-4', '/demo/assets/test-4.png')

   images = await loader.load()
   images = packer.pack(images, CTX)

   console.log images