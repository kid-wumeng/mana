module.exports =
   entry:
      'Dict': './demo/Dict'
      'Quadtree': './demo/Quadtree'
      'Rect': './demo/Rect'
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
   # devtool: 'source-map'