device = require('./@device')

module.exports = class Canvas
   constructor: (mode, ready) ->
      @el = document.body.appendChild(document.createElement('canvas'))
      @gl = switch mode
         when '2d' then @el.getContext('2d')
         when '3d' then @el.getContext('webgl')

   call:  (cb=->)           -> cb.call(@gl, @gl);             @
   css:   (cb=->)           -> cb.call(@el.style, @el.style); @
   size:  (w=0, h=w)        -> @el.width=w; @el.height=h;     @
   move:  (x=0, y=x)        -> @css -> @left="#{x}px"; @top="#{y}px"
   color: (r=0,g=0,b=0,a=1) -> @css -> @backgroundColor="rgba(#{r},#{g},#{b},#{a})"

get Canvas::, 'w',           -> @el.width
get Canvas::, 'h',           -> @el.height
get Canvas::, 'full_screen', -> @size(device.w, device.h).move(0).color(0).css -> @position = 'fixed'