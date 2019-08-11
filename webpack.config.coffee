{ resolve, parse } = require('path')
{ sync }           = require('glob')
{ ProvidePlugin }  = require('webpack')

module.exports = [{
   name: 'dev'
   entry: sync('./examples/*.coffee').reduce ((entry, example) -> entry[parse(example).name]=example; entry), {}
   output:
      path: resolve(__dirname, 'dist')
      filename: '[name].js'
   module:
      rules: [{
         test: /\.coffee$/
         loader: 'coffee-loader'
      }]
   resolve:
      extensions: ['.js', '.coffee']
   plugins: [
      new ProvidePlugin({mana: resolve(__dirname, 'src')})
   ]
   devServer:
      host: '0.0.0.0'
      port: 9999
      stats: 'errors-only'
      clientLogLevel: 'warning'
   devtool: 'source-map'
},{
   name: 'build'
   mode: 'production'
   entry: './src'
   output:
      path: resolve(__dirname, 'dist')
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
}]