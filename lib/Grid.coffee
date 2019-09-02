Rect = require('./Rect')
{ GET } = require('./Helper')

module.exports = class Grid extends Array

   constructor: (w=0, h=w, element=0) ->
      super(h)
      @[y] = new Array(w).fill(element) for y in [0...h]
      @bounding = new Rect(0, 0, w, h)

   get: (x=0, y=x, w=@w, h=@h) =>
      {x, y, w, h} = new Rect(x, y, w, h).overlap(@bounding)
      grid = new Grid(w, h)
      for dy in [0...h]
         grid[dy] = @[y+dy][x...x+w]
      return grid

   set: (grid, x=0, y=x) =>
      {w, h} = @
      for row, dy in grid
         for element, dx in row
            ey = y + dy
            ex = x + dx
            @[ey][ex] = element if (ey >= 0) and (ex >= 0) and (ey < h) and (ex < w)
      return @

GET Grid::, 'w',    -> @bounding.w
GET Grid::, 'h',    -> @bounding.h
GET Grid::, 'area', -> @bounding.area

GET Grid::, 'elements', ->
   {w, h} = @
   elements = new Array(w*h)
   for y in [0...h]
      for x in [0...w]
         elements[w*y+x] = @[y][x]
   return elements