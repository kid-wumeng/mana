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
      },{
         test: /\.(?:vs)|(?:fs)$/
         loader: 'shader-loader'
      }]

   resolve:
      extensions: ['.js', '.coffee']

   plugins: [
      new ProvidePlugin({
         'Matrix2': resolve(__dirname, 'src/math/Matrix2')
         'Matrix3': resolve(__dirname, 'src/math/Matrix3')
         'Matrix4': resolve(__dirname, 'src/math/Matrix4')
         'Vector2': resolve(__dirname, 'src/math/Vector2')
         'Vector3': resolve(__dirname, 'src/math/Vector3')
         'Vector4': resolve(__dirname, 'src/math/Vector4')
         'get': [resolve(__dirname, 'src/@util'), 'get']
         'set': [resolve(__dirname, 'src/@util'), 'set']
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'

   devtool: 'source-map'