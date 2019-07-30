Canvas  = require('./src/Canvas')
device  = require('./src/device')
math    = require('./src/math')
Vector  = require('./src/Vector')
Vector2 = require('./src/Vector2')
Vector3 = require('./src/Vector3')
Vector4 = require('./src/Vector4')

module.exports =
   Canvas:  Canvas
   device:  device
   math:    math
   Vector:  Vector
   Vector2: Vector2
   Vector3: Vector3
   Vector4: Vector4

   canvas: Canvas.create
   vec2: -> new Vector2(arguments...)
   vec3: -> new Vector3(arguments...)
   vec4: -> new Vector4(arguments...)