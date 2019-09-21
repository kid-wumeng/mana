heap = new BinaryHeap()
heap.add('data|5', 5)
heap.add('data|1', 1)
heap.add('data|2', 2)
heap.add('data|3', 3)
heap.add('data|4', 4)
heap.add('data|7', 7)
heap.add('data|8', 8)
heap.add('data|6', 6)
heap.add('data|9', 9)
heap.update('data|1', 7)
heap.update('data|7', 1)
console.log '-------------------'
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log heap.pop()
console.log '-------------------'
console.log heap.pop()
console.log '-------------------'
console.log heap

# new Clock ->
#    heap = new BinaryHeap()
#    s = performance.now()
#    for i in [160000...0]
#       heap.add("data|#{i}", i)
#    for i in [160000...0]
#       heap.add("data|#{i}", 160000-i)
#    for i in [160000...0]
#       heap.pop()
#    console.log performance.now() - s
# .start(300)