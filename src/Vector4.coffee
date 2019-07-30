module.exports = class Vector4 extends require('./Vector')
   constructor: (x=0, y=0, z=0, w=0) ->
      super(4)
      Object.defineProperty @, 'x', get: (-> @[0]), set: ((x)-> @[0] = x)
      Object.defineProperty @, 'y', get: (-> @[1]), set: ((y)-> @[1] = y)
      Object.defineProperty @, 'z', get: (-> @[2]), set: ((z)-> @[2] = z)
      Object.defineProperty @, 'w', get: (-> @[3]), set: ((w)-> @[3] = w)
      @x = x
      @y = y
      @z = z
      @w = w
      Object.defineProperty @, 'dist',         get: -> Math.sqrt(@dist_sq)
      Object.defineProperty @, 'dist_sq',      get: -> @x**2 + @y**2 + @z**2 + @w**2
      Object.defineProperty @, 'dist_inverse', get: -> if (dist = @dist) > 0 then 1/dist else 0
      Object.defineProperty @, 'clone',        get: -> new Vector4(@x, @y, @z, @w)

   normal:             -> @mul(@dist_inverse);         @
   not:                -> @[i]=-n for n,i in @ when n; @
   add: ({x, y, z, w}) -> @x+=x; @y+=y; @z+=z; @w+=w;  @
   sub: ({x, y, z, w}) -> @x-=x; @y-=y; @z-=z; @w-=w;  @
   mul: (n)            -> @x*=n; @y*=n; @z*=n; @w*=n;  @
   div: (n)            -> @x/=n; @y/=n; @z/=n; @w/=n;  @
   dot: ({x, y, z, w}) -> @x*x + @y*y + @z*z + @w*w