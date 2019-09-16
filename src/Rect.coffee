Vector = require('./Vector')

module.exports = class Rect
   constructor: ->
      @init(arguments...)

   init: (x=0, y=x, w=0, h=w) ->
      @x=x; @y=y; @w=w; @h=h
      return @

   overlap: (rect) ->
      x = Math.max(@min.x, rect.min.x)
      y = Math.max(@min.y, rect.min.y)
      w = Math.min(@max.x, rect.max.x) - x
      h = Math.min(@max.y, rect.max.y) - y
      if w > 0 and h > 0
         return new @constructor(x, y, w, h)
      else
         return new @constructor(0, 0, 0, 0)

Object.defineProperty Rect::, 'min',    get: -> new Vector(@x,      @y)
Object.defineProperty Rect::, 'max',    get: -> new Vector(@x+@w,   @y+@h)
Object.defineProperty Rect::, 'mid',    get: -> new Vector(@x+@w/2, @y+@h/2)
Object.defineProperty Rect::, 'area',   get: -> @w * @h
Object.defineProperty Rect::, 'center', get: -> @mid

Rect.demo = ->
   console.log 'rect               =>', rect = new Rect(0, 0, 200, 300)
   console.log 'rect.min           =>', rect.min
   console.log 'rect.mid           =>', rect.mid
   console.log 'rect.max           =>', rect.max
   console.log 'rect.area          =>', rect.area
   console.log 'rect.center        =>', rect.center
   console.log 'rect.overlap(rect) =>', rect.overlap(new Rect(150, 150, 100, 120))