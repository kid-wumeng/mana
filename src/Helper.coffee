module.exports =
   GET: (object, name, get) -> Object.defineProperty(object, name, {get, configurable: true})
   SET: (object, name, set) -> Object.defineProperty(object, name, {set, configurable: true})