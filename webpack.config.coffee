{ resolve } = require('path')
{ ProvidePlugin } = require('webpack')

module.exports =
   entry:
      'mana':                   './index'
      'examples/canvas_2d':     './examples/canvas_2d'
      'examples/canvas_webgl':  './examples/canvas_webgl'
      'examples/canvas_webgl2': './examples/canvas_webgl2'
      'examples/transform':     './examples/transform'

   output:
      path: resolve(__dirname, 'dist')
      filename: '[name].js'
      publicPath: 'dist'
      library: 'mana'
      libraryTarget: 'umd'

   module:
      rules: [{
         test: /\.coffee$/
         loader: 'coffee-loader'
      },{
         test: /\.(?:vs)|(?:fs)$/
         loader: 'shader-loader'
      }]

   resolve:
      extensions: ['.js', '.coffee']

   plugins: [
      new ProvidePlugin({
         'device':     resolve(__dirname, 'src/device/@')
         'math':       resolve(__dirname, 'src/math/@')
         'Matrix3':    resolve(__dirname, 'src/math/Matrix3')
         'Matrix4':    resolve(__dirname, 'src/math/Matrix4')
         'Vector2':    resolve(__dirname, 'src/math/Vector2')
         'Vector3':    resolve(__dirname, 'src/math/Vector3')
         'Vector4':    resolve(__dirname, 'src/math/Vector4')
         'Canvas':     resolve(__dirname, 'src/renderer/Canvas')
         'Shader':     resolve(__dirname, 'src/renderer/Shader')
         'Translate2': resolve(__dirname, 'src/transform/Translate2')
         'util':       resolve(__dirname, 'src/util/@')
         'Clock':      resolve(__dirname, 'src/util/Clock')
         'Color':      resolve(__dirname, 'src/util/Color')
         'EventBus':   resolve(__dirname, 'src/util/EventBus')
         'Tween':      resolve(__dirname, 'src/util/Tween')
         'GET':       [resolve(__dirname, 'src/util/@'), 'get']
         'SET':       [resolve(__dirname, 'src/util/@'), 'set']
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'

   devtool: 'source-map'