module.exports = class Vector4

   constructor: (@x=0, @y=0, @z=0, @w=1) ->

   zero:      -> @mul_me(0)
   normalize: -> @mul_me(if len=@len then 1/len else 0)

   add_me: (v) -> @x+v.x; @y+v.y; @z+v.z; @
   sub_me: (v) -> @x-v.x; @y-v.y; @z-v.z; @
   mul_me: (s) -> @x*s; @y*s; @z*s; @
   div_me: (s) -> @x/s; @y/s; @z/s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

   cross:   (v) -> new Vector4(@y*v.z-@z*v.y, @z*v.x-@x*v.z, @x*v.y-@y*v.x)
   dot:     (v) -> @x*v.x + @y*v.y + @z*v.z
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

get Vector4::, 'len',    -> Math.sqrt(@len_sq)
get Vector4::, 'len_sq', -> @x**2 + @y**2 + @z**2
get Vector4::, 'unit',   -> @clone.normalize()
get Vector4::, 'clone',  -> new Vector4(@x, @y, @z, @w)