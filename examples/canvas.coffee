mana.canvas('2d').insert().fullScreen().call ->
   @lineWidth = 3
   @strokeStyle = 'blue'
   @beginPath()
   @moveTo(0, 0)
   @lineTo(250, 250)
   @moveTo(250, 0)
   @lineTo(350, 250)
   @stroke()

v1 = mana.vec(6, 7, 8, 1)
v2 = mana.vec(2, 2, 2, 6)

console.log v1.dot(v2)
