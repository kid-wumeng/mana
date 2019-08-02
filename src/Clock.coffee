module.exports = class Clock extends require('./EventBus')
   constructor: (step) ->
      super()
      @step = 0
      @last = 0
      @open = false
      @scale(step)

   scale: (step=0) -> @step = step;                                      @
   start:          -> @open = true; window.requestAnimationFrame(@tick); @
   pause:          -> @open = false;                                     @

   tick: (time) =>
      if @open
         if time - @last >= @step
            @last = time
            @emit('ding')
         window.requestAnimationFrame(@tick)