Vector = require('./Vector')

module.exports = class Rect

   constructor: ->
      @init(arguments...)

   init: (x=0, y=x, w=0, h=w) ->
      @x=x; @y=y; @w=w; @h=h
      return @

   contain: (rect) ->
      { min, max } = rect
      return @min.x <= min.x and @min.y <= min.y and @max.x >= max.x and @max.y >= max.y

   overlap: (rect) ->
      { min, max } = rect
      return not (@min.x >= max.x or @min.y >= max.y or @max.x <= min.x or @max.y <= min.y)

   overlap_rect: (rect) ->
      { min, max } = rect
      x = Math.max(@min.x, min.x)
      y = Math.max(@min.y, min.y)
      w = Math.min(@max.x, max.x) - x
      h = Math.min(@max.y, max.y) - y
      if w > 0 and h > 0
         return new @constructor(x, y, w, h)
      else
         return new @constructor(0, 0, 0, 0)

Object.defineProperty Rect::, 'min',    get: -> new Vector(@x,      @y)
Object.defineProperty Rect::, 'max',    get: -> new Vector(@x+@w,   @y+@h)
Object.defineProperty Rect::, 'mid',    get: -> new Vector(@x+@w/2, @y+@h/2)
Object.defineProperty Rect::, 'area',   get: -> @w * @h
Object.defineProperty Rect::, 'center', get: -> @mid