mana.canvas('2d').format().call ->
   @lineWidth = 3
   @strokeStyle = 'blue'
   @beginPath()
   @moveTo(0, 0)
   @lineTo(250, 250)
   @moveTo(250, 0)
   @lineTo(350, 250)
   @stroke()