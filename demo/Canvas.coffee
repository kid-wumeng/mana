canvas = document.createElement('canvas')
   .size(innerWidth, innerHeight, devicePixelRatio)
   .move(0)
   .fixed()
   .color(125, 125, 125, 0.5)
   .index(1)

document.body.appendChild(canvas)
console.log canvas.getContext('webgl2')