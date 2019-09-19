class Point
   constructor: (x, y, g) ->
      @x=x
      @y=y
      @g=g
      @F=0
      @G=0
      @H=0
      @from=null

module.exports = class AStar

   constructor: (grid) ->
      @grid=grid.map (x, y, g) -> new Point(x, y, g)
      @A=null
      @B=null
      @opens=[]
      @closes=[]

   search: (A, B) ->
      @A = @grid[A.y][A.x]
      @B = @grid[B.y][B.x]
      @opens.push(@A)
      while @opens.length
         min = @find_min()
         @closes.push(min)
         if (min is @B)
            @recall()
            return
         @around(min)
      console.log '无路可走'

   around: (point) ->
      around_points = []
      { x, y } = point

      row_t = @grid[y-1]
      row_c = @grid[y]
      row_b = @grid[y+1]
      l = x - 1
      r = x + 1

      if row_t
         if @can_join_opens(row_t[x])
            row_t[x].from = point
            @opens.push(row_t[x])
            @compute(row_t[x])

      if row_b
         if @can_join_opens(row_b[x])
            row_b[x].from = point
            @opens.push(row_b[x])
            @compute(row_b[x])

      if l >= 0
         if @can_join_opens(row_c[l])
            row_c[l].from = point
            @opens.push(row_c[l])
            @compute(row_c[l])

      if r < @grid.w
         if @can_join_opens(row_c[r])
            row_c[r].from = point
            @opens.push(row_c[r])
            @compute(row_c[r])

   can_join_opens: (point) ->
      if point.g > 0
         if @opens.indexOf(point) is -1
            if @closes.indexOf(point) is -1
               return true
      return false

   compute: (point) ->
      point.G = point.from.G+1 if point.from
      point.H = Math.abs(point.x-@B.x) + Math.abs(point.y-@B.y)
      point.F = point.G + point.H

   find_min: ->
      @opens.sort (p1, p2) -> p2.F - p1.F
      return @opens.pop()

   recall: ->
      points = []
      point = @B
      while point isnt @A
         points.push(point)
         point = point.from

      points.reverse()

      grid = @grid.map (x, y, point) -> return if point.g then '□' else '█'
      points.forEach ({ x, y }) -> grid[y][x] = '*'

      grid[@A.y][@A.x] = 'A'
      grid[@B.y][@B.x] = 'B'

      for list, i in grid
         console.log list.join('  '), "                          (#{i})"