class Node
   constructor: (x, y) ->
      @x=x
      @y=y





module.exports = class AStar

   constructor: (grid) ->
      @grid = grid


   search: (start, end) ->
      open_grid = new Grid(@grid.w, @grid.h)
      open_list = []
      close_grid = new Grid(@grid.w, @grid.h)
      close_list = []
      close_list.push(start)
      console.log @around(1, 1)


   around: (x, y) ->
      return [
         t = @grid[y-1][x]
         b = @grid[y+1][x]
         l = @grid[y][x-1]
         r = @grid[y][x+1]
      ]