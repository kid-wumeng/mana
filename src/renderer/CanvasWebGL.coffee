module.exports = class CanvasWebGL extends require('./Canvas')

   constructor: (options, mode='webgl') ->
      super(options, mode)

   shader: (type, code) -> @call (gl) ->
      shader = switch type
         when 'vert' then gl.createShader(gl.VERTEX_SHADER)
         when 'frag' then gl.createShader(gl.FRAGMENT_SHADER)
      gl.shaderSource(shader, code)
      gl.compileShader(shader)
      if not gl.getShaderParameter(shader, gl.COMPILE_STATUS)
         throw gl.getShaderInfoLog(shader)
      shader