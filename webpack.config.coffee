module.exports =
   entry:
      'mana': './src'
      'examples/canvas': './examples/canvas'
   output:
      path: require('path').resolve(__dirname, 'dist')
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
   devServer:
      host: '0.0.0.0'
      port: 9999