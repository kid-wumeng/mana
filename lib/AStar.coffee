Grid       = require('./Grid')
BinaryHeap = require('./BinaryHeap')
Vector     = require('./Vector')

class Point
   constructor: (x, y, g) ->
      @x=x; @y=y; @g=g
      @F=0; @H=0; @G=0
      @from=null

module.exports = class AStar

   constructor: (grid) ->
      @grid = new Grid(w=grid.w+2, h=grid.h+2)

      for x in [0...w]
         @grid[0][x] = new Point(x, 0, 0)
         @grid[h-1][x] = new Point(x, h-1, 0)

      for y in [1...h-1]
         @grid[y][0] = new Point(0, y, 0)
         @grid[y][w-1] = new Point(w-1, y, 0)

      for y in [1...h-1]
         for x in [1...w-1]
            @grid[y][x] = new Point(x, y, grid[y-1][x-1])

   search: (A, B) ->
      { w, h } = grid = @grid
      for y in [0...h]
         for x in [0...w]
            grid[y][x].G = 0
            grid[y][x].H = Math.abs(x-B.x) + Math.abs(y-B.y)
            grid[y][x].F = 0
            grid[y][x].from = null

      A = grid[A.y+1][A.x+1]
      B = grid[B.y+1][B.x+1]
      opens = new BinaryHeap
      closes = new Set
      opens.set(A, 0)

      while opens.size
         center = opens.top()
         closes.add(center)

         if center is B
            break

         { x, y } = center

         arounds = [
            grid[y][x-1]
            grid[y][x+1]
            grid[y-1][x]
            grid[y+1][x]
         ]

         for around in arounds
            if around.g > 0 and !closes.has(around)
               G = center.G+1
               H = around.H
               F = G+H
               if opens.has(around)
                  if F < around.F
                     around.G=G
                     around.F=F
                     around.from=center
               else
                  around.G=G
                  around.F=F
                  around.from=center
                  opens.set(around, F)

      points = []
      point = B
      while point isnt A
         points.push(new Vector(point.x-1, point.y-1))
         point = point.from
      points.reverse()

      return points

   log: (A, B, points) ->
      grid = @grid.map (x, y, point) -> if point.g then ' ' else '█'
      points.forEach ({ x, y }) -> grid[y+1][x+1] = '*'

      grid[A.y+1][A.x+1] = 'A'
      grid[B.y+1][B.x+1] = 'B'

      for list, i in grid
         console.log "(#{i.toString().padStart(2,'0')})", list.join('  ')