GET = require('../GET')
SET = require('../SET')

module.exports = class Vector4 extends Float32Array

   constructor: (x=0, y=0, z=0, w=1) ->
      super(4)
      @[0]=x; @[1]=y; @[2]=z; @[3]=w

   zero:      -> @mul_me(0)
   normalize: -> @mul_me(if len=@len then 1/len else 0)

   add_me: (v) -> @[0]+=v[0]; @[1]+=v[1]; @[2]+=v[2]||0; @
   sub_me: (v) -> @[0]-=v[0]; @[1]-=v[1]; @[2]-=v[2]||0; @
   mul_me: (s) -> @[0]*=s; @[1]*=s; @[2]*=s; @
   div_me: (s) -> @[0]/=s; @[1]/=s; @[2]/=s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

   dot:   (v) -> @[0]*v[0] + @[1]*v[1] + @[2]*v[2]||0
   cross: (v) -> new Vector4(@[1]*v[2]-@[2]*v[1], @[2]*v[0]-@[0]*v[2], @[0]*v[1]-@[1]*v[0])

   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

GET Vector4::, 'len',    -> Math.sqrt(@len_sq)
GET Vector4::, 'len_sq', -> @[0]**2 + @[1]**2 + @[2]**2
GET Vector4::, 'unit',   -> @clone.normalize()
GET Vector4::, 'clone',  -> new Vector4(@[0],@[1],@[2],@[3])

GET Vector4::, 'x', -> @[0]
GET Vector4::, 'y', -> @[1]
GET Vector4::, 'z', -> @[2]
GET Vector4::, 'w', -> @[3]
SET Vector4::, 'x', (x) -> @[0] = x
SET Vector4::, 'y', (y) -> @[1] = y
SET Vector4::, 'z', (z) -> @[2] = z
SET Vector4::, 'w', (w) -> @[3] = w