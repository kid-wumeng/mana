console.log 'rect                    =>', rect = new Rect(0, 0, 200, 300)
console.log 'rect.min                =>', rect.min
console.log 'rect.mid                =>', rect.mid
console.log 'rect.max                =>', rect.max
console.log 'rect.area               =>', rect.area
console.log 'rect.center             =>', rect.center
console.log 'rect.contain(rect)      =>', rect.contain(new Rect(100, 100, 100, 150))
console.log 'rect.overlap(rect)      =>', rect.overlap(new Rect(150, 150, 100, 120))
console.log 'rect.overlap_rect(rect) =>', rect.overlap_rect(new Rect(150, 150, 100, 120))