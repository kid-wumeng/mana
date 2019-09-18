module.exports =
   GET: (data, name, get) -> Object.defineProperty(data, name, {get, configurable: true}); @
   SET: (data, name, set) -> Object.defineProperty(data, name, {set, configurable: true}); @

   get: (data, name, replace) ->
      for part in name.split('.')
         if data? then data = data[part] else break
      return data ? if replace instanceof Function then replace() else replace

   set: (data, name, value) ->
      name = name.split('.')
      last = name.pop()
      for part in name
         data = data[part] ?= {}
      data[last] = value
      return @