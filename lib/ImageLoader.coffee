module.exports = class ImageLoader extends Array

   add: (name, src) ->
      @push([name, src])
      return @

   load: ->
      return Promise.all @map ([name, src]) ->
         new Promise (resolve) ->
            image = new Image()
            image.src = src
            image.onload = -> resolve([name, image])