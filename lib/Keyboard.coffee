KEYS =
   8:  'DELETE', 9: 'TAB', 13: 'ENTER', 16: 'SHIFT', 17: 'CTRL', 18: 'ALT', 27: 'ESC', 32: 'SPACE'
   37: 'LEFT',  38: 'UP',  39: 'RIGHT', 40: 'DOWN'
   48: '0', 49: '1', 50: '2', 51: '3', 52: '4', 53: '5', 54: '6', 55: '7', 56: '8', 57: '9'
   65: 'A', 66: 'B', 67: 'C', 68: 'D', 69: 'E', 70: 'F', 71: 'G'
   72: 'H', 73: 'I', 74: 'J', 75: 'K', 76: 'L', 77: 'M', 78: 'N'
   79: 'O', 80: 'P', 81: 'Q', 82: 'R', 83: 'S', 84: 'T'
   85: 'U', 86: 'V', 87: 'W', 88: 'X', 89: 'Y', 90: 'Z'
   91: 'META'
   186: ';', 187: '=', 188: ',', 189: '-', 190: '.', 191: '/', 192: '`', 219: '[', 220: '\\', 221: ']'

module.exports = class Keyboard extends require('./EventBus')
   constructor: ->
      super()
      @actives = Object.values(KEYS).reduce(((actives, name) => actives[name]=false; actives), {})
      document.addEventListener('keydown', (event) => name=KEYS[event.keyCode]; @actives[name]=true;  @emit('down', name); @emit("down:#{name}"))
      document.addEventListener('keyup',   (event) => name=KEYS[event.keyCode]; @actives[name]=false; @emit('up', name); @emit("up:#{name}"))