import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { setContext } from 'apollo-link-context'
import { InMemoryCache } from 'apollo-cache-inmemory'

import auth from 'modules/auth'

import config from 'lib/config'
import store from 'lib/store'

const httpLink = new HttpLink({
  uri: config.api.uri,
})

const authLink = setContext((_, { headers }) => {
  const token = store.getters[auth.types.getters.getToken]

  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : '',
    }
  }
})

const client = new ApolloClient({
  link: authLink.concat(httpLink),
  cache: new InMemoryCache(),
  connectToDevTools: true,
})

export default client
