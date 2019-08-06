module.exports = class Vector4

   constructor: (@x=0, @y=0, @z=0, @w=1) ->

   zero:      -> @mul_me(0)
   normalize: -> @mul_me(if len=@len then 1/len else 0)

   add_me: ({x, y, z=0}) -> @x+=x; @y+=y; @z+=z; @
   sub_me: ({x, y, z=0}) -> @x-=x; @y-=y; @z-=z; @
   mul_me: (s) -> @x*=s; @y*=s; @z*=s; @
   div_me: (s) -> @x/=s; @y/=s; @z/=s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

   dot:   ({x, y, z=0}) -> @x*x + @y*y + @z*z
   cross: ({x, y, z=0}) -> new Vector4(@y*z-@z*y, @z*x-@x*z, @x*y-@y*x)

   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

get Vector4::, 'len',    -> Math.sqrt(@len_sq)
get Vector4::, 'len_sq', -> @x**2 + @y**2 + @z**2
get Vector4::, 'unit',   -> @clone.normalize()
get Vector4::, 'clone',  -> new Vector4(@x, @y, @z, @w)