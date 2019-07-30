module.exports = device = {}

Object.defineProperty device, 'dpr', get: -> devicePixelRatio || 1
Object.defineProperty device, 'h',   get: -> innerHeight
Object.defineProperty device, 'w',   get: -> innerWidth