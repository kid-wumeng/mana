{ GET } = require('./Helper')

module.exports = class BinPacker

   constructor: ->
      @root = new Rect(0, 0, 0, 0)
      @bins = []

   init: ->
      @root = new Rect(0, 0, 0, 0)
      @bins = []
      return @

   add: (data, w, h) ->
      @bins.push([data, w, h])
      return @

   pack: ->
      @bins = @bins
         .sort ([data1, w1, h1], [data2, w2, h2]) -> Math.max(w2, h2) - Math.max(w1, h1)
         .map ([data, w, h], i) =>
            node=@search(@root, w, h) ? @expand(w, h)
            node.used=true
            node.r=new Rect(node.x+w, node.y, node.w-w, h)      if w < node.w
            node.b=new Rect(node.x, node.y+h, node.w, node.h-h) if h < node.h
            [data, node.x, node.y, w, h]

   search: (node, w, h) ->
      if node
         if node.used
            return @search(node.r, w, h) ? @search(node.b, w, h)
         else if node.w >= w and node.h >= h
            return node
      return null

   expand: (w, h) ->
      switch
         when @root.w >= w
           if @root.w >= @root.h+h then @expand_b(w,h) else @expand_r(w,h)
         when @root.h >= h
           if @root.h >= @root.w+w then @expand_r(w,h) else @expand_b(w,h)
         else @root = new Rect(0, 0, w, h)

   expand_r: (w, h) ->
      root=new Rect(0, 0, @root.w+w, @root.h)
      root.r=new Rect(@root.w, 0, w, @root.h)
      root.b=@root
      root.used=true
      return (@root=root).r

   expand_b: (w, h) ->
      root=new Rect(0, 0, @root.w, @root.h+h)
      root.b=new Rect(0, @root.h, @root.w, h)
      root.r=@root
      root.used=true
      return (@root=root).b

GET BinPacker::, 'w', -> @root.w
GET BinPacker::, 'h', -> @root.h