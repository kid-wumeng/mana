module.exports = class EventBus
   constructor: ->
      @map = {}

   on: (name, cb) ->
      @map[name] ?= []
      @map[name].push(cb)
      @

   off: (name, cb) ->
      if cbs = @map[name]
         cbs.splice(i,1) if (i=cbs.indexOf(cb)) > -1
      @

   emit: (name, args...) ->
      if cbs = @map[name]
         cbs[i](args...) for i in [len-1..0] if len=cbs.length
      @