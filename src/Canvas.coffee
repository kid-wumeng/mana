device = require('./device')
module.exports = Canvas = HTMLCanvasElement

Canvas.create = ->
   canvas = document.createElement('canvas')
   Object.defineProperty canvas, 'w', get: -> canvas.width
   Object.defineProperty canvas, 'h', get: -> canvas.height
   return canvas

Canvas::init = ->
   this
      .color('rgb(127, 127, 127)')
      .fixed()
      .move(0, 0)
      .size(device.w, device.h)
      .mount()

Canvas::color = (color)    -> @style.backgroundColor = color;  @
Canvas::fixed =            -> @style.position = 'fixed';       @
Canvas::move  = (x=0, y=0) -> @style.left = x; @style.top = y; @
Canvas::size  = (w=0, h=0) -> @width = w; @height = h;         @
Canvas::call  = (cb=->)    -> cb.call(@getContext('2d'));      @
Canvas::mount =            -> document.body.appendChild(@);    @