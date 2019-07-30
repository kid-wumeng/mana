module.exports = class Color4 extends require('./Color')
   constructor: (r,g,b,a) ->
      super(4)
      Object.defineProperty @, 'r', get: (-> @[0]), set: (r)-> @[0] = if r > 1 then r/255 else r
      Object.defineProperty @, 'g', get: (-> @[1]), set: (g)-> @[1] = if g > 1 then g/255 else g
      Object.defineProperty @, 'b', get: (-> @[2]), set: (b)-> @[2] = if b > 1 then b/255 else b
      Object.defineProperty @, 'a', get: (-> @[3]), set: (a)-> @[3] = if a > 1 then a/255 else a
      @set(r,g,b,a)
      Object.defineProperty @, 'value', get: -> "rgba(#{Math.round(@r*255)},#{Math.round(@g*255)},#{Math.round(@b*255)},#{@a})"
      Object.defineProperty @, 'clone', get: -> new Color4(@r, @g, @b, @a)

   set: (@r=0, @g=0, @b=0, @a=1) -> @