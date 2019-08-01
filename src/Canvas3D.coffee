module.exports = class Canvas3D extends Canvas

   constructor: ->
      super(arguments...); @color(0,0,0)

   call: (cb) -> gl = @el.getContext('webgl'); cb.call(gl, gl); @