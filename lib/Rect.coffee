{ GET, SET } = require('./Helper')
Vector = require('./Vector')

module.exports = class Rect extends Float32Array

   constructor: (x, y, w, h) ->
      super(4).set(x, y, w, h)

   set: (x=0, y=x, w=0, h=w) ->
      @x=x; @y=y; @w=w; @h=h; @

   overlap: (rect) ->
      x = Math.max(@min.x, rect.min.x)
      y = Math.max(@min.y, rect.min.y)
      w = Math.min(@max.x, rect.max.x) - x
      h = Math.min(@max.y, rect.max.y) - y
      if w > 0 and h > 0
         return new Rect(x, y, w, h)
      else
         return new Rect(0, 0, 0, 0)

GET Rect::, 'x', -> @[0]
GET Rect::, 'y', -> @[1]
GET Rect::, 'w', -> @[2]
GET Rect::, 'h', -> @[3]
SET Rect::, 'x', (x) -> @[0] = x
SET Rect::, 'y', (y) -> @[1] = y
SET Rect::, 'w', (w) -> @[2] = w
SET Rect::, 'h', (h) -> @[3] = h

GET Rect::, 'area',   -> @w * @h
GET Rect::, 'min',    -> new Vector(@x,      @y)
GET Rect::, 'max',    -> new Vector(@x+@w,   @y+@h)
GET Rect::, 'mid',    -> new Vector(@x+@w/2, @y+@h/2)
GET Rect::, 'center', -> new Vector(@x+@w/2, @y+@h/2)