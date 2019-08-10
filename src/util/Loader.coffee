module.exports = class Loader extends require('./EventBus')

   constructor: ->
      super()
      @count = 0
      @total = 0
      @images = {}
      @audios = {}

   image: (name, src) -> @images[name] = src; @total += 1; @
   audio: (name, src) -> @audios[name] = src; @total += 1; @

   call: ->
      @call_image(name, src) for name, src of @images
      @

   call_image: (name, src) ->
      image = new Image
      image.src = src
      image.onload = => @images[name] = image; @done()

   done: ->
      @count += 1
      @emit('update')
      @emit('finish', @) if @count is @total