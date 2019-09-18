grid = new Grid(6, 6).set_2d([
   [1, 1, 1, 0, 1, 1]
   [1, 1, 0, 1, 1, 1]
   [1, 1, 0, 1, 1, 1]
   [1, 1, 0, 1, 1, 1]
   [1, 1, 0, 1, 1, 1]
   [1, 1, 1, 1, 0, 1]
])

astar = new AStar(grid)
astar.search(new Vector(0, 0), new Vector(5, 5))