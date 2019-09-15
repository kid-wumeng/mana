require('../')

dict1 = new Dict().set('kid', 18)
dict2 = new Dict().set('cat', 16)

console.log 'kid', dict1.get('kid')
console.log 'kid', dict1.map((age)->age+10).get('kid')
console.log dict1.from(dict2)