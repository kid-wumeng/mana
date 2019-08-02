{ sin, cos, PI } = Math

module.exports = class Tween
   constructor: -> @linear()

   linear:         -> @set (t) -> t
   ease_in:  (n=1) -> @set (t) -> t ** 2*n
   ease_out: (n=1) -> @set (t) -> 1 - (1-t) ** 2*n
   ease_in_out:    -> @set (t) -> t - sin(t*2*PI) / (2*PI)
   elastic:  (n=1) -> @set (t) -> (1 - cos(t*n*PI)) * (1 - t) + t

   set: (solve) ->
      @solve = (t) ->
         t = solve(t)
         t = 0 if t < 0
         t = 1 if t > 1
         t
      @