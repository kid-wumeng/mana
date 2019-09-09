class Area extends require('./Rect')
   find: (w, h) ->
      if @used
         if @R and area = @R.find(w, h) then return area
         if @B and area = @B.find(w, h) then return area
      else
         if @w >= w and @h >= h
            @R = new Area(@x+w, @y, @w-w, h)  if w < @w
            @B = new Area(@x, @y+h, @w, @h-h) if h < @h
            @used = true;
            return new Area(@x, @y, w, h)
      return null

module.exports = class Bin extends Area
   constructor: (w, h) -> super(0, 0, w, h)