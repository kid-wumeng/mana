module.exports = class Clock

   constructor: (cb) ->
      @cb=cb
      @step=0
      @last=0
      @running=false

   start: (@step=0) ->
      if not @running
         @running=true
         window.requestAnimationFrame(@tick)
      return @

   pause: ->
      if @running
         @running=false
      return @

   tick: (now) =>
      if @running
         if @last+@step <= now
            @last=now
            @cb()
         window.requestAnimationFrame(@tick)

Clock.demo = ->
   new Clock ->
      console.log performance.now()
   .start(500)