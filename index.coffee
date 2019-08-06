module.exports = mana = require('./src')

tween = mana.tween().ease_in_out()
console.log tween.solve(0.6)