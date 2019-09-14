require('../')

canvas = document.body.appendChild(document.createElement('canvas').color(0))
camera = new Camera(canvas).translate(200).scale(0.5)

console.log camera
console.log camera.view