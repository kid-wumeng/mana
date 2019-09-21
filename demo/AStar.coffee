size = 100

grid = new Grid(size).fill(1).set_2d([
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
])

astar = new AStar(grid)

A = new Vector(0, 0)
B = new Vector(size-1)

route = astar.search(A, B)
# astar.log(A, B, route)

new Clock ->
   s = performance.now()
   route = astar.search(A, B)
   console.log performance.now() - s
.start(300)