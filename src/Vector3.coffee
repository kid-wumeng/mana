module.exports = class Vector3 extends require('./Vector')
   constructor: (x=0, y=0, z=0) ->
      super(3)
      Object.defineProperty @, 'x', get: (-> @[0]), set: ((x)-> @[0] = x)
      Object.defineProperty @, 'y', get: (-> @[1]), set: ((y)-> @[1] = y)
      Object.defineProperty @, 'z', get: (-> @[2]), set: ((z)-> @[2] = z)
      @x = x
      @y = y
      @z = z
      Object.defineProperty @, 'dist',         get: -> Math.sqrt(@dist_sq)
      Object.defineProperty @, 'dist_sq',      get: -> @x**2 + @y**2 + @z**2
      Object.defineProperty @, 'dist_inverse', get: -> if (dist = @dist) > 0 then 1/dist else 0
      Object.defineProperty @, 'clone',        get: -> new Vector3(@x, @y, @z)

   normal:          -> @mul(@dist_inverse);         @
   not:             -> @[i]=-n for n,i in @ when n; @
   add: ({x, y, z}) -> @x+=x; @y+=y; @z+=z;         @
   sub: ({x, y, z}) -> @x-=x; @y-=y; @z-=z;         @
   mul: (n)         -> @x*=n; @y*=n; @z*=n;         @
   div: (n)         -> @x/=n; @y/=n; @z/=n;         @
   dot: ({x, y, z}) -> @x*x + @y*y + @z*z