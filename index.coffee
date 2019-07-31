module.exports =
   device:  device
   math:    math
   util:    util
   Canvas:  Canvas
   Color:   Color
   Color3:  Color3
   Color4:  Color4
   Vector:  Vector

   canvas: (type)       -> document.createElement('canvas').init(type)
   color3: (r, g, b)    -> new Color3(r, g, b)
   color4: (r, g, b, a) -> new Color4(r, g, b, a)
   vec: -> new Vector(arguments)