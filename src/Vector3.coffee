module.exports = class Vector3
   constructor: (@x=0, @y=0, @z=0) ->

   add: (v) -> new Vector3(@x+v.x, @y+v.y, @z+v.z)
   sub: (v) -> new Vector3(@x-v.x, @y-v.y, @z-v.z)
   mul: (s) -> new Vector3(@x*s, @y*s, @z*s)
   div: (s) -> new Vector3(@x/s, @y/s, @z/s)

   cross:   (v) -> new Vector3(@y*v.z-@z*v.y, @z*v.x-@x*v.z, @x*v.y-@y*v.x)
   dot:     (v) -> @x*v.x + @y*v.y + @z*v.z
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq

get Vector3::, 'len',    -> Math.sqrt(@len_sq)
get Vector3::, 'len_sq', -> @x**2 + @y**2 + @z**2
get Vector3::, 'unit',   -> @mul(if len=@len then 1/len else 0)
get Vector3::, 'clone',  -> new Vector3(@x, @y, @z)