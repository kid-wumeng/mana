animations = new AnimationManager()
animations.set('abc')
   .step(2)
   .add(-> console.log 'frame:', 1)
   .add(-> console.log 'frame:', 2)
   .add(2)
   .add(-> console.log 'frame:', 3)
   .add(-> console.log 'frame:', 4)
animations.use('abc')
   .next().next() # 1
   .next().next() # 2
   .next().next() # *
   .next().next() # *
   .next().next() # 3
   .next().next() # 4
   .next().next() # 1
   .next().next() # 2
   .next().next() # *
   .next().next() # *
   .next().next() # 3
   .next()