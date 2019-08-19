module.exports = class TextureView extends require('../shape/Rect')

   constructor: (W, H=W, x=0, y=x, w=W, h=H) ->
      super(x/W, y/H, w/W, h/H)
      @w=w
      @h=h

   slice: (x, y, w, h=w) ->
      new TextureView(@w, @h, x, y, w, h)

   split: (w, h=w) ->
      views = []
      for y in [0...@h/h]
         for x in [0...@w/w]
            views.push(@slice(x*w, y*h, w, h))
      views