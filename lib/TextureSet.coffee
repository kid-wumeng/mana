Dict = require('./Dict')

module.exports = class TextureSet

   constructor: (w=400, h=w) ->
      @images = new Dict
      @loader = new ImageLoader
      @packer = new ImagePacker(w, h)

   set: -> @loader.set(arguments...); @

   run: (ctx, gl) ->
      canvas = ctx.canvas
      @images.add(await @loader.run())


      image = gl.createTexture()


      @packer.all(@images).run()
      bins  = @packer.bins


      gl.bindTexture(gl.TEXTURE_2D_ARRAY, image)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST)
      gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.RGBA8, 400, 400, bins.length)



      @packer.draw ctx, (canvas, i) ->
         gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, i, canvas.w, canvas.h, 1, gl.RGBA, gl.UNSIGNED_BYTE, canvas)

      images = @images


      views = @packer.views



      table_i = new Float32Array(images.size)
      table_X = new Float32Array(images.size)
      table_Y = new Float32Array(images.size)
      table_W = new Float32Array(images.size)
      table_H = new Float32Array(images.size)
      table_x = new Float32Array(images.size)
      table_y = new Float32Array(images.size)
      table_w = new Float32Array(images.size)
      table_h = new Float32Array(images.size)

      id = 0
      views.forEach (name, view) ->
         table_i[id] = view.i
         table_X[id] = view.x
         table_Y[id] = view.y
         table_W[id] = view.w
         table_H[id] = view.h
         table_x[id] = view.unit.x
         table_y[id] = view.unit.y
         table_w[id] = view.unit.w
         table_h[id] = view.unit.h
         id++

      gl.bindTexture(gl.TEXTURE_2D, gl.createTexture())
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST)
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST)
      gl.texStorage2D(gl.TEXTURE_2D,  1, gl.R32F, images.size, 9)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, images.size, 1, gl.RED, gl.FLOAT, table_i)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 1, images.size, 1, gl.RED, gl.FLOAT, table_X)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 2, images.size, 1, gl.RED, gl.FLOAT, table_Y)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 3, images.size, 1, gl.RED, gl.FLOAT, table_W)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 4, images.size, 1, gl.RED, gl.FLOAT, table_H)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 5, images.size, 1, gl.RED, gl.FLOAT, table_x)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 6, images.size, 1, gl.RED, gl.FLOAT, table_y)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 7, images.size, 1, gl.RED, gl.FLOAT, table_w)
      gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 8, images.size, 1, gl.RED, gl.FLOAT, table_h)