module.exports = class Vector4
   constructor: (@x=0, @y=0, @z=0, @w=0) ->

   add: (v) -> new Vector4(@x+v.x, @y+v.y, @z+v.z)
   sub: (v) -> new Vector4(@x-v.x, @y-v.y, @z-v.z)
   mul: (s) -> new Vector4(@x*s, @y*s, @z*s)
   div: (s) -> new Vector4(@x/s, @y/s, @z/s)

   cross:   (v) -> new Vector4(@y*v.z-@z*v.y, @z*v.x-@x*v.z, @x*v.y-@y*v.x)
   dot:     (v) -> @x*v.x + @y*v.y + @z*v.z
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq

get Vector4::, 'len',    -> Math.sqrt(@len_sq)
get Vector4::, 'len_sq', -> @x**2 + @y**2 + @z**2
get Vector4::, 'unit',   -> @mul(if len=@len then 1/len else 0)
get Vector4::, 'clone',  -> new Vector4(@x, @y, @z, @w)