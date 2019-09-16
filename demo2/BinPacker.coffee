require('../')

console.log new BinPacker().pack([
   ['data|1', 25, 25]
   ['data|2', 120, 120]
   ['data|3', 50, 50]
   ['data|4', 76, 76]
], 100)