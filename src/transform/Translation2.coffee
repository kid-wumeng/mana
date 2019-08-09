module.exports = class Translation2 extends require('../math/Matrix3')

   value: (x=0, y=x) ->
      @[2]=x
      @[5]=y
      @

GET Translation2::, 'x', -> @[2]
GET Translation2::, 'y', -> @[5]
SET Translation2::, 'x', (x) -> @[2] = x
SET Translation2::, 'y', (y) -> @[5] = y