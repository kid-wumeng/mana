module.exports = class View extends require('./Rect')

   constructor: (x, y, w, h, W, H) ->
      super()
      @set(x, y, w, h, W, H)

   set: (x, y, w, h, W, H) =>
      if W and H
         super(x/W, y/H, w/W, h/H)
      else
         super(0, 0, 0, 0)