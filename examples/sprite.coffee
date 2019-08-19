texture_view = new mana.TextureView(384)
texture_views = texture_view.split(32, 48)

canvas = new mana.Canvas('webgl').color(0)
shader = new mana.Shader(canvas, mana.Sprite.vert, mana.Sprite.frag)

stack = new mana.MatrixStack3()
stack.push(new mana.ProjectionOrtho2().value(0, 0, canvas.w, canvas.h))

new mana.Loader()
   .image('a', '/assets/images/a.jpg')
   .image('b', '/assets/images/b.png')
   .call()
   .on 'finish', ({ images }) -> canvas.call (gl) ->
      texture = gl.createTexture()
      gl.bindTexture(gl.TEXTURE_2D, texture)
      gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, images['b'])
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST)

      gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
      gl.useProgram(shader.program)

      sprite = new mana.Sprite()
      sprite.shader(shader)
      sprite.texture(texture)
      sprite.texture_view(texture_views[1])
      sprite.update()
      sprite.render({canvas, stack})