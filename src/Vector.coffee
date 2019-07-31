module.exports = class Vector extends Float32Array
   constructor: ->
      super(arguments...)

   get: (i)       -> @[i] ? 0
   set: (i, n)    -> @[i] = n if Number.isFinite(n); @
   val: (vals...) -> @map_me (n,i) -> vals[i] ? 0

   map_me: (cb=->) -> @set(i, cb(n,i)) for n,i in @; @
   add_me: (v) -> @map_me (n,i) -> n+v[i]
   sub_me: (v) -> @map_me (n,i) -> n-v[i]
   mul_me: (s) -> @map_me (n,i) -> n*s
   div_me: (s) -> @map_me (n,i) -> n/s
   negate_me:  -> @map_me (n,i) -> -n||0
   normal_me:  -> @mul_me(@len_inverse)

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (v) -> @clone.mul_me(v)
   div: (v) -> @clone.div_me(v)
   negate:  -> @clone.negate_me()
   normal:  -> @clone.normal_me(@len_inverse)

   dot:     (v) -> math.sum(n*v[i] for n,i in @ when i < v.length)
   dist:    (v) -> math.sqrt(@dist_sq(v))
   dist_sq: (v) -> @sub(v).len_sq

Object.defineProperty Vector::, 'x', get: (-> @get(0)), set: ((n)-> @set(0,n))
Object.defineProperty Vector::, 'y', get: (-> @get(1)), set: ((n)-> @set(1,n))
Object.defineProperty Vector::, 'z', get: (-> @get(2)), set: ((n)-> @set(2,n))
Object.defineProperty Vector::, 'w', get: (-> @get(3)), set: ((n)-> @set(3,n))

Object.defineProperty Vector::, 'len',         get: -> math.sqrt(@len_sq)
Object.defineProperty Vector::, 'len_sq',      get: -> math.sum(n**2 for n in @)
Object.defineProperty Vector::, 'len_inverse', get: -> if len = @len then 1/len else 0
Object.defineProperty Vector::, 'clone',       get: -> new Vector(@)