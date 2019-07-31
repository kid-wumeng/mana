exports.device    = device
exports.math      = math
exports.util      = util
exports.Buffer    = Buffer
exports.Canvas    = Canvas
exports.Color     = Color
exports.Matrix    = Matrix
exports.Quartette = Quartette
exports.Vector    = Vector

exports.canvas = (args...) -> new Canvas(args...)
exports.color  = (args...) -> new Color(args...)
exports.mat    = (args...) -> new Matrix(args...)
exports.vec    = (args...) -> new Vector(args...)

mat = new Matrix([

])

console.log mat