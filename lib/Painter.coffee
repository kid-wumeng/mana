module.exports = class Painter

   constructor: ->
      @canvas = document.createElement('canvas').fixed().move(0).color(216).index(-1)
      @ctx = @canvas.getContext('2d')
      document.body.appendChild(@canvas)

   init: ->
      @clear()
      return @

   clear: ->
      @ctx.clearRect(0, 0, @canvas.w, @canvas.h)
      return @

   image: ->
      return new Promise (resolve) =>
         image = new Image()
         image.onload = -> resolve(image)
         image.src = @canvas.toDataURL("image/png")