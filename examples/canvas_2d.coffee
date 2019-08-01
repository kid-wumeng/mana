mana.canvas('2d').full_screen.call ->

   @lineWidth = 2
   @strokeStyle = 'blue'
   @beginPath()
   @moveTo(0, 0)
   @lineTo(250, 250)
   @moveTo(250, 0)
   @lineTo(350, 250)
   @stroke()

   console.log(@)
   console.log(@canvas)