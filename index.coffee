Canvas  = require('./src/Canvas')
device  = require('./src/device')
math    = require('./src/math')
Vector  = require('./src/Vector')
Vector2 = require('./src/Vector2')

module.exports =
   Canvas:  Canvas
   device:  device
   math:    math
   Vector:  Vector
   Vector2: Vector2

   canvas: Canvas.create