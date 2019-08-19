GET     = require('../GET')
Matrix3 = require('../math/Matrix3')

module.exports = class MatrixStack3 extends Array

   constructor: ->
      super()
      Array.prototype.push.call(@, new Matrix3)

   push: (mat) -> super(@top.clone.concat(mat)); @
   pop:        -> super();                       @

   transform:  (vertices, start=0, end=vertices.length-1) ->
      top = @top
      for i in [start..end]
         top.transform(vertices[i])
      @

GET MatrixStack3::, 'top', -> @[@length-1]