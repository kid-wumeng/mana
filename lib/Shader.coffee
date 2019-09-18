module.exports = class Shader

   constructor: (GL, vert, frag) ->
      @vert_shader = @create_vert_shader(GL, vert)
      @frag_shader = @create_frag_shader(GL, frag)
      @program     = @create_program(GL, @vert_shader, @frag_shader)
      @uniforms    = @create_uniforms(GL, @program)
      @attributes  = @create_attributes(GL, @program)

   create_vert_shader: (GL, vert) ->
      shader = GL.createShader(GL.VERTEX_SHADER)
      GL.shaderSource(shader, vert)
      GL.compileShader(shader)
      if not GL.getShaderParameter(shader, GL.COMPILE_STATUS)
         throw GL.getShaderInfoLog(shader)
      return shader

   create_frag_shader: (GL, frag) ->
      shader = GL.createShader(GL.FRAGMENT_SHADER)
      GL.shaderSource(shader, frag)
      GL.compileShader(shader)
      if not GL.getShaderParameter(shader, GL.COMPILE_STATUS)
         throw GL.getShaderInfoLog(shader)
      return shader

   create_program: (GL, vert_shader, frag_shader) ->
      program = GL.createProgram()
      GL.attachShader(program, vert_shader)
      GL.attachShader(program, frag_shader)
      GL.linkProgram(program)
      if not GL.getProgramParameter(program, GL.LINK_STATUS)
         throw GL.getProgramInfoLog(program)
      return program

   create_uniforms: (GL, program) ->
      uniforms = new Map
      for i in [0...GL.getProgramParameter(program, GL.ACTIVE_UNIFORMS)]
         { name } = GL.getActiveUniform(program, i)
         uniforms.set(name, GL.getUniformLocation(program, name))
      return uniforms

   create_attributes: (GL, program) ->
      attributes = new Map
      for i in [0...GL.getProgramParameter(program, GL.ACTIVE_ATTRIBUTES)]
         { name } = GL.getActiveAttrib(program, i)
         attributes.set(name, GL.getAttribLocation(program, name))
      return attributes