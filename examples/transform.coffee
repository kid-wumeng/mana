canvas = mana.canvas('webgl').color(0)
shader = mana.shader(canvas,
'
   attribute vec4 position;
   attribute vec3 color;
   varying vec3 _color;
   void main() {
      gl_Position = position;
      _color = color;
   }
', '
   precision mediump float;
   varying vec3 _color;
   void main() {
      gl_FragColor = vec4(_color.rgb, 1);
   }
')




stack = new mana.MatrixStack3()


projection  = new mana.ProjectionOrtho2().value(0, 0, canvas.w, canvas.h)
scaling     = new mana.Scaling2().value(1)
translation = new mana.Translation2().value(100)
rotation    = new mana.Rotation2().value(mana.math.rad(0))

stack.push(projection)
stack.push(scaling)
stack.push(rotation)
stack.push(translation)

vertices = [
   new mana.Vector2(0,   0)
   new mana.Vector2(0, 100)
   new mana.Vector2(100, 0)
   new mana.Vector2(100, 100)
]

stack.top.transform(v) for v in vertices


canvas.call (gl) ->
   gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
   gl.useProgram(shader.program)

   gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer())
   gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
      vertices[0].x, vertices[0].y,  1, 0, 0
      vertices[1].x, vertices[1].y,  0, 1, 0
      vertices[2].x, vertices[2].y,  0, 0, 1
      vertices[3].x, vertices[3].y,  1, 1, 0
   ]), gl.STATIC_DRAW)
   gl.vertexAttribPointer(shader.locations['position'], 2, gl.FLOAT, false, 20, 0)
   gl.vertexAttribPointer(shader.locations['color'], 3, gl.FLOAT, false, 20, 8)

   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, gl.createBuffer())
   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array([0, 1, 2, 2, 1, 3]), gl.STATIC_DRAW)

   gl.drawElements(mode=gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0)