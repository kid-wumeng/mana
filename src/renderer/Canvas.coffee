module.exports = class Canvas

   constructor: (mode, options={}) ->
      @dpr = options.dpr ? device.dpr
      @raw = options.raw ? document.body.appendChild(document.createElement('canvas'))
      @ctx = @raw.getContext(mode)
      if not options.raw
         @size(device.w, device.h).move(0).css(-> @position='fixed')

   call:  (cb=->)              -> cb.call(@ctx, @ctx)
   css:   (cb=->)              -> cb.call(@raw.style, @raw.style);                                                   @
   size:  (w=0, h=w)           -> @css(-> @width="#{w}px"; @height="#{h}px"); @raw.width=@dpr*w; @raw.height=@dpr*h; @
   move:  (x=0, y=x)           -> @css(-> @left="#{x}px"; @top="#{y}px")
   index: (z=0)                -> @css(-> @zIndex=z)
   color: (r=0, g=r, b=g, a=1) -> @css(-> @backgroundColor="rgba(#{r},#{g},#{b},#{a})")

get Canvas::, 'w', -> @raw.clientWidth
get Canvas::, 'h', -> @raw.clientHeight