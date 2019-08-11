animation = new mana.Animation(384, 384)
animation.split(32, 48)

canvas = new mana.Canvas('webgl').color(0)
shader = new mana.Shader(canvas,
'
   attribute vec4 position;
   attribute vec2 texcoord;
   varying vec2 _texcoord;
   void main() {
      gl_Position = position;
      _texcoord = texcoord;
   }
', '
   precision mediump float;
   uniform sampler2D texture;
   varying vec2 _texcoord;
   void main() {
      vec4 tex = texture2D(texture, _texcoord.xy);
      gl_FragColor = vec4(tex.xyz, 1);
   }
')

console.log mana
setTimeout ->
   console.log mana
, 300

stack = new mana.MatrixStack3()
stack.push(new mana.ProjectionOrtho2().value(0, 0, canvas.w, canvas.h))
stack.push(new mana.Translation2().value(canvas.w/2, canvas.h/2))
stack.push(new mana.Rotation2().value(mana.math.rad(0)))
stack.push(new mana.Scaling2().value(2))
stack.push(new mana.Translation2().value(-16, -24))

v1 = stack.top.transform(new mana.Vector2(0, 0))
v2 = stack.top.transform(new mana.Vector2(0, 48))
v3 = stack.top.transform(new mana.Vector2(32, 0))
v4 = stack.top.transform(new mana.Vector2(32, 48))

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

      { x, y, w, h } = animation.frames[0]

      gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer())
      gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
         v1.x, v1.y, x, y
         v2.x, v2.y, x, y+h
         v3.x, v3.y, x+w, y
         v4.x, v4.y, x+w, y+h
      ]), gl.STATIC_DRAW)

      gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, gl.createBuffer())
      gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array([0,1,2, 2,1,3]), gl.STATIC_DRAW)

      gl.vertexAttribPointer(shader.locations['position'], 2, gl.FLOAT, false, 16, 0)
      gl.vertexAttribPointer(shader.locations['texcoord'], 2, gl.FLOAT, false, 16, 8)

      gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0)