exports.get = (object, name, get) -> Object.defineProperty(object, name, {get, configurable: true})
exports.set = (object, name, set) -> Object.defineProperty(object, name, {set, configurable: true})