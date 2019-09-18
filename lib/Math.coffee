module.exports = Math = window.Math

Math.deg      = (rad=0)          -> rad / Math.PI * 180
Math.rad      = (deg=0)          -> deg / 180 * Math.PI
Math.rand     = (min=0, max=100) -> min+(max-min)*Math.random()
Math.rand_int = (min=0, max=100) -> Math.round(Math.rand(min, max))
Math.ceil_2   = (n=0)            -> 2 ** Math.ceil(Math.log2(n))
Math.mix      = (a=0, b=0, t)    -> a*t + b*(1-t)