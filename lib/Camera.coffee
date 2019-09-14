Rect   = require('./Rect')
Matrix = require('./Matrix')

module.exports = class Camera extends Matrix

   constructor: (canvas) ->
      super()
      @canvas = canvas
      @model = new Matrix()
      @view = new Rect()
      @update()

   update: ->
      { w, h } = @canvas
      { tx, ty, sx, sy } = @model
      x = tx
      y = ty
      w = w/sx
      h = h/sy
      @ortho(x, y, w, h)
      @view.set(x, y, w, h)
      @

   focus:        (x=0, y=x) -> @translate(x-@view.w/2, y-@view.h/2)
   translate_by: (x=0, y=x) -> @translate(x+@view.x, y+@view.y)
   translate:    (x=0, y=x) -> @model.translate(x, y); @update()
   scale:        (x=1, y=x) -> @model.scale(x, y);     @update()