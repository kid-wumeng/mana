Bin = require('./Bin')

module.exports = class BinPacker

   constructor: (w=0, h=w) ->
      @w=w
      @h=h
      @list=[]
      @bins=[]

   add: (w, h, data) ->
      @list.push([w, h, data])
      return @

   sort: ->
      @list.sort ([w1, h1], [w2, h2]) =>
         return Math.max(w2, h2) - Math.max(w1, h1)
      return @

   pack: ->
      @sort()
      @bins.push(bin = new Bin(@w, @h))
      @list.forEach ([w, h, data]) =>
         if @w >= w and @h >= h
            if bin.add(w, h, data) is false
               bin = new Bin(@w, @h)
               bin.add(w, h, data)
               @bins.push(bin)
      return @bins