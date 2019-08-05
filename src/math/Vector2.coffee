module.exports = class Vector2

   constructor: (@x=0, @y=0) ->

   zero:      -> @mul_me(0)
   normalize: -> @mul_me(if len=@len then 1/len else 0)

   add_me: (v) -> @x+v.x; @y+v.y; @
   sub_me: (v) -> @x-v.x; @y-v.y; @
   mul_me: (s) -> @x*s; @y*s; @
   div_me: (s) -> @x/s; @y/s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

   dot:     (v) -> @x*v.x + @y*v.y
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

get Vector2::, 'len',    -> Math.sqrt(@len_sq)
get Vector2::, 'len_sq', -> @x**2 + @y**2
get Vector2::, 'unit',   -> @clone.normalize()
get Vector2::, 'clone',  -> new Vector2(@x, @y)