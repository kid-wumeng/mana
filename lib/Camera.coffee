{ GET } = require('./Helper')

module.exports = class Camera extends require('./Rect')

   constructor: (canvas) ->
      super(0, 0, canvas.w, canvas.h)
      @p = new Matrix().ortho(0, 0, canvas.w, canvas.h)
      @v = new Matrix()

   view: (x, y) ->
      @set(x, y, @w, @h)
      @v.view(x, y)
      return @

GET Camera::, 'vp', -> @p.concat(@v)