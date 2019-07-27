const path = require("path")


module.exports =
{
    mode: 'development',
    entry: ['.'],

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'mana.js',
        publicPath: '/dist/',
        library: 'mana',
        libraryTarget: 'umd'
    },

    resolveLoader: {
        modules: ['.', 'node_modules']
    },

    module: {
        rules: [{
            test: /\.coffee$/,
            loader: 'coffee-loader'
        },{
            test: /\.(?:vs)|(?:fs)$/,
            loader: 'shader-loader'
        }]
    },

    resolve: {
        extensions: ['.js', '.json', '.coffee']
    },

    devServer: {
        host: '0.0.0.0',
        port: 9999,
        contentBase: path.join(__dirname, '/'),
        watchContentBase: true
    }
}