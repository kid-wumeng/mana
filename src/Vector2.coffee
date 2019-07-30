module.exports = class Vector2 extends Vector

   constructor: (x=0, y=0) ->
      super(2)
      Object.defineProperty @, 'x', get: (-> @[0]), set: ((x)-> @[0] = x)
      Object.defineProperty @, 'y', get: (-> @[1]), set: ((y)-> @[1] = y)
      @x = x
      @y = y

      Object.defineProperty @, 'len',         get: -> Math.sqrt(@len_sq)
      Object.defineProperty @, 'len_sq',      get: -> @x**2 + @y**2
      Object.defineProperty @, 'len_inverse', get: -> if (len = @len) > 0 then 1/len else 0
      Object.defineProperty @, 'clone',       get: -> new Vector2(@x, @y)

   normal:       -> @mul(@len_inverse);          @
   not:          -> @[i]=-n for n,i in @ when n; @
   add: ({x, y}) -> @x+=x; @y+=y;                @
   sub: ({x, y}) -> @x-=x; @y-=y;                @
   mul: (n)      -> @x*=n; @y*=n;                @
   div: (n)      -> @x/=n; @y/=n;                @
   dot: ({x, y}) -> @x*x + @y*y
   dist:   (v)   -> Math.sqrt(@distSq(v))
   distSq: (v)   -> @clone.sub(v).len_sq