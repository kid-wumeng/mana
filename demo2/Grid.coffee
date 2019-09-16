require('../')

grid = new Grid(6, 6, 0)
grid.set([
   [1, 2, 3, 4]
   [5, 6, 7, 8]
], 1, 1)

console.log grid
console.log grid.get(1, 1, 2, 2)