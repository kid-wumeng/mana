GET = require('../GET')
SET = require('../SET')

module.exports = class Vector extends Float32Array

   constructor: (x, y) ->
      super(2)
      @x = x
      @y = y

   add: (v) -> new Vector(@x+v.x, @y+v.y)
   sub: (v) -> new Vector(@x-v.x, @y-v.y)
   mul: (s) -> new Vector(@x*s, @y*s)
   div: (s) -> new Vector(@x/s, @y/s)

   dot:     (v) -> @x*v.x + @y*v.y
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

GET Vector::, 'len',    -> Math.sqrt(@len_sq)
GET Vector::, 'len_sq', -> @x**2 + @y**2
GET Vector::, 'unit',   -> @mul(if len=@len then 1/len else 0)
GET Vector::, 'clone',  -> new Vector(@x, @y)

GET Vector::, 'x', -> @[0]
GET Vector::, 'y', -> @[1]
SET Vector::, 'x', (x) -> @[0] = x
SET Vector::, 'y', (y) -> @[1] = y