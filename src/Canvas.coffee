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

Canvas::color = (color) -> @style.backgroundColor = color;              @
Canvas::fixed =         -> @style.position = 'fixed';                   @
Canvas::move  = (x, y)  -> @style.left = x ? 0; @style.top = y ? x ? 0; @
Canvas::size  = (w, h)  -> @width      = w ? 0; @height    = h ? w ? 0; @
Canvas::call  = (cb=->) -> cb.call(@getContext('2d'));                  @
Canvas::mount =         -> document.body.appendChild(@);                @