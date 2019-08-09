exports.Matrix2 = require('./Matrix2')
exports.Matrix3 = require('./Matrix3')
exports.Matrix4 = require('./Matrix4')
exports.Vector2 = require('./Vector2')
exports.Vector3 = require('./Vector3')
exports.Vector4 = require('./Vector4')

exports.sum   = (all)            -> sum=0; sum+=n for n in all; sum
exports.deg   = (rad=0)          -> rad / @PI * 180
exports.rad   = (deg=0)          -> deg / 180 * @PI
exports.rand  = (min=0, max=100) -> @round(min+(max-min)*@random())
exports.ceil2 = (n=0)            -> 2 ** @ceil(@log2(n))
exports.mix   = (a=0, b=0, t)    -> a*t + b*(1-t)

exports[name] = Math[name] for name in Object.getOwnPropertyNames(Math)