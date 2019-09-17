Bin  = require('./Bin')
Dict = require('./Dict')

module.exports = class BinPacker

   constructor: (w=0, h=w) ->
      @size  = { w, h }
      @bins  = []
      @items = []
      @views = new Dict

   add: (data, w, h) ->
      @items.push([data, w, h])
      return @

   run: ->
      bin=@sort().create()
      for [data, w, h] in @items
         if @accept(w, h)
            if bin.add(data, w, h) is null
               bin=@create()
               bin.add(data, w, h)
      return @record()

   sort: ->
      @items.sort ([data1, w1, h1], [data2, w2, h2]) ->
         return Math.max(w2, h2) - Math.max(w1, h1)
      return @

   create: () ->
      bin = new Bin(@size.w, @size.h)
      @bins.push(bin)
      return bin

   accept: (w, h) ->
      return w <= @size.w and h <= @size.h

   record: ->
      @bins.forEach (bin, i) =>
         bin.dict.forEach (data, view) =>
            @views.set(data, view.index(i))
      return @