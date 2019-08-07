canvas = mana.canvas_webgl()
shader = canvas.shader('vert', '
   attribute vec4 a_position;
   void main() {
       gl_Position  = a_position;
   }
')

console.log shader