module.exports = mana =
   device:   require('./src/@device')
   math:     require('./src/@math')
   util:     require('./src/@util')
   Canvas:   require('./src/Canvas')
   Clock:    require('./src/Clock')
   Color:    require('./src/Color')
   EventBus: require('./src/EventBus')
   Matrix2:   Matrix2
   Matrix3:   Matrix3
   Matrix4:   Matrix4
   Vector2:   Vector2
   Vector3:   Vector3
   Vector4:   Vector4

   canvas: (args...) -> new @Canvas(args...)
   color:  (args...) -> new @Color(args...)
   mat2:   (args...) -> new Matrix2(args...)
   mat3:   (args...) -> new Matrix3(args...)
   mat4:   (args...) -> new Matrix4(args...)
   tween:  (args...) -> new @Tween(args...)
   vec2:   (args...) -> new Vector2(args...)
   vec3:   (args...) -> new Vector3(args...)
   vec4:   (args...) -> new Vector4(args...)

m1 = mana.mat2([
   2, 0
   0, 3
])
v1 = mana.vec3(10, 10, 10)
v2 = mana.vec3(10, 12, 10)
m1.transform(v2)
console.log v2
console.log v1.cross(v2)
console.log v1.cross(v2).unit