module.exports = class Rect
   constructor: (x, y, w, h) -> @set(x, y, w, h)
   set: (@x=0, @y=0,@w=0, @h=0) ->