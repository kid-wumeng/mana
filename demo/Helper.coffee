class Room extends Float32Array
   constructor: (w, h) -> super(w, h)

Helper.GET Room::, 'area',  -> @[0]*@[1]
Helper.SET Room::, 'w', (w) -> @[0]=w
Helper.SET Room::, 'h', (h) -> @[1]=h

room = new Room(2, 4)
room.w = 3
room.h = 5
console.log 'GET/SET:', room.area

data = {}
Helper.set(data, 'user.color', []).set(data, 'user.color.1', 255)
console.log 'get/set:', Helper.get(data, 'user.color.1', -> new Vector(0, 0))