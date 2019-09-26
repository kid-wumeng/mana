Animation = require('./Animation')
Dict = require('./Dict')

module.exports = class AnimationManager extends Dict

   constructor: ->
      super()
      @current = null

   set: (name) ->
      animation = new Animation
      super(name, animation)
      return animation

   use: (name) ->
      if @has(name)
         @current = @get(name)
      else
         @current = null
      return @

   next: ->
      if @current
         @current.next()
      return @