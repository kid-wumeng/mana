module.exports = device = {}

get device, 'dpr', -> devicePixelRatio || 1
get device, 'h',   -> innerHeight
get device, 'w',   -> innerWidth