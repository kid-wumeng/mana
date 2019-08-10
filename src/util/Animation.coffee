Rect = require('../shape/Rect')

module.exports = class Animation
   constructor: (@w, @h) ->
      @frames = []

   frame: (x, y, w, h) ->
      @frames.push(new Rect(x/@w, y/@h, w/@w, h/@h))

   split: (w, h) ->
      for y in [0...@h/h]
         for x in [0...@w/w]
            @frame(x*w, y*h, w, h)