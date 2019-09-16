module.exports = class Vector
   constructor: ->
      @init(arguments...)

   init: (x=0, y=x) ->
      @x=x; @y=y
      return @

   add: (v) -> new @constructor(@x+v.x, @y+v.y)
   sub: (v) -> new @constructor(@x-v.x, @y-v.y)
   mul: (s) -> new @constructor(@x*s, @y*s)
   div: (s) -> new @constructor(@x/s, @y/s)

   dot:     (v) -> @x*v.x + @y*v.y
   dist:    (v) -> Math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq
   direct:  (v) -> v.sub(@)

Object.defineProperty Vector::, 'len',    get: -> Math.sqrt(@len_sq)
Object.defineProperty Vector::, 'len_sq', get: -> @x**2 + @y**2
Object.defineProperty Vector::, 'unit',   get: -> @mul(if len=@len then 1/len else 0)
Object.defineProperty Vector::, 'clone',  get: -> new @constructor(@x, @y)

Vector.demo = ->
   v1 = new Vector(2, 3)
   v2 = new Vector(4, 5)
   console.log v1.add(v2)
   console.log v1.dot(v2)
   console.log v1.dist(v2)