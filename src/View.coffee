Rect = require('./Rect')

module.exports = class View extends Rect

   constructor: (x, y, w, h) ->
      super(x, y, w, h)
      @i = 0
      @unit = new Rect(0, 0, 1, 1)

   index: (@i) ->
      return @

   of: ({ x, y, w, h }) ->
      @unit = new Rect((@x-x)/w, (@y-y)/h, @w/w, @h/h)
      return @

   slice: (x, y, w, h) ->
      return new @constructor(@x+x, @y+y, w, h).of(@)