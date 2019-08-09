module.exports = class Clock extends require('./EventBus')

   constructor: ->
      super()
      @step = 0
      @last = 0
      @running = false

   start: ->
      if not @running
         @running = true
         window.requestAnimationFrame(@tick)
      @

   pause: ->
      if @running
         @running = false
      @

   tick: (now) =>
      if @running
         if @last + @step <= now
            @last = now
            @emit('update')
         window.requestAnimationFrame(@tick)

   scale: (@step=0) -> @