const environment = require('./environment')
const merge = require('webpack-merge')

// environment.plugins.set('CommonsChunkPlugin',
//     new webpack.optimize.CommonsChunkPlugin({ }))

const config = environment.toWebpackConfig()

const additionalConfig = {
    // output: {
    //     library: ['Packs', '[name]'],
    //     libraryTarget: 'var'
    // }
}

module.exports = merge(config, additionalConfig)
