ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed()).getContext('2d')
gl  = document.body.appendChild(document.createElement('canvas').move(0).fixed().size(innerWidth, innerHeight, 2).color(0)).getContext('webgl2')

camera = new Camera

do ->
   gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
   gl.clearColor(0, 0, 0, 1);
   gl.clear(gl.COLOR_BUFFER_BIT)
   gl.enable(gl.BLEND)
   gl.blendEquation(gl.FUNC_ADD)
   gl.blendFuncSeparate(gl.ONE, gl.ZERO, gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)
   gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)

   texture = await new TextureSet(ctx, gl)
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .set('img-3', '/assets/img-3.png')
      .set('img-4', '/assets/img-4.png')
      .run()

   shader = new Shader(gl, SpriteRenderer.vert, SpriteRenderer.frag)
   renderer = new SpriteRenderer(gl, shader, texture)
   renderer.update([
      {vertices: [texture.ids.get('img-1'), 0, 0, 1, 1, 1, 1, 1, 1]}
   ])
   renderer.render(camera.mvp)