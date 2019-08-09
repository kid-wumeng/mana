module.exports = mana = require('./src')


v1 = new mana.Vector2(10, 20)
translate = new mana.Translate2()
translate.val(7, 9)

translate.transform(v1)
console.log v1