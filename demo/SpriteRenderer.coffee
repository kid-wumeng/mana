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

   sprites = [{
      vertices: [id=texture.ids.get('img-2'), tx=200, ty=200, sx=1, sy=1, r=0.5, g=1, b=1, a=1]
   },{
      vertices: [id=texture.ids.get('img-1'), tx=200, ty=200, sx=1, sy=1, r=1, g=1, b=1, a=0.8]
   }]

   renderer = new SpriteRenderer(gl, shader, texture)
   renderer.update(sprites)
   renderer.render(camera.mvp)