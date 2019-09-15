Dict = require('./Dict')
Rect = require('./Rect')

module.exports = class Quadtree

   constructor: (x, y, w, h) ->
      @dict = new Dict()
      @root = new Node(x, y, w, h)

   add: (rect, data) ->
      if @root.overlap(rect).area
         for node in @root.assign(rect)
            @dict.set(node, []) if not @dict.has(node)
            @dict.get(node).push(data)
      return @

   find: (rect) ->
      if @root.overlap(rect).area
         return @dict.get(@root.search(rect))
      else
         return []


class Node extends Rect
   constructor: ->
      super(arguments...)
      @node_1
      @node_2
      @node_3
      @node_4

   search: (rect) ->
      switch @locate(rect)
         when 1 then return @node_1.search(rect) if @node_1
         when 2 then return @node_2.search(rect) if @node_2
         when 3 then return @node_3.search(rect) if @node_3
         when 4 then return @node_4.search(rect) if @node_4
      return @

   locate: (rect) ->
      switch
         when rect.min.x >= @mid.x and rect.max.y <= @mid.y then return 1
         when rect.max.x <= @mid.x and rect.max.y <= @mid.y then return 2
         when rect.max.x <= @mid.x and rect.min.y >= @mid.y then return 3
         when rect.min.x >= @mid.x and rect.min.y >= @mid.y then return 4
      return 0

   assign: (rect) ->
      @ensure(quadrant = @locate(rect))
      switch quadrant
         when 0 then nodes = []
         when 1 then nodes = @node_1.assign(rect)
         when 2 then nodes = @node_2.assign(rect)
         when 3 then nodes = @node_3.assign(rect)
         when 4 then nodes = @node_4.assign(rect)
      nodes.push(@)
      return nodes

   ensure: (quadrant) ->
      switch quadrant
         when 1 then @node_1 = new Node(@mid.x, @min.y, @w/2, @h/2) if not @node_1
         when 2 then @node_2 = new Node(@min.x, @min.y, @w/2, @h/2) if not @node_2
         when 3 then @node_3 = new Node(@min.x, @mid.y, @w/2, @h/2) if not @node_3
         when 4 then @node_4 = new Node(@mid.x, @mid.y, @w/2, @h/2) if not @node_4