{ max } = Math
Bin = require('./Bin')

module.exports = class BinPacker

   pack: (items, W=0, H=W) ->
      bins = []
      if items.length
         items.sort ([data1, w1, h1], [data2, w2, h2]) -> max(w2, h2) - max(w1, h1)
         bin = new Bin(W, H)
         for [data, w, h] in items
            if w <= W and h <= H
               if not bin.add(data, w, h)
                  bins.push(bin)
                  bin = new Bin(W, H)
                  bin.add(data, w, h)
         bins.push(bin)
      return bins