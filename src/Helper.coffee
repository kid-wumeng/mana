module.exports =
   GET: (data, name, get) -> Object.defineProperty(data, name, {get, configurable: true}); @
   SET: (data, name, set) -> Object.defineProperty(data, name, {set, configurable: true}); @

   get: (data={}, name='', replace) ->
      if name
         for part in name.split('.')
            if data?
               data = data[part]
            else
               break
      return data ? replace

   set: (data={}, name='', value) ->
      if name
         name = name.split('.')
         last = name.pop()
         for part in name
            data = data[part] ?= {}
         data[last] = value
      return @