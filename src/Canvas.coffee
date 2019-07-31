module.exports = class Canvas

   constructor: (mode, full_screen) ->
      @el = document.body.appendChild(document.createElement('canvas'))
      @gl = switch mode
         when '2d' then @color(1,1,1); @el.getContext('2d')
         when '3d' then @color(0,0,0); @el.getContext('webgl')
      @full_screen() if full_screen

   full_screen:     -> @size(device.w, device.h).fixed().move(0, 0)
   move: (x, y)     -> @css -> @left = x; @top = y
   show:            -> @css -> @display  = 'inline'
   hide:            -> @css -> @display  = 'none'
   fixed:           -> @css -> @position = 'fixed'
   color: (args...) -> @css -> @backgroundColor = new Color(args...).rgba
   css:  (cb)       -> cb.call(@el.style, @el.style); @
   call: (cb)       -> cb.call(@gl, @gl);             @
   size: (w, h)     -> @w=w||0; @h=h||@w;             @

Object.defineProperty Canvas::, 'w', get: (-> @el.width),  set: (w)-> @el.width  = w
Object.defineProperty Canvas::, 'h', get: (-> @el.height), set: (h)-> @el.height = h