{ resolve } = require('path')
{ ProvidePlugin } = require('webpack')

module.exports =
   entry:
      'Canvas':      'demo/Canvas'
      'Clock':       'demo/Clock'
      'EventBus':    'demo/EventBus'
      'ImageLoader': 'demo/ImageLoader'
      'Math':        'demo/Math'
      'Matrix':      'demo/Matrix'
      'Rect':        'demo/Rect'
      'Shader':      'demo/Shader'
      'Tween':       'demo/Tween'
      'Vector':      'demo/Vector'
      'View':        'demo/View'
   module:
      rules: [{
         test: /\.coffee$/
         loader: 'coffee-loader'
      }]
   resolve:
      alias:
         'demo': resolve(__dirname, './demo')
         'mana': resolve(__dirname, './mana')
      extensions: ['.js', '.coffee']
   plugins: [
      new ProvidePlugin({
         'Canvas':      'mana/Canvas'
         'Clock':       'mana/Clock'
         'EventBus':    'mana/EventBus'
         'ImageLoader': 'mana/ImageLoader'
         'Math':        'mana/Math'
         'Helper':      'mana/Helper'
         'GET':        ['mana/Helper', 'GET']
         'SET':        ['mana/Helper', 'SET']
         'Matrix':      'mana/Matrix'
         'Rect':        'mana/Rect'
         'Shader':      'mana/Shader'
         'Tween':       'mana/Tween'
         'Vector':      'mana/Vector'
         'View':        'mana/View'
      })
   ]
   devServer:
      host: '0.0.0.0'
      port: 9999
      clientLogLevel: 'warning'
   devtool: 'source-map'