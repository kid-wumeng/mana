module.exports = class ProjectionOrtho2 extends require('../math/Matrix3')

   constructor: ->
      super()
      if arguments.length then @value(arguments...)

   value: (l=0, t=0, r=0, b=0) ->
      @[0]=2/(r-l)
      @[2]=(l+r)/(l-r)
      @[4]=2/(t-b)
      @[5]=(b+t)/(b-t)
      @