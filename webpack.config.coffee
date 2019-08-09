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
         'GET': [resolve(__dirname, 'src/util/@'), 'get']
         'SET': [resolve(__dirname, 'src/util/@'), 'set']
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'

   devtool: 'source-map'