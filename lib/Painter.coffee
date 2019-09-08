module.exports = class Painter

   constructor: ->
      @canvas = document.createElement('canvas').fixed().move(0).color(216).index(1)
      @ctx = @canvas.getContext('2d')
      document.body.appendChild(@canvas)