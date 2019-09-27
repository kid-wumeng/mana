ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed()).getContext('2d')
gl  = document.body.appendChild(document.createElement('canvas').move(0).fixed().size(innerWidth, innerHeight, 2).color(0)).getContext('webgl2')

gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
gl.enable(gl.BLEND)
gl.blendEquation(gl.FUNC_ADD)
gl.blendFuncSeparate(gl.ONE, gl.ZERO, gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)
gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)

do ->
   camera = new Camera()
   shader = new Shader(gl, SpriteRenderer.vert, SpriteRenderer.frag)

   texture = await new TextureSet(ctx, gl)
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .set('img-3', '/assets/img-3.png')
      .set('img-4', '/assets/img-4.png')
      .run()

   img1 = new SpriteNode().image(texture.ids.get('img-1')).translate(200).scale(1.5).alpha(.8)
   img2 = new SpriteNode().image(texture.ids.get('img-2')).translate(200).color(128, 255, 255)
   img3 = new SpriteNode().image(texture.ids.get('img-3'))

   root = new SpriteNode().translate(50)
   root.add(img2)
   root.add(img1.add(img3))
   root.translate_by(50)

   renderer = new SpriteRenderer(gl, shader, texture)
   renderer.update(root.list)
   renderer.render(camera.mvp)