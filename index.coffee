module.exports =
   device:  device
   math:    math
   util:    util
   Canvas:  Canvas
   Color:   Color
   Color3:  Color3
   Color4:  Color4
   Vector:  Vector
   Vector2: Vector2
   Vector3: Vector3
   Vector4: Vector4

   canvas: (type)       -> document.createElement('canvas').init(type)
   color3: (r, g, b)    -> new Color3(r, g, b)
   color4: (r, g, b, a) -> new Color4(r, g, b, a)
   vec2:   (x, y)       -> new Vector2(x, y)
   vec3:   (x, y, z)    -> new Vector3(x, y, z)
   vec4:   (x, y, z, w) -> new Vector4(x, y, z, w)