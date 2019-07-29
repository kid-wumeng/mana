module.exports = ->
   canvas = document.createElement('canvas')

   Object.defineProperty canvas, 'w', get: -> canvas.width
   Object.defineProperty canvas, 'h', get: -> canvas.height