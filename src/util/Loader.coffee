module.exports = class Loader extends require('./EventBus')

   constructor: ->
      super()
      @count = 0
      @total = 0
      @images = {}
      @audios = {}

   image: (name, src) => @images[name] = src; @total += 1; @
   audio: (name, src) => @audios[name] = src; @total += 1; @

   call: ->
      @call_image(name, src) for name, src of @images
      new Promise (resolve) => @on('finish', resolve)

   call_image: (name, src) ->
      image = new Image
      image.src = src
      image.onload = => @images[name] = image; @done(name, image)

   done: (name, asset) ->
      @count += 1
      @emit('update', name, asset)
      @emit('finish', @) if @count is @total

   clear: ->
      @count = 0
      @total = 0
      @images = {}
      @audios = {}