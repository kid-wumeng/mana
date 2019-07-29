Canvas  = require('./src/Canvas')
device  = require('./src/device')
Vector  = require('./src/Vector')
Vector2 = require('./src/Vector2')

console.log 1112

module.exports =
   Canvas:  Canvas
   device:  device
   Vector:  Vector
   Vector2: Vector2

   canvas: Canvas.create