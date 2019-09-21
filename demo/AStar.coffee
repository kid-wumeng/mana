ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0)).getContext('2d')
size = 400

grid = new Grid(size).fill(1).set_2d([
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
   [1, 1, 1, 1, 1, 1]
])

A = new Vector(0)
B = new Vector(size-1)

# grid.forEach (x, y) ->
#    if Math.random() > 0.6
#       grid[y][x] = 0

grid[A.y][A.x] = 1
grid[B.y][B.x] = 1

astar = new AStar(grid)
astar.search(A, B)

# astar.draw(ctx)

new Clock ->
   s = performance.now()
   astar.search(A, B)
   console.log performance.now() - s
.start(200)