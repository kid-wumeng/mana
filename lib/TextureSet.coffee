Dict = require('./Dict')

module.exports = class TextureSet

   constructor: (ctx, gl, w=400, h=w) ->
      @ctx = ctx
      @gl = gl
      @w = w
      @h = h
      @loader = new ImageLoader
      @packer = new ImagePacker(w, h)
      @images = new Dict
      @views = new Dict
      @ids = new Dict
      @image = gl.createTexture()
      @table = gl.createTexture()

   set: (name, src) ->
      @loader.set(name, src)
      return @

   run: (cb=->) ->
      { ctx, gl, w, h, loader, packer, images, views, ids, image, table } = @

      images.add(await loader.run())
      packer.add(images).run()
      views.add(packer.views)
      cb.call(@, @)

      table_i = new Float32Array(views.size)
      table_X = new Float32Array(views.size)
      table_Y = new Float32Array(views.size)
      table_W = new Float32Array(views.size)
      table_H = new Float32Array(views.size)
      table_x = new Float32Array(views.size)
      table_y = new Float32Array(views.size)
      table_w = new Float32Array(views.size)
      table_h = new Float32Array(views.size)

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
         ids.set(name, id++/views.size)

      gl.bindTexture(gl.TEXTURE_2D_ARRAY, table)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST)
      gl.texStorage3D(gl.TEXTURE_2D_ARRAY,  1, gl.R32F, views.size, 1, 9)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 0, views.size, 1, 1, gl.RED, gl.FLOAT, table_i)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 1, views.size, 1, 1, gl.RED, gl.FLOAT, table_X)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 2, views.size, 1, 1, gl.RED, gl.FLOAT, table_Y)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 3, views.size, 1, 1, gl.RED, gl.FLOAT, table_W)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 4, views.size, 1, 1, gl.RED, gl.FLOAT, table_H)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 5, views.size, 1, 1, gl.RED, gl.FLOAT, table_x)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 6, views.size, 1, 1, gl.RED, gl.FLOAT, table_y)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 7, views.size, 1, 1, gl.RED, gl.FLOAT, table_w)
      gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, 8, views.size, 1, 1, gl.RED, gl.FLOAT, table_h)

      gl.bindTexture(gl.TEXTURE_2D_ARRAY, image)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MIN_FILTER, gl.NEAREST)
      gl.texParameteri(gl.TEXTURE_2D_ARRAY, gl.TEXTURE_MAG_FILTER, gl.NEAREST)
      gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.RGBA8, w, h, packer.bins.length)
      packer.draw ctx, (canvas, i) ->
         gl.texSubImage3D(gl.TEXTURE_2D_ARRAY, 0, 0, 0, i, w, h, 1, gl.RGBA, gl.UNSIGNED_BYTE, canvas)

      return @