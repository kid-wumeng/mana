{ GET } = require('./Helper')

module.exports = Canvas = HTMLCanvasElement

Canvas::fixed =                                      -> @style.position = 'fixed';                                                  @
Canvas::index = (z=0)                                -> @style.zIndex=z;                                                            @
Canvas::color = (r=0, g=r, b=g, a=1)                 -> @style.backgroundColor="rgba(#{r},#{g},#{b},#{a})";                         @
Canvas::move  = (x=0, y=x)                           -> @style.left="#{x}px"; @style.top="#{y}px";                                  @
Canvas::size  = (w=innerWidth, h=innerHeight, dpr=1) -> @style.width="#{w}px"; @style.height="#{h}px"; @width=w*dpr; @height=h*dpr; @

GET Canvas::, 'w', -> @clientWidth
GET Canvas::, 'h', -> @clientHeight