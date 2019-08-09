module.exports = class Shader

   constructor: (canvas, vert, frag) ->
      canvas.call (gl) =>
         @program = gl.createProgram()
         @locations = {}

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

         attributes = gl.getProgramParameter(@program, gl.ACTIVE_ATTRIBUTES)
         uniforms   = gl.getProgramParameter(@program, gl.ACTIVE_UNIFORMS)

         for i in [0...attributes]
            {name} = gl.getActiveAttrib(@program, i)
            @locations[name] = gl.getAttribLocation(@program, name)
            gl.enableVertexAttribArray(@locations[name])

         for i in [0...uniforms]
            {name} = gl.getActiveUniform(@program, i)
            @locations[name] = gl.getUniformLocation(@program, name)