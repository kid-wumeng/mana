mana.canvas_2d(true).call (ctx) ->

   @lineWidth = 2
   @strokeStyle = 'blue'
   @beginPath()
   @moveTo(0, 0)
   @lineTo(250, 250)
   @moveTo(250, 0)
   @lineTo(350, 250)
   @stroke()

   console.log(ctx)
   console.log(ctx.canvas)
   console.log(ctx.canvas.constructor)