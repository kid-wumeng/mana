require('../')

frames = new FrameSequence()

frames.add -> console.log 'frame:', 1
frames.add -> console.log 'frame:', 2
frames.add -> console.log 'frame:', 3
frames.add -> console.log 'frame:', 4
frames.add -> console.log 'frame:', 5

frames.next()
frames.next()
frames.next()
frames.next()
frames.next()
frames.next()
frames.next()
frames.next()