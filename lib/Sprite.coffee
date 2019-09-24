module.exports = class Sprite

   constructor: ->
      @ox = 0
      @oy = 0
      @frames = new Map()
      @vertices = new Float32Array([
         id=0
         tx=0, ty=0
         sx=1, sy=1
         r=1, g=1, b=1
         a=1
      ])

   image:     (name)          -> @id = window.ids.get(name); @
   offset:    (ox=0, oy=ox)   -> @ox=ox; @oy=oy;             @
   translate: (tx=0, ty=tx)   -> @tx=tx; @ty=ty;             @
   scale:     (sx=1, sy=sx)   -> @sx=sx; @sy=sy;             @
   color:     (r=1, g=r, b=g) -> @r=r; @g=g; @b=b;           @
   alpha:     (a=1)           -> @a=a;                       @

   frame: (name, cb) ->
      switch
         when typeof(cb) is 'string'   then @frames.set(name, => @image(cb))
         when typeof(cb) is 'function' then @frames.set(name, cb)
         else                               @frames.get(name).call(@,@) if @frames.has(name)
      @

   clear_frames: -> @frames.clear(); @

Object.defineProperty Sprite::, 'id', get: (-> @vertices[0]), set: (id) -> @vertices[0] = id
Object.defineProperty Sprite::, 'tx', get: (-> @vertices[1]), set: (tx) -> @vertices[1] = tx
Object.defineProperty Sprite::, 'ty', get: (-> @vertices[2]), set: (ty) -> @vertices[2] = ty
Object.defineProperty Sprite::, 'sx', get: (-> @vertices[3]), set: (sx) -> @vertices[3] = sx
Object.defineProperty Sprite::, 'sy', get: (-> @vertices[4]), set: (sy) -> @vertices[4] = sy
Object.defineProperty Sprite::, 'r',  get: (-> @vertices[5]), set: (r)  -> @vertices[5] = if r <= 1 then r else r/255
Object.defineProperty Sprite::, 'g',  get: (-> @vertices[6]), set: (g)  -> @vertices[6] = if g <= 1 then g else g/255
Object.defineProperty Sprite::, 'b',  get: (-> @vertices[7]), set: (b)  -> @vertices[7] = if b <= 1 then b else b/255
Object.defineProperty Sprite::, 'a',  get: (-> @vertices[8]), set: (a)  -> @vertices[8] = a

Sprite.ATTRIBUTES = 9