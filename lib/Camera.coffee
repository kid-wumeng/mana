Matrix = require('./Matrix')
View   = require('./View')

module.exports = class Camera

   constructor: (x=0, y=x, w=innerWidth, h=innerHeight) ->
      @t = new Matrix()
      @s = new Matrix()
      @p = new Matrix().ortho(x, y, w, h)
      @bounding = new View(x, y, w, h)

   translate:    (args...) -> @t.translate(args...);    @
   translate_by: (args...) -> @t.translate_by(args...); @
   scale:        (args...) -> @s.scale(args...);        @
   scale_by:     (args...) -> @s.scale_by(args...);     @
   rotate:       (args...) -> @r.rotate(args...);       @

   focus: (x=0, y=x) ->
      return @translate(x-@w/2, y-@h/2)

Object.defineProperty Camera::, 'x',   get: -> @bounding.x
Object.defineProperty Camera::, 'y',   get: -> @bounding.y
Object.defineProperty Camera::, 'w',   get: -> @bounding.w
Object.defineProperty Camera::, 'h',   get: -> @bounding.h
Object.defineProperty Camera::, 'm',   get: -> @t.concat(@s)
Object.defineProperty Camera::, 'mvp', get: -> @p.concat(@m)