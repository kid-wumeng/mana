Matrix3      = require('../math/Matrix3')
Vector2      = require('../math/Vector2')
Rect         = require('../shape/Rect')
Rotation2    = require('../transform/Rotation2')
Scaling2     = require('../transform/Scaling2')
Translation2 = require('../transform/Translation2')
VertexBuffer = require('../util/VertexBuffer')

module.exports = class Sprite

   constructor: ->
      @_shader = null
      @_texture = null
      @_w = 0
      @_h = 0
      @_vertices = new VertexBuffer(4, ['position', 2], ['texCoord', 2])

      @translation = new Translation2()
      @rotation    = new Rotation2()
      @scaling     = new Scaling2()
      @mvp         = new Matrix3()
      @scale(4)

   translate: (args...) -> @translation.value(args...)
   rotate:    (args...) -> @rotation.value(args...)
   scale:     (args...) -> @scaling.value(args...)

   shader:  (shader)  -> @_shader  = shader;  @
   texture: (texture) -> @_texture = texture; @

   texture_view: (texture_view) ->
      {min, max, w, h, W, H} = texture_view
      @_vertices
         .set(0, 'texCoord', 0, 0)
         .set(1, 'texCoord', 0, 1)
         .set(2, 'texCoord', 1, 0)
         .set(3, 'texCoord', 1, 1)

         console.log 0 * min.x + w
         console.log 1 * min.x + w
         @_texture_view = texture_view


      if @_w isnt W or @_h isnt H
         @_w = W
         @_h = H
         @_vertices
            .set(0, 'position', 0, 0)
            .set(1, 'position', 0, H)
            .set(2, 'position', W, 0)
            .set(3, 'position', W, H)
      @

   update: ->
      @mvp
         .init()
         .concat(@translation)
         .concat(@rotation)
         .concat(@scaling)

   render: ({canvas, stack}) ->
      stack.push(@mvp)
      if @texture
         canvas.call (gl) =>
            gl.bindTexture(gl.TEXTURE_2D, @_texture)

            gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer())
            gl.bufferData(gl.ARRAY_BUFFER, @_vertices, gl.STATIC_DRAW)

            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, gl.createBuffer())
            gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array([0,1,2, 2,1,3]), gl.STATIC_DRAW)

            gl.vertexAttribPointer(@_shader.locations['position'], 2, gl.FLOAT, false, 16, 0)
            gl.vertexAttribPointer(@_shader.locations['texCoord'], 2, gl.FLOAT, false, 16, 8)

            gl.uniformMatrix3fv(@_shader.locations['mvp'], false, stack.top)
            gl.uniform2fv(@_shader.locations['min'], @_texture_view.min)
            gl.uniform2f(@_shader.locations['size'], @_texture_view.w, @_texture_view.h)

            gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0)





Sprite.vert = '
   attribute vec2 position;
   attribute vec2 texCoord;
   varying vec2 _texCoord;
   uniform mat3 mvp;
   uniform vec2 min;
   uniform vec2 size;
   void main() {
      gl_Position = vec4(vec3(position.xy, 1)*mvp, 1);
      _texCoord = vec2(texCoord.x*size.x+min.x, texCoord.y*size.y+min.y);
   }
'

Sprite.frag = '
   precision mediump float;
   uniform sampler2D texture;
   varying vec2 _texCoord;
   void main() {
      vec4 tex = texture2D(texture, _texCoord.xy);
      gl_FragColor = vec4(tex.xyz, 1);
   }
'