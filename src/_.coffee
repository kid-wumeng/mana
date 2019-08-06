module.exports = util =
   get: (object, name, get) -> Object.defineProperty(object, name, {get})
   set: (object, name, set) -> Object.defineProperty(object, name, {set})