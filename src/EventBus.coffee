module.exports = class EventBus

   constructor: ->
      @events = {}

   on: (name, cb) ->
      @events[name] ?= []
      @events[name].push(cb)
      return @

   off: (name, cb) ->
      if cbs = @events[name]
         cbs.splice(i,1) if (i=cbs.indexOf(cb)) > -1
      return @

   emit: (name, args...) ->
      if cbs = @events[name]
         cbs[i](args...) for i in [len-1..0] if len=cbs.length
      return @

EventBus.demo = ->
   new EventBus().on('update', console.log)
      .emit('update', 1)
      .emit('update', 2).off('update', console.log)
      .emit('update', 3)