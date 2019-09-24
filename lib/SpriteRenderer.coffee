module.exports = class SpriteRenderer

   constructor: (gl, shader, texture) ->
      @gl=gl
      @shader=shader
      @texture=texture
      @vao=gl.createVertexArray()
      @vbo_share=gl.createBuffer()
      @vbo=gl.createBuffer()
      @ebo=gl.createBuffer()
      @vertices=new Float32Array(0)
      @count=0
      gl.bindVertexArray(@vao)
      gl.bindBuffer(gl.ARRAY_BUFFER, @vbo_share)
      gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([0,0, 0,1, 1,0, 1,1]), gl.STATIC_DRAW)
      gl.vertexAttribPointer(shader.attributes['coord'], 2, gl.FLOAT, false, 8, 0)
      gl.enableVertexAttribArray(shader.attributes['coord'])
      gl.bindBuffer(gl.ARRAY_BUFFER, @vbo)
      gl.vertexAttribPointer(shader.attributes['id'], 1, gl.FLOAT, false, 36, 0)
      gl.vertexAttribPointer(shader.attributes['tx'], 1, gl.FLOAT, false, 36, 4)
      gl.vertexAttribPointer(shader.attributes['ty'], 1, gl.FLOAT, false, 36, 8)
      gl.vertexAttribPointer(shader.attributes['sx'], 1, gl.FLOAT, false, 36, 12)
      gl.vertexAttribPointer(shader.attributes['sy'], 1, gl.FLOAT, false, 36, 16)
      gl.vertexAttribPointer(shader.attributes['r'],  1, gl.FLOAT, false, 36, 20)
      gl.vertexAttribPointer(shader.attributes['g'],  1, gl.FLOAT, false, 36, 24)
      gl.vertexAttribPointer(shader.attributes['b'],  1, gl.FLOAT, false, 36, 28)
      gl.vertexAttribPointer(shader.attributes['a'],  1, gl.FLOAT, false, 36, 32)
      gl.vertexAttribDivisor(shader.attributes['id'], 1)
      gl.vertexAttribDivisor(shader.attributes['tx'], 1)
      gl.vertexAttribDivisor(shader.attributes['ty'], 1)
      gl.vertexAttribDivisor(shader.attributes['sx'], 1)
      gl.vertexAttribDivisor(shader.attributes['sy'], 1)
      gl.vertexAttribDivisor(shader.attributes['r'],  1)
      gl.vertexAttribDivisor(shader.attributes['g'],  1)
      gl.vertexAttribDivisor(shader.attributes['b'],  1)
      gl.vertexAttribDivisor(shader.attributes['a'],  1)
      gl.enableVertexAttribArray(shader.attributes['id'])
      gl.enableVertexAttribArray(shader.attributes['tx'])
      gl.enableVertexAttribArray(shader.attributes['ty'])
      gl.enableVertexAttribArray(shader.attributes['sx'])
      gl.enableVertexAttribArray(shader.attributes['sy'])
      gl.enableVertexAttribArray(shader.attributes['r'])
      gl.enableVertexAttribArray(shader.attributes['g'])
      gl.enableVertexAttribArray(shader.attributes['b'])
      gl.enableVertexAttribArray(shader.attributes['a'])
      gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, @ebo)
      gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array([0, 1, 2, 3]), gl.STATIC_DRAW)
      gl.bindVertexArray(null)

   update: (sprites=[]) ->
      { gl, vao, vbo } = @
      vertices = new Float32Array(9*sprites.length)
      vertices.set(sprite.vertices, 9*i) for sprite, i in sprites
      gl.bindVertexArray(vao)
      gl.bindBuffer(gl.ARRAY_BUFFER, vbo)
      gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.STREAM_DRAW)
      gl.bindVertexArray(null)
      @vertices = vertices
      @count = sprites.length

   render: (mvp) ->
      { gl, shader, texture, vao, count } = @
      gl.useProgram(shader.program)
      gl.uniformMatrix3fv(shader.uniforms['mvp'], false, mvp.elements)
      gl.uniform1i(shader.uniforms['table'], 0)
      gl.uniform1i(shader.uniforms['image'], 1)
      gl.activeTexture(gl.TEXTURE0); gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture.table)
      gl.activeTexture(gl.TEXTURE1); gl.bindTexture(gl.TEXTURE_2D_ARRAY, texture.image)
      gl.bindVertexArray(vao)
      gl.drawElementsInstanced(gl.TRIANGLE_STRIP, 4, gl.UNSIGNED_SHORT, 0, count)
      gl.bindVertexArray(null)

SpriteRenderer.vert =
"""
#version 300 es
precision mediump float;

uniform highp sampler2DArray table;
uniform mat3 mvp;

in vec2 coord;
in float id;
in float tx;
in float ty;
in float sx;
in float sy;
in float r;
in float g;
in float b;
in float a;

out vec3 texture_coord;
out vec4 color;

void main()
{
   float i = texture(table, vec3(id, 0, 0)).r;
   float W = texture(table, vec3(id, 0, 3)).r;
   float H = texture(table, vec3(id, 0, 4)).r;
   float x = texture(table, vec3(id, 0, 5)).r;
   float y = texture(table, vec3(id, 0, 6)).r;
   float w = texture(table, vec3(id, 0, 7)).r;
   float h = texture(table, vec3(id, 0, 8)).r;

   gl_Position = vec4(vec3(
      (coord.x * W - W/2.0) * sx + tx,
      (coord.y * H - H/2.0) * sy + ty,
      1
   ) * mvp, 1);

   texture_coord = vec3(
      x + (coord.x * w),
      y + (coord.y * h),
      i
   );

   color = vec4(r, g, b, a);
}
"""

SpriteRenderer.frag =
"""
#version 300 es
precision mediump float;

uniform highp sampler2DArray image;
in vec3 texture_coord;
in vec4 color;
out vec4 GL_color;

void main()
{
   vec4 texel = texture(image, texture_coord);

   if (texel.a != 0.0) {
      texel.r *= color.r;
      texel.g *= color.g;
      texel.b *= color.b;
   }

   GL_color = texel * color.a;
}
"""