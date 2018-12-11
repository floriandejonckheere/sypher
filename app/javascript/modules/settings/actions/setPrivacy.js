import client from 'lib/apollo'

import setPrivacy from './setPrivacy.gql'

export default async ({ commit, dispatch }, payload) => {
  const { seenScope, readScope } = payload

  return dispatch('requests/doRequest', {
    requestType: 'setPrivacy',
    request: () => client.mutate({ mutation: setPrivacy, variables: { seenScope, readScope } })
  }, { root: true }).then(() => {
    commit('setPrivacy', { seenScope, readScope })
  })
}
