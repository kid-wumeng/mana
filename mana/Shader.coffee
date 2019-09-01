module.exports = class Shader

   constructor: (gl, vert, frag) ->

      @program = gl.createProgram()
      @uniforms = {}
      @attributes = {}

      vs = gl.createShader(gl.VERTEX_SHADER)
      fs = gl.createShader(gl.FRAGMENT_SHADER)
      gl.shaderSource(vs, vert)
      gl.shaderSource(fs, frag)
      gl.compileShader(vs)
      gl.compileShader(fs)
      if gl.getShaderParameter(vs, gl.COMPILE_STATUS) is false then throw gl.getShaderInfoLog(vs)
      if gl.getShaderParameter(fs, gl.COMPILE_STATUS) is false then throw gl.getShaderInfoLog(fs)
      gl.attachShader(@program, vs)
      gl.attachShader(@program, fs)
      gl.linkProgram(@program)

      uniforms   = gl.getProgramParameter(@program, gl.ACTIVE_UNIFORMS)
      attributes = gl.getProgramParameter(@program, gl.ACTIVE_ATTRIBUTES)

      for i in [0...uniforms]
         {name} = gl.getActiveUniform(@program, i)
         @uniforms[name] = gl.getUniformLocation(@program, name)

      for i in [0...attributes]
         {name} = gl.getActiveAttrib(@program, i)
         @attributes[name] = gl.getAttribLocation(@program, name)