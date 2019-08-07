canvas = mana.canvas('2d').call ->
   @fillStyle = '#FFFFFF'
   @fillRect(0, 0, 200, 200)
   @strokeStyle = 'red'
   @moveTo(0, 0)
   @lineTo(400, 400)
   @stroke()