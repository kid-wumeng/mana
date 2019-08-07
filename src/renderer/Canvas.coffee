device = require('../device')
module.exports = class Canvas

   constructor: (mode, options={}) ->
      @dpr = options.dpr ? device.dpr
      @raw = options.raw ? document.body.appendChild(document.createElement('canvas'))
      @ctx = @raw.getContext(mode)
      @color(0).fixed().move(0).size(device.w, device.h) if not options.raw

   call:  (cb=->)              -> cb.call(@ctx, @ctx);                                                               @
   css:   (cb=->)              -> cb.call(@raw.style, @raw.style);                                                   @
   size:  (w=0, h=w)           -> @css(-> @width="#{w}px"; @height="#{h}px"); @raw.width=@dpr*w; @raw.height=@dpr*h; @
   move:  (x=0, y=x)           -> @css(-> @left="#{x}px"; @top="#{y}px")
   color: (r=0, g=r, b=g, a=1) -> @css(-> @backgroundColor="rgba(#{r},#{g},#{b},#{a})")
   fixed:                      -> @css(-> @position='fixed')

get Canvas::, 'w', -> @raw.clientWidth
get Canvas::, 'h', -> @raw.clientHeight