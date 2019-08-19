module.exports = class VertexBuffer extends Float32Array

   constructor: (capacity=0, attributes...) ->
      view = new Map()
      view_size = attributes.reduce((offset, [name, size])->
         view.set(name, offset)
         offset += size
      , 0)
      super(view_size * capacity)
      @view = view
      @view_size = view_size

   set: (i, name, values...) ->
      super(values, @view_size * i + @view.get(name))
      @