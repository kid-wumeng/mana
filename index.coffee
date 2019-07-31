exports.device    = device
exports.math      = math
exports.util      = util
exports.Buffer    = Buffer
exports.Canvas    = Canvas
exports.Canvas2D  = Canvas2D
exports.Canvas3D  = Canvas3D
exports.Color     = Color
exports.Quartette = Quartette
exports.Vector    = Vector

exports.canvas_2d = (args...) -> new Canvas2D(args...)
exports.canvas_3d = (args...) -> new Canvas3D(args...)
exports.color     = (args...) -> new Color(args...)
exports.vec       = (args...) -> new Vector(args...)