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

canvas.call (gl) ->
   gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight)
   gl.useProgram(shader.program)
   gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer())
   gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
       0.0,  0.5,  1, 0, 0
      -0.5, -0.5,  0, 1, 0
       0.5, -0.5,  0, 0, 1
   ]), gl.STATIC_DRAW)
   gl.vertexAttribPointer(shader.locations['position'], size=2, type=gl.FLOAT, normalize=false, stride=20, offset=0)
   gl.vertexAttribPointer(shader.locations['color'], size=3, type=gl.FLOAT, normalize=false, stride=20, offset=8)
   gl.drawArrays(mode=gl.TRIANGLES, first=0, count=3)



m1 = mana.mat3([
   1, 0, 70
   0, 2, 80
   0, 0, 77
])


v1 = mana.vec3(1, 2, 3)
m1.transform(v1)
console.log v1
m1.inverse()
m1.transform(v1)
console.log v1