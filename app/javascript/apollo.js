import Vue from 'vue'
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'

import config from './config'

const httpLink = new HttpLink({
  uri: config.api.uri,
})

const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: true,
})

const provider = new VueApollo({
  defaultClient: client,
})

// Install the vue plugin
Vue.use(VueApollo)

export default provider
