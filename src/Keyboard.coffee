KEYS=[0..221].fill('')

KEYS[8]='DELETE'; KEYS[9]='TAB'; KEYS[13]='ENTER'; KEYS[16]='SHIFT'; KEYS[17]='CTRL'; KEYS[18]='ALT'; KEYS[27]='ESC'; KEYS[32]='SPACE'
KEYS[37]='->L'; KEYS[38]='->T'; KEYS[39]='->R'; KEYS[40]='->B'
KEYS[48]='0'; KEYS[49]='1'; KEYS[50]='2'; KEYS[51]='3'; KEYS[52]='4'; KEYS[53]='5'; KEYS[54]='6'; KEYS[55]='7'; KEYS[56]='8'; KEYS[57]='9'
KEYS[65]='A'; KEYS[66]='B'; KEYS[67]='C'; KEYS[68]='D'; KEYS[69]='E'; KEYS[70]='F'; KEYS[71]='G'
KEYS[72]='H'; KEYS[73]='I'; KEYS[74]='J'; KEYS[75]='K'; KEYS[76]='L'; KEYS[77]='M'; KEYS[78]='N'
KEYS[79]='O'; KEYS[80]='P'; KEYS[81]='Q'; KEYS[82]='R'; KEYS[83]='S'; KEYS[84]='T'
KEYS[85]='U'; KEYS[86]='V'; KEYS[87]='W'; KEYS[88]='X'; KEYS[89]='Y'; KEYS[90]='Z'
KEYS[91]='META'
KEYS[186]=';'; KEYS[187]='='; KEYS[188]=','; KEYS[189]='-'; KEYS[190]='.'; KEYS[191]='/'; KEYS[192]='`'; KEYS[219]='['; KEYS[220]='\\'; KEYS[221]=']'

module.exports = class Keyboard

   constructor: ->
      @actives = KEYS.filter((name) -> name).reduce(((actives, name) -> actives[name]=false; actives), {})
      @down
      @up
      document.addEventListener('keydown', @handle_down)
      document.addEventListener('keyup',   @handle_up)

   handle_down: (event) => @actives[name=KEYS[event.keyCode]]=true;  @down(name) if @down
   handle_up:   (event) => @actives[name=KEYS[event.keyCode]]=false; @up(name)   if @up

   active: (name) -> @actives[name] is true