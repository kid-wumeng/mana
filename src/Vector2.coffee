module.exports = class Vector2
   constructor: (@x=0, @y=0) ->

   add: (v) -> new Vector2(@x+v.x, @y+v.y)
   sub: (v) -> new Vector2(@x-v.x, @y-v.y)
   mul: (s) -> new Vector2(@x*s, @y*s)
   div: (s) -> new Vector2(@x/s, @y/s)

   dot:     (v) -> @x*v.x + @y*v.y
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq

get Vector2::, 'len',    -> Math.sqrt(@len_sq)
get Vector2::, 'len_sq', -> @x**2 + @y**2
get Vector2::, 'unit',   -> @mul(if len=@len then 1/len else 0);
get Vector2::, 'clone',  -> new Vector2(@x, @y)