module.exports = class Dict extends Map

   map: (cb=(v)->v) ->
      dict = new Dict
      @forEach((v, k) => dict.set(k, cb(v, k)))
      return dict

   filter: (cb=->false) ->
      dict = new Dict
      @forEach((v, k) => dict.set(k, v) if cb(v, k))
      return dict

   from: (dict) ->
      dict.forEach((v, k) => @set(k, v))
      return @