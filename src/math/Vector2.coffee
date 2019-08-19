GET = require('../GET')
SET = require('../SET')

module.exports = class Vector2 extends Float32Array

   constructor: (x, y) ->
      super(2)
      @set(x, y)

   set: (x=0, y=0) ->
      @[0]=x; @[1]=y; @

   zero:      -> @mul_me(0)
   normalize: -> @mul_me(if len=@len then 1/len else 0)

   add_me: (v) -> @[0]+=v[0]; @[1]+=v[1]; @
   sub_me: (v) -> @[0]-=v[0]; @[1]-=v[1]; @
   mul_me: (s) -> @[0]*=s; @[1]*=s; @
   div_me: (s) -> @[0]/=s; @[1]/=s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

   dot:     (v) -> @[0]*v[0] + @[1]*v[1]
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

GET Vector2::, 'len',    -> Math.sqrt(@len_sq)
GET Vector2::, 'len_sq', -> @[0]**2 + @[1]**2
GET Vector2::, 'unit',   -> @clone.normalize()
GET Vector2::, 'clone',  -> new Vector2(@[0],@[1])

GET Vector2::, 'x', -> @[0]
GET Vector2::, 'y', -> @[1]
SET Vector2::, 'x', (x) -> @[0] = x
SET Vector2::, 'y', (y) -> @[1] = y