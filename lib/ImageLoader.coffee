Dict = require('./Dict')

module.exports = class ImageLoader extends Dict

   load: ->
      tasks = []
      @forEach (name, src) ->
         tasks.push new Promise (resolve) ->
            image = new Image()
            image.src = src
            image.onload = -> resolve([name, image])
      images = await Promise.all(tasks)
      return new Dict(images)