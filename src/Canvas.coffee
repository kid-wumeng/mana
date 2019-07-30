module.exports = Canvas = HTMLCanvasElement

Canvas::init = (type) ->
   @show()
   @append()
   @backgroundColor = new Color4()
   switch type
      when '2d' then @color(1,1,1,1); @context = @getContext('2d')
      when '3d' then @color(0,0,0,1); @context = @getContext('webgl')
   Object.defineProperty @, 'w', get: -> @width
   Object.defineProperty @, 'h', get: -> @height

Canvas::append =            -> document.body.appendChild(@);                                 @
Canvas::remove =            -> @parentNode.removeChild(@);                                   @
Canvas::format =            -> @fixed().move(0, 0).size(device.w, device.h);                 @
Canvas::color  = (r,g,b,a)  -> @style.backgroundColor = @backgroundColor.set(r,g,b,a).value; @
Canvas::fixed  =            -> @style.position        = 'fixed';                             @
Canvas::show   =            -> @style.display         = 'block';                             @
Canvas::hide   =            -> @style.display         = 'none';                              @
Canvas::move   = (x=0, y=0) -> @style.left = x; @style.top = y;                              @
Canvas::size   = (w=0, h=0) -> @width = w; @height = h;                                      @
Canvas::call   = (cb=->)    -> cb.call(@context);                                            @