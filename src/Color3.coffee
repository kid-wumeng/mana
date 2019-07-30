module.exports = class Color3 extends Color
   constructor: (r,g,b) ->
      super(3)
      Object.defineProperty @, 'r', get: (-> @[0]), set: (r)-> @[0] = if r > 1 then r/255 else r
      Object.defineProperty @, 'g', get: (-> @[1]), set: (g)-> @[1] = if g > 1 then g/255 else g
      Object.defineProperty @, 'b', get: (-> @[2]), set: (b)-> @[2] = if b > 1 then b/255 else b
      Object.defineProperty @, 'value', get: -> "rgb(#{Math.round(@r*255)},#{Math.round(@g*255)},#{Math.round(@b*255)})"
      Object.defineProperty @, 'clone', get: -> new Color3(@r, @g, @b)
      @set(r,g,b)

   set: (@r=0, @g=0, @b=0) -> @