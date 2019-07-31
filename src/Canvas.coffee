module.exports = class Canvas

   constructor: ( fullScreen ) ->
      @el = document.body.appendChild(document.createElement('canvas'))
      @fullScreen() if fullScreen

   call: (cb, ctx)  -> cb.call(ctx, ctx);             @
   css:  (cb)       -> cb.call(@el.style, @el.style); @
   size: (w, h)     -> @w = w ? 0; @h = h ? @w;       @
   move: (x, y)     -> @css -> @left = x; @top = y
   show:            -> @css -> @display  = 'inline'
   hide:            -> @css -> @display  = 'none'
   fixed:           -> @css -> @position = 'fixed'
   color: (args...) -> @css -> @backgroundColor = new Color(args...).rgba

   fullScreen: ->
      @size(device.w, device.h).fixed().move(0, 0)

Object.defineProperty Canvas::, 'w', get: (-> @el.width),  set: (w)-> @el.width  = w
Object.defineProperty Canvas::, 'h', get: (-> @el.height), set: (h)-> @el.height = h