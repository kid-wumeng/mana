resolve = require('path').resolve


module.exports =
   entry:
      'mana': './src'
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
      alias:
         'Canvas': resolve(__dirname, 'src/Canvas/Canvas')
         'device': resolve(__dirname, 'src/device/device')
   devServer:
      host: '0.0.0.0'
      port: 9999
   devtool: 'source-map'