module.exports = class Canvas2D extends Canvas
   constructor: ->
      super(arguments...); @color(255,255,255,.5)

   call: (cb) -> ctx = @el.getContext('2d'); cb.call(ctx, ctx); @