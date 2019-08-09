module.exports = class Scaling2 extends Matrix3

   value: (x=1, y=x) ->
      @[0]=x
      @[4]=y
      @