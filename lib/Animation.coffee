Metronome = require('./Metronome')

module.exports = class Animation

   constructor: ->
      @frames = []
      @cursor = 0
      @metronome = new Metronome(@update.bind(@))

   init: -> @cursor = 0; @
   step: -> @metronome.step(arguments...); @
   next: -> @metronome.next(arguments...); @

   add: (arg) ->
      if typeof(arg) is 'number'
         @frames.push(null) for i in [0...arg]
      else
         @frames.push(arg)
      return @

   update: ->
      if @frames[@cursor]
         @frames[@cursor]()
      if @cursor < @frames.length-1
         @cursor = @cursor+1
      else
         @cursor = 0
      return @