module.exports = Math = window.Math

Math.sum      = (all)            -> sum=0; sum+=n for n in all; sum
Math.deg      = (rad=0)          -> rad / @PI * 180
Math.rad      = (deg=0)          -> deg / 180 * @PI
Math.rand     = (min=0, max=100) -> min+(max-min)*@random()
Math.rand_int = (min=0, max=100) -> @round(@rand(min, max))
Math.ceil_2   = (n=0)            -> 2 ** @ceil(@log2(n))
Math.mix      = (a=0, b=0, t)    -> a*t + b*(1-t)