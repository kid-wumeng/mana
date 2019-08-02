module.exports = mana =
   device:   require('./src/@device')
   math:     require('./src/@math')
   util:     require('./src/@util')
   Canvas:   require('./src/Canvas')
   Clock:    require('./src/Clock')
   Color:    require('./src/Color')
   EventBus: require('./src/EventBus')
   Matrix:   require('./src/Matrix')
   Tween:    require('./src/Tween')
   Vector2:  require('./src/Vector2')
   Vector3:  require('./src/Vector3')
   Vector4:  require('./src/Vector4')

   canvas: (args...) -> new @Canvas(args...)
   color:  (args...) -> new @Color(args...)
   mat:    (args...) -> new @Matrix(args...)
   tween:  (args...) -> new @Tween(args...)
   vec2:   (args...) -> new @Vector2(args...)
   vec3:   (args...) -> new @Vector3(args...)
   vec4:   (args...) -> new @Vector4(args...)

# tween = mana.tween()
# tween.elastic(0.8)
#
# console.log '0.0 -', tween.solve(0.0)
# console.log '0.1 -', tween.solve(0.1)
# console.log '0.2 -', tween.solve(0.2)
# console.log '0.3 -', tween.solve(0.3)
# console.log '0.4 -', tween.solve(0.4)
# console.log '0.5 -', tween.solve(0.5)
# console.log '0.6 -', tween.solve(0.6)
# console.log '0.7 -', tween.solve(0.7)
# console.log '0.8 -', tween.solve(0.8)
# console.log '0.9 -', tween.solve(0.9)
# console.log '1.0 -', tween.solve(1.0)

# clock = new mana.Clock
# clock.start()
# console.log '-------'
#
# setTimeout ->
#    clock.scale(1000)
#    # setTimeout ->
#    #    clock.start()
#    # , 1000
# , 3000

bus = new mana.EventBus()
abc = (a) -> console.log a
bus.on('update', abc)
bus.once('update', abc)
bus.on('update', abc)
bus.on('update', abc)
bus.emit('update', 123)
console.log bus