device = require('device')

module.exports = ->
   this
      .size(device.w, device.h)
      .color('rgb(127, 127, 127)')
      .fixed()
      .mount()