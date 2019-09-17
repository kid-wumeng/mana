module.exports =
   entry: './index.dev'
   output:
      path: require('path').resolve(__dirname, 'dist')
      filename: 'mana.js'
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
      stats: 'errors-only'
      clientLogLevel: 'warning'
   devtool: 'source-map'