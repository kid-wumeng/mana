module.exports = class Sprite

   constructor: ->
      @id=0
      @tx=0; @ty=0
      @sx=1; @sy=1
      @r=1; @g=1; @b=1
      @a=1
      @vertices = new Float32Array(9)
      @children = []

   image:     (id)              -> @id=id;                       @
   translate: (tx=0, ty=tx)     -> @tx=tx; @ty=ty;               @
   scale:     (sx=1, sy=sx)     -> @sx=sx; @sy=sy;               @
   color:     (r=255, g=r, b=g) -> @r=r/255; @g=g/255; @b=b/255; @
   alpha:     (a=1)             -> @a=a;                         @

   translate_by: (tx=0, ty=tx) -> @translate(@tx+tx, @ty+ty); @
   scale_by:     (sx=0, sy=sx) -> @scale(@sx+sx, @sy+sy);     @

   add: (sprite) ->
      @children.push(sprite)
      return @

   update_tree: ( parent ) ->
      @vertices[0]=@id
      @vertices[1]=@tx
      @vertices[2]=@ty
      @vertices[3]=@sx
      @vertices[4]=@sy
      @vertices[5]=@r
      @vertices[6]=@g
      @vertices[7]=@b
      @vertices[8]=@a
      if parent
         @vertices[1]+=parent.vertices[1]
         @vertices[2]+=parent.vertices[2]
         @vertices[3]*=parent.vertices[3]
         @vertices[4]*=parent.vertices[4]
      child.update_tree(@) for child in @children
      return @

Object.defineProperty Sprite::, 'x', get: -> @vertices[1]
Object.defineProperty Sprite::, 'y', get: -> @vertices[2]
Object.defineProperty Sprite::, 'list', get: ->
   list=[]
   for child in @children
      list.push(child)
      list.push(child.list...)
   return list