require('../')

cb = (data) ->
   console.log data

new EventBus().on('update', cb)
   .emit('update', 1)
   .emit('update', 2).off('update', cb)
   .emit('update', 3)