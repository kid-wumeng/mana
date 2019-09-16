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
      @splice(0, @length)
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

List.demo = ->
   console.log new List(3).fill('a').add('b').delete('a').has('a')
   console.log new List(1,2,3).min
   console.log new List(1,2,3).max
   console.log new List(1,2,3).sum