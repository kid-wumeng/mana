Helper = require('./Helper')
Rect   = require('./Rect')
List   = require('./List')

module.exports = class Grid

   constructor: (w, h) ->
      @bounding = new Rect(0, 0, w, h)
      @elements = new List(@bounding.h).fill(=> new List(@bounding.w))

   forEach: (cb) ->
      for y in [0...@bounding.h]
         for x in [0...@bounding.w]
            cb y, x, @elements[y][x]
      return @

   fill: (data) ->
      row.fill(data) for row in @elements
      return @

   get: (x=0, y=x, w=@w, h=@h) ->
      { w, h, min, max } = new Rect(x, y, w, h).overlap(@bounding)
      grid = new @constructor(w, h)
      for y in [0...grid.bounding.h]
         grid.elements[y] = @elements[min.y+y][min.x...max.x]
      return grid

   # set: (grid, x=0, y=x) ->
   #    { w, h } = @
   #    for row, dy in grid
   #       for element, dx in row
   #          ey = y + dy
   #          ex = x + dx
   #          @[ey][ex] = element if (ey >= 0) and (ex >= 0) and (ey < h) and (ex < w)
   #    return @

Helper.GET Grid::, 'list', ->
   { w, h, area } = @bounding
   list = new List(area)
   for y in [0...h]
      for x in [0...w]
         list[w*y+x] = @elements[y][x]
   return list