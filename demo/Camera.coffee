require('../')

canvas = document.body.appendChild(document.createElement('canvas').color(0))
camera = new Camera(canvas).view(200)

console.log camera
console.log ' v:', camera.v
console.log ' p:', camera.p
console.log 'vp:', camera.vp