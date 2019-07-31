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
         'device':    resolve(__dirname, 'src/@device')
         'math':      resolve(__dirname, 'src/@math')
         'util':      resolve(__dirname, 'src/@util')
         'Buffer':    resolve(__dirname, 'src/Buffer')
         'Canvas':    resolve(__dirname, 'src/Canvas')
         'Color':     resolve(__dirname, 'src/Color')
         'Matrix':    resolve(__dirname, 'src/Matrix')
         'Quartette': resolve(__dirname, 'src/Quartette')
         'Vector':    resolve(__dirname, 'src/Vector')
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'

   devtool: 'source-map'