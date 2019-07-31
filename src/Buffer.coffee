module.exports = class Buffer extends Float32Array

   get: (i)    -> @[i] ? 0
   set: (i, n) -> @[i] = n if Number.isFinite(n); @
   val: (nums) -> @set(i,n) for n,i in arguments; @

   map_me: (cb, start=0, end=@length-1) ->
      if start < 0
         start = 0
      if end > len = @length-1
         end = len
      for i in [start..end]
         @set i, cb(@[i],i)
      @

Object.defineProperty Buffer::, 'clone', get: -> new @constructor(@)