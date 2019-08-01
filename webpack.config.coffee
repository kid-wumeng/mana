{ resolve } = require('path')
{ ProvidePlugin } = require('webpack')

module.exports =
   entry:
      'mana': './index'
      'examples/canvas_2d': './examples/canvas_2d'

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
      }]

   resolve:
      extensions: ['.js', '.coffee']

   plugins: [
      new ProvidePlugin({
         'device':   resolve(__dirname, 'src/@device')
         'math':     resolve(__dirname, 'src/@math')
         'util':     resolve(__dirname, 'src/@util')
         'Canvas':   resolve(__dirname, 'src/Canvas')
         'Canvas2D': resolve(__dirname, 'src/Canvas2D')
         'Canvas3D': resolve(__dirname, 'src/Canvas3D')
         'Color':    resolve(__dirname, 'src/Color')
         'Matrix':   resolve(__dirname, 'src/Matrix')
         'Vector2':  resolve(__dirname, 'src/Vector2')
         'Vector3':  resolve(__dirname, 'src/Vector3')
         'Vector4':  resolve(__dirname, 'src/Vector4')
         'get':     [resolve(__dirname, 'src/@util'), 'get']
         'set':     [resolve(__dirname, 'src/@util'), 'set']
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'

   devtool: 'source-map'