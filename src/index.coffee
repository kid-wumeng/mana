module.exports =
   math: require('./math')
   util: require('./util')

   mat2:  (args...) -> new @math.Matrix2(args...)
   mat3:  (args...) -> new @math.Matrix3(args...)
   mat4:  (args...) -> new @math.Matrix4(args...)
   vec2:  (args...) -> new @math.Vector2(args...)
   vec3:  (args...) -> new @math.Vector3(args...)
   vec4:  (args...) -> new @math.Vector4(args...)
   clock: (args...) -> new @util.Clock(args...)
   bus:   (args...) -> new @util.MessageBus(args...)