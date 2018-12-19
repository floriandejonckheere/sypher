import client from 'lib/apollo'

import sync from './sync.gql'

export default async ({ commit, dispatch }, payload) => {
  return dispatch('requests/doRequest', {
    requestType: requests.sync,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit('setUser', { user: data.completeUser.user })
    // TODO: dispatch action to sync user data
  })
}
