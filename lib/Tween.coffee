{ sin, cos, PI } = Math

module.exports = class Tween

   constructor: -> @linear()
   set: (solve) => @solve = solve; @

   linear:         =>         @set (x) => x
   ease_in:  (n=1) => a=2*n;  @set (x) => x**a
   ease_out: (n=1) => a=2*n;  @set (x) => 1-(1-x)**a
   ease_in_out:    => a=2*PI; @set (x) => x-sin(a*x)/a