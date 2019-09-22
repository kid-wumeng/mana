Grid       = require('./Grid')
Vector     = require('./Vector')
BinaryHeap = require('./BinaryHeap')

module.exports = class AStarGrid extends Grid

   constructor: (grid) ->
      { w, h } = grid
      super(w, h)
      for y in [0...@h]
         for x in [0...@w]
            @[y][x] = {
               x: x
               y: y
               price: grid[y][x]
               around_prices: []
               arounds: []
               from: null
               cost: 0
               dist: 0
               priority: 0
               opened: false
               closed: false
            }
      for y in [0...w]
         for x in [0...h]
            if grid[y][x]
               l=x-1; r=x+1; t=y-1; b=y+1
               arounds=[]; around_prices=[]
               arounds.push(@[y][l]) and around_prices.push(grid[y][l]) if grid[y][l]  # 左
               arounds.push(@[y][r]) and around_prices.push(grid[y][r]) if grid[y][r]  # 右
               arounds.push(@[t][x]) and around_prices.push(grid[t][x]) if grid[t]?[x] # 上
               arounds.push(@[b][x]) and around_prices.push(grid[b][x]) if grid[b]?[x] # 下
               arounds.push(@[t][l]) and around_prices.push(grid[t][l]*1.4) if grid[t]?[l] # 左上
               arounds.push(@[t][r]) and around_prices.push(grid[t][r]*1.4) if grid[t]?[r] # 右上
               arounds.push(@[b][l]) and around_prices.push(grid[b][l]*1.4) if grid[b]?[l] # 左下
               arounds.push(@[b][r]) and around_prices.push(grid[b][r]*1.4) if grid[b]?[r] # 右下
               @[y][x].arounds=arounds
               @[y][x].around_prices=around_prices


   search: (A, B) ->
      { w, h } = @
      A = @[A.y][A.x]; A.cost = 0
      B = @[B.y][B.x]; B.from = null

      for y in [0...h]
         for x in [0...w]
            @[y][x].opened = false if @[y][x].opened
            @[y][x].closed = false if @[y][x].closed

      opens=new BinaryHeap()
      opens.add(A, 0)

      while opens.length
         center=opens.pop()
         center.closed = true
         if center is B
            break
         else
            for around, i in center.arounds
               if around.closed
                  continue
               if around.opened
                  cost = center.cost + center.around_prices[i]
                  priority = cost + around.dist
                  if around.priority > priority
                     around.priority = priority
                     around.cost = cost
                     around.from = center
               else
                  around.cost = center.cost + center.around_prices[i]
                  around.dist = Math.abs(B.x-around.x) + Math.abs(B.y-around.y)
                  around.priority = around.cost + around.dist
                  around.opened = true
                  around.from = center
                  opens.add(around, around.priority)

      route=[]
      if B.from
         point=B
         while point isnt A
            route.push(new Vector(point.x, point.y))
            point=point.from
         route.push(new Vector(A.x, A.y))
         route.reverse()
      return route


   draw: (route, ctx) ->
      { w, h } = @
      size = parseInt(Math.min(innerWidth/w, innerHeight/h))
      ctx.canvas.size(w*size, h*size)
      @forEach (x, y, point) ->
         if point.price
            ctx.fillStyle = switch
               when y%2 is 1 and x%2 is 1 then '#F8F8F8'
               when y%2 is 1 and x%2 is 0 then '#FFFFFF'
               when y%2 is 0 and x%2 is 0 then '#F8F8F8'
               when y%2 is 0 and x%2 is 1 then '#FFFFFF'
         else
            ctx.fillStyle = '#D8C1BC'
         ctx.fillRect(x*size, y*size, size, size)
      ctx.strokeStyle = '#000000'
      ctx.lineTo(x*size+size/2, y*size+size/2) for { x, y } in route
      ctx.stroke()