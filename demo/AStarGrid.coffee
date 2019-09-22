ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed()).getContext('2d')
document.body.style.backgroundColor = 'black'

size = 24
grid = new Grid(size).fill(0).forEach((x, y, price, grid) -> grid[y][x]=1 if Math.random() < 0.7)

A = new Vector(0)
B = new Vector(size-1)

grid[A.y][A.x] = 1
grid[B.y][B.x] = 1

astar = new AStarGrid(grid)
route = astar.search(A, B)

if route.length
   astar.draw(route, ctx)
else
   console.log('not found the route from A to B')