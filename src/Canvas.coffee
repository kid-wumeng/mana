module.exports = Canvas = HTMLCanvasElement

Canvas::init = (type) ->
   switch type
      when '2d' then @init2D()
      when '3d' then @init3D()
   Object.defineProperty @, 'w', get: -> @width
   Object.defineProperty @, 'h', get: -> @height

Canvas::init2D = -> @color(1,1,1,1); @context = @getContext('2d');    @
Canvas::init3D = -> @color(0,0,0,1); @context = @getContext('webgl'); @

Canvas::insert = -> document.body.appendChild(@); @
Canvas::remove = -> @parentNode.removeChild(@);   @

Canvas::color = (r,g,b,a)  -> @style.backgroundColor = new Color4(r,g,b,a).value; @
Canvas::fixed =            -> @style.position = 'fixed';                          @
Canvas::move  = (x=0, y=0) -> @style.left = x; @style.top = y;                    @
Canvas::size  = (w=0, h=0) -> @width = w; @height = h;                            @
Canvas::show  =            -> @style.display = 'inline';                          @
Canvas::hide  =            -> @style.display = 'none';                            @
Canvas::call  = (cb=->)    -> cb.call(@context);                                  @

Canvas::fullScreen = ->
   this
      .fixed()
      .move(0, 0)
      .size(device.w, device.h)