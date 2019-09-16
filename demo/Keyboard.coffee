keyboard = new Keyboard()

setInterval ->
   if keyboard.active('->L') then console.log '←'
   if keyboard.active('->T') then console.log '↑'
   if keyboard.active('->R') then console.log '→'
   if keyboard.active('->B') then console.log '↓'

keyboard.up = (name) ->
   if name is 'ENTER' then console.log 'enter'