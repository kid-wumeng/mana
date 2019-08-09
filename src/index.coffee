module.exports =
   device: device
   math: math
   util: util

   mat3:   (args...) -> new Matrix3(args...)
   mat4:   (args...) -> new Matrix4(args...)
   vec2:   (args...) -> new Vector2(args...)
   vec3:   (args...) -> new Vector3(args...)
   vec4:   (args...) -> new Vector4(args...)
   canvas: (args...) -> new Canvas(args...)
   shader: (args...) -> new Shader(args...)
   clock:  (args...) -> new Clock(args...)
   color:  (args...) -> new Color(args...)
   bus:    (args...) -> new EventBus(args...)
   tween:  (args...) -> new Tween(args...)