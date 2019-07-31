module.exports = class Canvas
   constructor: ( full ) ->
      @el = document.createElement('canvas')
      @full() if full

   insert:          -> document.body.appendChild(@el);  @
   remove:          -> @el.parentNode.removeChild(@el); @
   full:            -> @insert().fixed().move(0, 0).size(device.w, device.h)
   fixed:           -> @css -> @position = 'fixed'
   move:  (x, y)    -> @css -> @left = x; @top = y
   color: (args...) -> @css -> @backgroundColor = new Color(args...).rgba
   size:  (w, h)    -> @w = w; @h = h;                @
   css:   (cb)      -> cb.call(@el.style, @el.style); @

Object.defineProperty Canvas::, 'w', get: (-> @el.width),  set: (w)-> @el.width  = w
Object.defineProperty Canvas::, 'h', get: (-> @el.height), set: (h)-> @el.height = h