require('../')

class Room extends Float32Array
   constructor: (w, h) -> super(w, h)

Helper.GET Room::, 'area',  -> @[0]*@[1]
Helper.SET Room::, 'w', (w) -> @[0]=w
Helper.SET Room::, 'h', (h) -> @[1]=h

room = new Room(2, 4)
room.w = 3
room.h = 5
console.log 'area:', room.area