ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0)).getContext('2d')

do ->
   images = await new ImageLoader()
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .set('img-3', '/assets/img-3.png')
      .set('img-4', '/assets/img-4.png')
      .load()

   packer = new ImagePacker(400, 400)
      .all(images)
      .run()
      .draw(ctx, console.log)

   console.log packer.views