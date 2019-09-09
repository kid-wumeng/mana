module.exports = class ImageLoader extends Map

   load: ->
      tasks = []
      @forEach (src, name) ->
         tasks.push new Promise (resolve) ->
            image = new Image()
            image.src = src
            image.onload = -> resolve([name, image])
      images = await Promise.all(tasks)
      return new Map(images)