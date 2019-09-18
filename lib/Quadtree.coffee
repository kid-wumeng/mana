Dict = require('./Dict')
View = require('./View')

module.exports = class Quadtree

   constructor: (x, y, w, h, deep=7) ->
      @dict = new Dict
      @root = new View(x, y, w, h)
      @deep = deep

   add: (data, rect) ->
      if @root.overlap(rect)
         for node in @assign_quadrant(@root, rect, 0)
            if not @dict.has(node)
               @dict.set(node, [])
            @dict.get(node).push(data)
      return @

   find: (rect) ->
      if @root.overlap(rect)
         return @dict.get(@search_quadrant(@root, rect))
      else
         return []

   clear: (rect) ->
      @dict.clear()
      delete @root.quadrant_1
      delete @root.quadrant_2
      delete @root.quadrant_3
      delete @root.quadrant_4
      return @

   search_quadrant: (node, rect) ->
      switch @locate_quadrant(node, rect)
         when 1 then return @search_quadrant(node.quadrant_1, rect) if node.quadrant_1
         when 2 then return @search_quadrant(node.quadrant_2, rect) if node.quadrant_2
         when 3 then return @search_quadrant(node.quadrant_3, rect) if node.quadrant_3
         when 4 then return @search_quadrant(node.quadrant_4, rect) if node.quadrant_4
      return node

   locate_quadrant: (node, rect) ->
      switch
         when node.mid.x <= rect.min.x and node.mid.y >= rect.max.y then return 1
         when node.mid.x >= rect.max.x and node.mid.y >= rect.max.y then return 2
         when node.mid.x >= rect.max.x and node.mid.y <= rect.min.y then return 3
         when node.mid.x <= rect.min.x and node.mid.y <= rect.min.y then return 4
      return 0

   assign_quadrant: (node, rect, deep) ->
      nodes = []
      if deep < @deep
         @ensure_quadrant(node, quadrant=@locate_quadrant(node, rect))
         switch quadrant
            when 1 then nodes = @assign_quadrant(node.quadrant_1, rect, deep+1)
            when 2 then nodes = @assign_quadrant(node.quadrant_2, rect, deep+1)
            when 3 then nodes = @assign_quadrant(node.quadrant_3, rect, deep+1)
            when 4 then nodes = @assign_quadrant(node.quadrant_4, rect, deep+1)
      nodes.push(node)
      return nodes

   ensure_quadrant: (node, quadrant) ->
      { w, h } = node
      switch quadrant
         when 1 then node.quadrant_1 = node.slice_unit(.5, .0, .5, .5) if not node.quadrant_1
         when 2 then node.quadrant_2 = node.slice_unit(.0, .0, .5, .5) if not node.quadrant_2
         when 3 then node.quadrant_3 = node.slice_unit(.0, .5, .5, .5) if not node.quadrant_3
         when 4 then node.quadrant_4 = node.slice_unit(.5, .5, .5, .5) if not node.quadrant_4
      return node