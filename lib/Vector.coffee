{ GET, SET } = require('./Helper')

module.exports = class Vector extends Float32Array

   constructor: (x, y) ->
      super(2)
      @[0] = x
      @[1] = y

   add: (v) => new Vector(@[0]+v[0], @[1]+v[1])
   sub: (v) => new Vector(@[0]-v[0], @[1]-v[1])
   mul: (s) => new Vector(@[0]*s, @[1]*s)
   div: (s) => new Vector(@[0]/s, @[1]/s)

   dot:     (v) => @[0]*v[0] + @[1]*v[1]
   dist:    (v) => Math.sqrt(@dist_sq(v))
   dist_sq: (v) => @sub(v).len_sq
   direct:  (v) => v.sub(@)

GET Vector::, 'len',    -> Math.sqrt(@len_sq)
GET Vector::, 'len_sq', -> @[0]**2 + @[1]**2
GET Vector::, 'unit',   -> @mul(if len=@len then 1/len else 0)
GET Vector::, 'clone',  -> new Vector(@[0], @[1])

GET Vector::, 'x', -> @[0]
GET Vector::, 'y', -> @[1]
SET Vector::, 'x', (x) -> @[0] = x
SET Vector::, 'y', (y) -> @[1] = y