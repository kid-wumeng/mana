Vector  = require('./Vector')
{ GET } = require('./Helper')

module.exports = class Rect

   constructor: (x, y, w, h) ->
      @x=0; @y=0; @w=0; @h=0
      @set(x, y, w, h)

   set: (x=0, y=x, w=0, h=w) =>
      @x=x; @y=y; @w=w; @h=h
      return @

   overlap: (rect) =>
      x = Math.max(@min.x, rect.min.x)
      y = Math.max(@min.y, rect.min.y)
      w = Math.min(@max.x, rect.max.x) - x
      h = Math.min(@max.y, rect.max.y) - y
      if w > 0 and h > 0
         return new Rect(x, y, w, h)
      else
         return new Rect(0, 0, 0, 0)

GET Rect::, 'min',    -> new Vector(@x, @y)
GET Rect::, 'max',    -> new Vector(@x+@w, @y+@h)
GET Rect::, 'center', -> new Vector(@x+@w/2, @y+@h/2)
GET Rect::, 'area',   -> @w * @h