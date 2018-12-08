const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const graphql =  require('./loaders/graphql')

environment.loaders.append('vue', vue)
environment.loaders.append('graphql', graphql)
module.exports = environment
