{ sin, cos } = Math

module.exports = class Rotation2 extends require('../math/Matrix3')

   constructor: ->
      super()
      if arguments.length then @value(arguments...)

   value: (a) ->
      @[0]=cos(a); @[1]=-sin(a)
      @[3]=sin(a); @[4]=cos(a)
      @