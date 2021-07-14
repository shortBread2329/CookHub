// process.env.NODE_ENV = process.env.NODE_ENV || 'development'

// const webpackConfig = require('./base')

// module.exports = webpackConfig
process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()