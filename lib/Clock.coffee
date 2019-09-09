module.exports = class Clock extends require('./EventBus')

   constructor: (step=0) ->
      super()
      @step = step
      @last = 0
      @running = false

   start: ->
      if not @running
         @running = true
         window.requestAnimationFrame(@tick)
      return @

   pause: ->
      if @running
         @running = false
      return @

   tick: (now) =>
      if @running
         if @last + @step <= now
            @last = now
            @emit('update')
         window.requestAnimationFrame(@tick)