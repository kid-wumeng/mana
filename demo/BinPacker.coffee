require('../')

packer = new BinPacker()
packer.add(75, 75, "l-#{i}") for i in [0...12]
packer.add(50, 50, "m-#{i}") for i in [0...12]
packer.add(25, 25, "s-#{i}") for i in [0...12]
bins = packer.pack()

console.log packer
console.log bins

canvas = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0))
canvas.size(packer.w, packer.h)

CTX = canvas.getContext('2d')
COLORS = ['#333', '#444', '#555', '#666', '#777', '#888', '#999', '#AAA', '#BBB', '#CCC']

bins.forEach ([x, y, w, h, data], i) ->
   CTX.fillStyle = COLORS[i % COLORS.length]
   CTX.fillRect(x, y, w, h)