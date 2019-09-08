module.exports =
   entry: require('fs').readdirSync('./demo').filter((name)=>/\.coffee$/.test(name)).map((name)=>name.replace(/\.coffee$/,'')).reduce(((entry, name)=>entry[name]="./demo/#{name}"; entry), {})
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