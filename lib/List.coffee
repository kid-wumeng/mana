module.exports = class List extends Array

   has: (item) ->
      return @indexOf(item) > -1

   add: (item) ->
      @push(item)
      return @

   delete: (item) ->
      @splice(i, 1) if i = @indexOf(item) > -1
      return @

   clear: ->
      @length=0
      return @

   fill: (item) ->
      if item instanceof Function
         @[i]=item() for i in [0...@length]
      else
         super(item)
      return @

Object.defineProperty List::, 'min', get: -> Math.min(@...)
Object.defineProperty List::, 'max', get: -> Math.max(@...)
Object.defineProperty List::, 'sum', get: -> sum=0; sum+=n for n in @; sum