module.exports = class Dict extends Map

   map: (cb=(value)->value) ->
      dict = new Dict()
      @forEach (value, name) ->
         dict.set(name, cb(value, name))
      return dict

   filter: (cb=->false) ->
      dict = new Dict()
      @forEach (value, name) ->
         if cb(value, name)
            dict.set(name, value)
      return dict

   from: (dict) ->
      dict.forEach (value, name) =>
         @set(name, value)
      return @