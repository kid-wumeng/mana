require('../')

packer = new BinPacker()
packer.add("l-#{i}", 75, 75) for i in [0...12]
packer.add("m-#{i}", 50, 50) for i in [0...12]
packer.add("s-#{i}", 25, 25) for i in [0...12]
bins = packer.pack()

console.log packer
console.log bins

canvas = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0))
canvas.size(packer.w, packer.h)

CTX = canvas.getContext('2d')
COLORS = ['#333', '#444', '#555', '#666', '#777', '#888', '#999', '#AAA', '#BBB', '#CCC']

bins.forEach ([data, x, y, w, h], i) ->
   CTX.fillStyle = COLORS[i % COLORS.length]
   CTX.fillRect(x, y, w, h)