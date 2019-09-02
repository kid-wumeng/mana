require('../')

keyboard = new Keyboard()
keyboard.on 'down', (name) -> console.log 'down:', name
keyboard.on 'up',   (name) -> console.log 'up:',   name
keyboard.on 'down:ENTER',  -> console.log 'hi~'