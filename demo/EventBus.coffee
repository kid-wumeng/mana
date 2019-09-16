new EventBus().on('update', console.log)
   .emit('update', 1)
   .emit('update', 2).off('update', console.log)
   .emit('update', 3)