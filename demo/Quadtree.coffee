quadtree = new Quadtree(0, 0, 200, 200, deep=3)

quadtree.add('data-1', new Rect(0, 0, 20, 20))
quadtree.add('data-2', new Rect(160, 160, 20, 20))

console.log quadtree
console.log quadtree.find(new Rect(0, 0, 2, 2))
console.log quadtree.find(new Rect(100, 100, 2, 2))
console.log quadtree.find(new Rect(99, 99, 2, 2))
console.log quadtree.find(new Rect(200, 200, 2, 2))