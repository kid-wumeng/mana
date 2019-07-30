mana.canvas().init().call ->
   @lineWidth = 0.5
   @beginPath()
   @moveTo(0, 0)
   @lineTo(250, 250)
   @moveTo(250, 0)
   @lineTo(350, 250)
   @stroke()


v1 = mana.vec2(0, 0)
v2 = mana.vec2(4, 4)

console.log v2.distSq(v1)