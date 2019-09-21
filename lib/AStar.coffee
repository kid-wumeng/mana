BinaryHeap = require('./BinaryHeap')
Grid       = require('./Grid')
Vector     = require('./Vector')

module.exports = class AStar

   constructor: (grid_price) ->
      { w, h } = grid_price
      grid = new Grid(w, h)
      for y in [0...h]
         for x in [0...w]
            grid[y][x] = {
               x: x
               y: y
               price: grid_price[y][x]
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
            if grid_price[y][x]
               l=x-1; r=x+1; t=y-1; b=y+1
               arounds=[]; around_prices=[]
               arounds.push(grid[y][l]) and around_prices.push(grid_price[y][l]) if grid_price[y][l]  # 左
               arounds.push(grid[y][r]) and around_prices.push(grid_price[y][r]) if grid_price[y][r]  # 右
               arounds.push(grid[t][x]) and around_prices.push(grid_price[t][x]) if grid_price[t]?[x] # 上
               arounds.push(grid[b][x]) and around_prices.push(grid_price[b][x]) if grid_price[b]?[x] # 下
               arounds.push(grid[t][l]) and around_prices.push(grid_price[t][l]*1.4) if grid_price[t]?[l] # 左上
               arounds.push(grid[t][r]) and around_prices.push(grid_price[t][r]*1.4) if grid_price[t]?[r] # 右上
               arounds.push(grid[b][l]) and around_prices.push(grid_price[b][l]*1.4) if grid_price[b]?[l] # 左下
               arounds.push(grid[b][r]) and around_prices.push(grid_price[b][r]*1.4) if grid_price[b]?[r] # 右下
               grid[y][x].arounds=arounds
               grid[y][x].around_prices=around_prices
      @grid = grid


   search: (A, B) ->
      { grid } = @
      { w, h } = grid

      A = grid[A.y][A.x]; A.cost = 0
      B = grid[B.y][B.x]; B.from = null

      for y in [0...h]
         for x in [0...w]
            grid[y][x].opened = false if grid[y][x].opened
            grid[y][x].closed = false if grid[y][x].closed

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


   draw: (ctx) ->
      size = 16
      { grid, A, B, vectors } = @
      ctx.canvas.size(grid.w * size, grid.h * size)
      grid.forEach (x, y, point) ->
         if point.price
            if y%2 # 奇数行
               if x%2 # 奇数列
                  ctx.fillStyle = '#F8F8F8'
               else # 偶数列
                  ctx.fillStyle = '#FFFFFF'
            else # 偶数行
               if x%2 # 奇数列
                  ctx.fillStyle = '#FFFFFF'
               else # 偶数列
                  ctx.fillStyle = '#F8F8F8'
         else
            ctx.fillStyle = '#D8C1BC'
         ctx.fillRect(x*size, y*size, size, size)

      ctx.fillStyle = 'rgba(0,0,0,1)'
      ctx.fillRect(A.x*size, A.y*size, size, size)
      ctx.fillRect(B.x*size, B.y*size, size, size)

      ctx.strokeStyle='#000'
      vectors.forEach ({ x, y }) ->
         ctx.lineTo(x*size+size/2, y*size+size/2)
         ctx.stroke()