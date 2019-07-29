canvas = mana.canvas()
canvas.init()

canvas.call ->
   @fillRect(0, 0, 250, 250)

console.log canvas.w, canvas.h