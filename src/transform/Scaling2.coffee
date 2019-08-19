module.exports = class Scaling2 extends require('../math/Matrix3')

   constructor: ->
      super()
      if arguments.length then @value(arguments...)

   value: (x=1, y=x) ->
      @[0]=x
      @[4]=y
      @