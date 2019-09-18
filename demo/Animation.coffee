animation = new Animation().step(2)

animation.add(-> console.log 'frame:', 1)
animation.add(-> console.log 'frame:', 2)
animation.add(2)
animation.add(-> console.log 'frame:', 3)
animation.add(-> console.log 'frame:', 4)

animation.next()
animation.next() # 1
animation.next()
animation.next() # 2
animation.next()
animation.next() # *
animation.next()
animation.next() # *
animation.next()
animation.next() # 3
animation.next()
animation.next() # 4
animation.next()
animation.next() # 1
animation.next()
animation.next() # 2
animation.next()
animation.next() # *
animation.next()
animation.next() # *
animation.next()
animation.next() # 3
animation.next()