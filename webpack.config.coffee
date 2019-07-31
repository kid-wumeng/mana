{ resolve } = require('path')
{ ProvidePlugin } = require('webpack')

module.exports =
   entry:
      'mana': './index'
      'examples/canvas': './examples/canvas'

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
         'device': resolve(__dirname, 'src/$device')
         'math':   resolve(__dirname, 'src/$math')
         'util':   resolve(__dirname, 'src/$util')
         'Canvas': resolve(__dirname, 'src/Canvas')
         'Color':  resolve(__dirname, 'src/Color')
         'Color3': resolve(__dirname, 'src/Color3')
         'Color4': resolve(__dirname, 'src/Color4')
         'Vector': resolve(__dirname, 'src/Vector')
      })
   ]

   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'none'

   devtool: 'source-map'