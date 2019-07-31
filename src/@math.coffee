module.exports = math = Math

math.sum   = (all)            -> sum=0; sum+=n for n in all; sum
math.deg   = (rad=0)          -> rad / @PI * 180
math.rad   = (deg=0)          -> deg / 180 * @PI
math.rand  = (min=0, max=100) -> @round(min+(max-min)*@random())
math.ceil2 = (n=0)            -> 2 ** @ceil(@log2(n))