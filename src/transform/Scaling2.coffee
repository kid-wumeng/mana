module.exports = class Scaling2 extends require('../math/Matrix3')

   value: (x=1, y=x) ->
      @[0]=x
      @[4]=y
      @