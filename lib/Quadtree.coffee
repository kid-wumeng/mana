Rect = require('./Rect')

module.exports = class Quadtree

   constructor: ->
      @root = new Node(0, 0, 200, 200)
      console.log @root.findQuadrant(new Rect(0, 0, 25, 25))


class Node extends Rect

   constructor: (x, y, w, h) ->
      super(x, y, w, h)
      @items = []
      @node1 # 第一象限
      @node2 # 第二象限
      @node3 # 第三象限
      @node4 # 第四象限

   # add: (data, area) ->
   #    var quadrant = this.findQuadrant(area)
   #
   #    if quadrant === 0 || this.level === 6
   #       var item = this.make('QuadTreeNodeItem', this, data, area)
   #       this.items.set(data, item)
   #       return item
   #    else
   #    switch quadrant
   #       case 1: if (this.quadrant_1 == null) this.createQuadrant(1); return this.quadrant_1.add(data, area)
   #       case 2: if (this.quadrant_2 == null) this.createQuadrant(2); return this.quadrant_2.add(data, area)
   #       case 3: if (this.quadrant_3 == null) this.createQuadrant(3); return this.quadrant_3.add(data, area)
   #       case 4: if (this.quadrant_4 == null) this.createQuadrant(4); return this.quadrant_4.add(data, area)

   findQuadrant: (rect) ->
      center = @center
      isQuadrant12 = rect.min.y < center.y and rect.max.y < center.y
      isQuadrant34 = rect.min.y > center.y
      isQuadrant23 = rect.min.x < center.x and rect.max.x < center.x
      isQuadrant14 = rect.min.x > center.x

      node = null

      LL = @min.x
      TT = @min.y
      RR = @max.x
      BB = @max.y
      CX = @center.x
      CY = @center.y

      if rect.area <= @area/2
         switch
            when isQuadrant12
               switch
                  when isQuadrant23 then node = @node2 ? @node2 = new Node(LL, TT, CX, CY)
                  when isQuadrant14 then node = @node1 ? @node1 = new Node(CX, TT, RR, CY)
            when isQuadrant34
               switch
                  when isQuadrant23 then node = @node3 ? @node3 = new Node(LL, CY, CX, BB)
                  when isQuadrant14 then node = @node4 ? @node4 = new Node(CX, CY, RR, BB)

      if node
         return node.findQuadrant(rect)
      else
         return this

   createQuadrant: (index) ->
      LL = @min.x
      TT = @min.y
      RR = @max.x
      BB = @max.y
      CX = @center.x
      CY = @center.y

      switch index
         when 1 then @node1 = new Node(CX, TT, RR, CY)
         when 2 then @node2 = new Node(LL, TT, CX, CY)
         when 3 then @node3 = new Node(LL, CY, CX, BB)
         when 4 then @node4 = new Node(CX, CY, RR, BB)
