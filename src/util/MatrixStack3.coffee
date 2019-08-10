Matrix3 = require('../math/Matrix3')
module.exports = class MatrixStack3 extends Array

   constructor: ->
      super()
      Array.prototype.push.call(@, new Matrix3)

   push: (mat) ->
      super(@top.clone.concat(mat))
      @

   pop: ->
      super()
      @

GET MatrixStack3::, 'top', -> @[@length-1]