{ GET } = require('./Helper')

module.exports = class BinPacker

   constructor: ->
      @root = new Rect(0, 0, 0, 0)
      @bins = []

   add: (w, h, data) ->
      @bins.push([w, h, data])
      return @

   pack: ->
      return @bins
         .sort ([w1, h1], [w2, h2]) => Math.max(w2, h2) - Math.max(w1, h1)
         .map ([w, h, data]) =>
            area=@search(@root, w, h) ? @expand(w, h)
            area.used=true
            area.r=new Rect(area.x+w, area.y, area.w-w, h)      if w < area.w
            area.b=new Rect(area.x, area.y+h, area.w, area.h-h) if h < area.h
            return [area.x, area.y, w, h, data]

   search: (area, w, h) ->
      if area
         if area.used
            return @search(area.r, w, h) ? @search(area.b, w, h)
         else if area.w >= w and area.h >= h
            return area
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