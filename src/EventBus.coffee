module.exports = class EventBus

   constructor: ->
      @map = {}

   on: (name, cb) ->
      @map[name] ?= []
      @map[name].push(cb)
      @

   once: (name, cb) ->
      fn = (args...) =>
         cb(args...)
         @off(name, fn)
      @on(name, fn)
      @

   off: (name, cb) ->
      if cbs = @map[name]
         if cb
            cbs.splice(i,1) if (i = cbs.indexOf(cb)) > -1
         else
            cbs.splice(0)
      @

   emit: (name, args...) ->
      if cbs = @map[name]
         if len = cbs.length
            for i in [len-1..0]
               cbs[i](args...)
      @