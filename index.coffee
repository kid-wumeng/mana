module.exports = mana = require('./src')


v1 = new mana.Vector2(1, 1)
t1 = new mana.Translation2()
t2 = new mana.Translation2()
ortho = new mana.ProjectionOrtho2()
rotate = new mana.Rotation2()
scale = new mana.Scaling2()
t1.value(7, 9)
t2.value(100, 200)
ortho.value(0, 100, 0, 100)

rotate.value(math.rad(40))
scale.value(2)

t1.concat(t2)
scale.transform(v1)
# t1.transform(v1)
# t2.transform(v1)
console.log v1