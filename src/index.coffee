module.exports =
   device: device
   math: math
   util: util

   Matrix3:          Matrix3
   Matrix4:          Matrix4
   Vector2:          Vector2
   Vector3:          Vector3
   Vector4:          Vector4
   Canvas:           Canvas
   Shader:           Shader
   ProjectionOrtho2: ProjectionOrtho2
   Rotation2:        Rotation2
   Scaling2:         Scaling2
   Translation2:     Translation2
   Clock:            Clock
   Color:            Color
   EventBus:         EventBus
   Tween:            Tween

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