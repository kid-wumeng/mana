module.exports =
   entry:
      'mana': './index'
      'examples/canvas': './examples/canvas'
   output:
      path: require('path').resolve(__dirname, 'dist')
      filename: '[name].js'
      publicPath: 'dist'
      library: 'mana'
      libraryTarget: 'var'
   module:
      rules: [{
         test: /\.coffee$/
         loader: 'coffee-loader'
      }]
   resolve:
      extensions: ['.js', '.coffee']
   devServer:
      host: '0.0.0.0'
      port: 9999
   devtool: 'source-map'