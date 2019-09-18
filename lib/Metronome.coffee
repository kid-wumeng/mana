module.exports = class Metronome

   constructor: (cb) ->
      @cb=cb
      @$step=1
      @count=0

   step: ($step=1) ->
      @$step=$step
      return @

   next: ->
      @count++
      if @count >= @$step
         @count = 0
         @cb()
      return @