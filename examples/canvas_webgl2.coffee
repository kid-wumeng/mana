canvas = mana.canvas_webgl2()
shader = canvas.shader('vert', '
   attribute vec4 a_position;
   void main() {
       gl_Position  = a_position;
   }
')