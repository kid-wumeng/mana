grid = new Grid(6, 5).fill(-> new Vector(0, 0))

grid.forEach((y, x, vector, grid) -> grid[y][x] = "(#{x}|#{y})")
grid.set(new Grid(3, 3).fill('(*|*)'), 1, 1)
grid.set_2d([
   [1, 2, 3, 4]
   [5, 6, 7, 8]
], 1, 1)

console.log 'grid              =>', grid
console.log 'grid.w            =>', grid.w
console.log 'grid.h            =>', grid.h
console.log 'grid.area         =>', grid.area
console.log 'grid.get(2,2,3,3) =>', grid.get(2,2,3,3)
console.log 'grid.list         =>', grid.list