require('../')
dict = new Dict().set('kid', 18)

console.log 'kid', dict.get('kid')
console.log 'kid', dict.map((age)->age+10).get('kid')
console.log dict.from(new Dict().set('cat', 6))