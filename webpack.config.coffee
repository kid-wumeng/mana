module.exports =
   entry: './src'
   output:
      path: require('path').resolve(__dirname, 'dist')
      filename: 'mana.js'
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