canvas = document.createElement('canvas')
shader = new Shader(canvas.getContext('webgl2'),
"""
   #version 300 es
   uniform mat4 mvp;
   in vec4 position;
   void main(){
      gl_Position = position * mvp;
   }
""",
"""
   #version 300 es
   precision mediump float;
   out vec4 GL_color;
   void main(){
      GL_color = vec4(1.0, 1.0, 1.0, 1.0);
   }
""")
console.log shader