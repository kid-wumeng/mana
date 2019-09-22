ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0)).getContext('2d')
gl  = document.body.appendChild(document.createElement('canvas').move(0).fixed().index(0)).getContext('webgl2')

do ->
   texture = new TextureSet()
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .set('img-3', '/assets/img-3.png')
      .set('img-4', '/assets/img-4.png')

   await texture.run(ctx, gl)