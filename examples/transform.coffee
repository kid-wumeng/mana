canvas = new mana.Canvas('webgl').color(0)
shader = new mana.Shader(canvas,
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
stack.push(new mana.ProjectionOrtho2().value(0, 0, canvas.w, canvas.h))
stack.push(new mana.Translation2().value(canvas.w/2, canvas.h/2))
stack.push(new mana.Rotation2().value(mana.math.rad(45)))
stack.push(new mana.Scaling2().value(2))
stack.push(new mana.Translation2().value(-50))

v1 = stack.top.transform(new mana.Vector2(0, 0))
v2 = stack.top.transform(new mana.Vector2(0, 100))
v3 = stack.top.transform(new mana.Vector2(100, 0))
v4 = stack.top.transform(new mana.Vector2(100, 100))

canvas.call (gl) ->
   gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
   gl.useProgram(shader.program)

   gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer())
   gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
      v1.x, v1.y, 1, 0, 0
      v2.x, v2.y, 0, 1, 0
      v3.x, v3.y, 0, 0, 1
      v4.x, v4.y, 1, 1, 0
   ]), gl.STATIC_DRAW)

   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, gl.createBuffer())
   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array([0,1,2, 2,1,3]), gl.STATIC_DRAW)

   gl.vertexAttribPointer(shader.locations['position'], 2, gl.FLOAT, false, 20, 0)
   gl.vertexAttribPointer(shader.locations['color'], 3, gl.FLOAT, false, 20, 8)

   gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0)