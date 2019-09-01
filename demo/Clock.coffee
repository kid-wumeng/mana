require('../')

new Clock(0).on('update', ->
   console.log performance.now()
).start()