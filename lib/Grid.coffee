Rect = require('./Rect')
List = require('./List')

module.exports = class Grid extends List

   constructor: (w=0, h=w) ->
      super()
      @push(new List(w).fill(0)) for _ in [0...h]
      @bounding = new Rect(0, 0, w, h)

   fill: (data) ->
      for list in @
         list.fill(data)
      return @

   forEach: (cb) ->
      for y in [0...@h]
         for x in [0...@w]
            cb(x, y, @[y][x], @)
      return @

   map: (cb) ->
      return @get(0, 0, @w, @h)
         .forEach (x, y, data, grid) -> grid[y][x] = cb(x, y, data, grid)

   get: (x=0, y=x, w=@w, h=@h) ->
      { w, h, min, max } = new Rect(x, y, w, h).overlap_rect(@bounding)
      grid = new @constructor(w, h)
      for y in [0...h]
         grid[y] = @[min.y+y][min.x...max.x]
      return grid

   set: (grid, x=0, y=x) ->
      { w, h, min, max } = new Rect(x, y, grid.w, grid.h).overlap_rect(@bounding)
      for y in [0...h]
         for x in [0...w]
            @[min.y+y][min.x+x] = grid[y][x]
      return @

   set_2d: (array_2d, x=0, y=x) ->
      for array, dy in array_2d
         for data, dx in array
            @[y+dy][x+dx] = data if (y+dy >= 0) and (x+dx >= 0) and (y+dy < @h) and (x+dx < @w)
      return @

Object.defineProperty Grid::, 'w',     get: -> @bounding.w
Object.defineProperty Grid::, 'h',     get: -> @bounding.h
Object.defineProperty Grid::, 'area',  get: -> @bounding.area
Object.defineProperty Grid::, 'clone', get: -> @get(0, 0, @w, @h)
Object.defineProperty Grid::, 'list',  get: ->
   list = new List(@area)
   for y in [0...@h]
      for x in [0...@w]
         list[@w*y+x] = @[y][x]
   return list