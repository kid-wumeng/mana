module.exports = class Canvas3D extends Canvas

   constructor: ->
      super(arguments...)
      @color(0,0,0)

   call: (cb) -> super(cb, @el.getContext('webgl'))