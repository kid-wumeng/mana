module.exports = class Metronome

   constructor: (step=1, cb=->) ->
      @step = step
      @cb = cb
      @count = 0

   next: ->
      @count++
      if @count >= @step
         @count = 0
         @cb()
      return @