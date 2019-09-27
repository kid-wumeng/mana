Sprite = require('./Sprite')

module.exports = class SpriteNode extends Sprite

   constructor: ->
      super()
      @parent=null
      @children=[]
      @local={tx:0, ty:0, sx:1, sy:1}

   add: (node) ->
      @children.push(node)
      node.parent=@
      node.translate(node.local.tx, node.local.ty)
      node.scale(node.local.sx, node.local.sy)
      return @

   translate: (tx=0, ty=tx) ->
      if @parent
         @tx=(@local.tx=tx)+@parent.tx
         @ty=(@local.ty=ty)+@parent.ty
      else
         @tx=(@local.tx=tx)
         @ty=(@local.ty=ty)
      for child in @children
         child.translate(child.local.tx, child.local.ty)
      return @

   scale: (sx=1, sy=sx) ->
      if @parent
         @sx=(@local.sx=sx)*@parent.sx
         @sy=(@local.sy=sy)*@parent.sy
      else
         @sx=(@local.sx=sx)
         @sy=(@local.sy=sy)
      for child in @children
         child.scale(child.local.sx, child.local.sy)
      return @

   translate_by: (tx=0, ty=tx) -> @translate(@local.tx+tx, @local.ty+ty)
   scale_by:     (sx=0, sy=sx) -> @scale(@local.sx+sx, @local.sy+sy)

Object.defineProperty SpriteNode::, 'list', get: ->
   list=[]
   for child in @children
      list.push(child)
      list.push(child.list...)
   return list