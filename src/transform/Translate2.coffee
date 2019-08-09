module.exports = class Translate2 extends Matrix3

   val: (x=0, y=x) -> @[2]=x; @[5]=y

GET Translate2::, 'x', -> @[2]
GET Translate2::, 'y', -> @[5]
SET Translate2::, 'x', (x) -> @[2] = x
SET Translate2::, 'y', (y) -> @[5] = y