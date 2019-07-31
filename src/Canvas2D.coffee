module.exports = class Canvas2D extends Canvas

   constructor: ->
      super(arguments...)
      @color(1,1,1)

   call: (cb) -> super(cb, @el.getContext('2d'))