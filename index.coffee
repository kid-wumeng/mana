exports.device   = device
exports.math     = math
exports.util     = util
exports.Buffer   = Buffer
exports.Canvas   = Canvas
exports.Canvas2D = Canvas2D
exports.Canvas3D = Canvas3D
exports.Color    = Color
exports.Matrix   = Matrix
exports.Vector2  = Vector2
exports.Vector3  = Vector3
exports.Vector4  = Vector4

exports.canvas_2d = (args...) -> new Canvas2D(args...)
exports.canvas_3d = (args...) -> new Canvas3D(args...)
exports.color     = (args...) -> new Color(args...)
exports.mat       = (args...) -> new Matrix(args...)
exports.vec2      = (args...) -> new Vector2(args...)
exports.vec3      = (args...) -> new Vector3(args...)
exports.vec4      = (args...) -> new Vector4(args...)

color = exports.color(10, 20, 30, .5)
console.log color.normal.rgb
console.log color.normal.rgba