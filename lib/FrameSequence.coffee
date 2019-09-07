module.exports = class FrameSequence extends Array

   constructor: ->
      super()
      @index=0

   add: (cb) ->
      @push(cb)
      return @

   init: ->
      @index=0
      return @

   next: ->
      if @length
         @[@index]()
         if @index is @length-1
            @index=0
         else
            @index++
      return @