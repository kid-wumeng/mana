module.exports = class Rect

   constructor: (x, y, w, h) ->
      @x=0; @y=0; @w=0; @h=0
      @set(x, y, w, h)

   set: (x=0, y=x, w=0, h=w) ->
      @x=x; @y=y; @w=w; @h=h
      return @

   overlap: (rect) ->
      w = this.w+rect.w - (Math.max(this.max.x, rect.max.x) - Math.min(this.min.x, rect.min.x))
      h = this.h+rect.h - (Math.max(this.max.y, rect.max.y) - Math.min(this.min.y, rect.min.y))
      return if w > 0 and h > 0 then w*h else 0

GET Rect::, 'min',    -> new Vector(@x, @y)
GET Rect::, 'max',    -> new Vector(@x+@w, @y+@h)
GET Rect::, 'center', -> new Vector(@x+@w/2, @y+@h/2)
GET Rect::, 'area',   -> @w*@h