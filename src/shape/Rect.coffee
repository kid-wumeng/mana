Vector2 = require('../math/Vector2')

module.exports = class Rect

   constructor: (x, y, w, h) ->
      @min = new Vector2
      @max = new Vector2
      @w = 0
      @h = 0
      @set(x, y, w, h)

   set: (x=0, y=0, w=0, h=0) ->
      @min.x = x
      @min.y = y
      @max.x = x+w
      @max.y = y+h
      @w = w
      @h = h
      @