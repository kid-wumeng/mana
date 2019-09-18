Dict = require('./Dict')
View = require('./View')

module.exports = class Bin

   constructor: (w, h) ->
      @dict = new Dict
      @root = new View(0, 0, w, h)

   add: (data, w, h) ->
      if view = @find(@root, w, h)
         view = @slice(view, w, h)
         @dict.set(data, view)
         return view
      else
         return null

   find: (view, w, h) ->
      if view.used
         return @find(view.R, w, h) ? @find(view.B, w, h)
      else
         return if view.w >= w and view.h >= h then view else null

   slice: (view, w, h) ->
      view.used = true
      view.R = view.slice(w, 0, view.w-w, h)
      view.B = view.slice(0, h, view.w, view.h-h)
      return view.slice(0, 0, w, h)