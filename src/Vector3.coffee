module.exports = class Vector3 extends Vector

   constructor: (x=0, y=0, z=0) ->
      super(3)
      Object.defineProperty @, 'x', get: (-> @[0]), set: ((x)-> @[0] = x)
      Object.defineProperty @, 'y', get: (-> @[1]), set: ((y)-> @[1] = y)
      Object.defineProperty @, 'z', get: (-> @[2]), set: ((z)-> @[2] = z)
      @x = x
      @y = y
      @z = z

      Object.defineProperty @, 'len',         get: -> Math.sqrt(@len_sq)
      Object.defineProperty @, 'len_sq',      get: -> @x**2 + @y**2 + @z**2
      Object.defineProperty @, 'len_inverse', get: -> if (len = @len) > 0 then 1/len else 0
      Object.defineProperty @, 'clone',       get: -> new Vector3(@x, @y, @z)

   negate:          -> @[i]=-n for n,i in @ when n; @
   normal:          -> @mul(@len_inverse);          @
   add: ({x, y, z}) -> @x+=x; @y+=y; @z+=z;         @
   sub: ({x, y, z}) -> @x-=x; @y-=y; @z-=z;         @
   mul: (n)         -> @x*=n; @y*=n; @z*=n;         @
   div: (n)         -> @x/=n; @y/=n; @z/=n;         @
   dot: ({x, y, z}) -> @x*x + @y*y + @z*z
   dist:   (v)      -> Math.sqrt(@distSq(v))
   distSq: (v)      -> @clone.sub(v).len_sq