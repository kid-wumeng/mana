packer = new BinPacker(100, 100)
   .add('data|1', 25, 25)
   .add('data|2', 76, 76)
   .add('data|3', 50, 50)
   .run()

console.log packer
console.log packer.bins
console.log packer.views