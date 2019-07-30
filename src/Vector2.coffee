module.exports = class Vector2 extends require('./Vector')
   constructor: (x=0, y=0) ->
      super(2)
      Object.defineProperty @, 'x', get: (-> @[0]), set: ((x)-> @[0] = x)
      Object.defineProperty @, 'y', get: (-> @[1]), set: ((y)-> @[1] = y)
      @x = x
      @y = y
      Object.defineProperty @, 'dist',         get: -> Math.sqrt(@dist_sq)
      Object.defineProperty @, 'dist_sq',      get: -> @x**2 + @y**2
      Object.defineProperty @, 'dist_inverse', get: -> if (dist = @dist) > 0 then 1/dist else 0
      Object.defineProperty @, 'clone',        get: -> new Vector2(@x, @y)

   normal:       -> @mul(@dist_inverse);         @
   not:          -> @[i]=-n for n,i in @ when n; @
   add: ({x, y}) -> @x+=x; @y+=y;                @
   sub: ({x, y}) -> @x-=x; @y-=y;                @
   mul: (n)      -> @x*=n; @y*=n;                @
   div: (n)      -> @x/=n; @y/=n;                @
   dot: ({x, y}) -> @x*x + @y*y