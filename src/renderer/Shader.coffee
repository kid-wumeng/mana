module.exports = class Shader

   constructor: (canvas, vert, frag) ->
      @locations = {}

      canvas.call (gl) =>
         shader_vert = gl.createShader(gl.VERTEX_SHADER)
         shader_frag = gl.createShader(gl.FRAGMENT_SHADER)
         gl.shaderSource(shader_vert, vert)
         gl.shaderSource(shader_frag, frag)
         gl.compileShader(shader_vert)
         gl.compileShader(shader_frag)
         throw gl.getShaderInfoLog(shader_vert) if gl.getShaderParameter(shader_vert, gl.COMPILE_STATUS) is false
         throw gl.getShaderInfoLog(shader_frag) if gl.getShaderParameter(shader_frag, gl.COMPILE_STATUS) is false

         @program = program = gl.createProgram()
         gl.attachShader(program, shader_vert)
         gl.attachShader(program, shader_frag)
         gl.linkProgram(program)

         for i in [0...gl.getProgramParameter(program, gl.ACTIVE_ATTRIBUTES)]
            {name} = gl.getActiveAttrib(program, i)
            @locations[name] = gl.getAttribLocation(program, name)
            gl.enableVertexAttribArray(@locations[name])


         for i in [0...gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS)]
            {name} = gl.getActiveUniform(program, i)
            @locations[name] = gl.getUniformLocation(program, name)

         console.log @