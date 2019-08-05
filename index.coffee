module.exports = mana =
   device:   require('./src/@device')
   math:     require('./src/@math')
   util:     require('./src/@util')
   Canvas:   require('./src/Canvas')
   Clock:    require('./src/Clock')
   Color:    require('./src/Color')
   EventBus: require('./src/EventBus')
   Vector2:  Vector2
   Vector3:  Vector3
   Vector4:  Vector4

   canvas: (args...) -> new @Canvas(args...)
   color:  (args...) -> new @Color(args...)
   mat:    (args...) -> new @Matrix(args...)
   tween:  (args...) -> new @Tween(args...)
   vec2:   (args...) -> new Vector2(args...)
   vec3:   (args...) -> new Vector3(args...)
   vec4:   (args...) -> new Vector4(args...)