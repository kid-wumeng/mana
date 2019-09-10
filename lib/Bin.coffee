module.exports = class Bin extends Array

   constructor: (w, h) ->
      super()
      @root = new Area(0, 0, w, h)

   add: (data, w, h) ->
      if area = @root.find(w, h)
         @push([data, area.x, area.y, w, h])
         @


class Area extends require('./Rect')
   find: (w, h) ->
      if @used
         if @R and area = @R.find(w, h) then return area
         if @B and area = @B.find(w, h) then return area
      else
         if @w >= w and @h >= h
            @R = new Area(@x+w, @y, @w-w, h)  if w < @w
            @B = new Area(@x, @y+h, @w, @h-h) if h < @h
            @used = true
            return @
      return null