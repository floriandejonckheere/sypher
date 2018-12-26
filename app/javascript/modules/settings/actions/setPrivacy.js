import client from 'lib/apollo'

import setPrivacy from './setPrivacy.gql'

export const type = 'settings/SET_PRIVACY'
export default async ({ commit, dispatch, rootGetters }, payload) => {
  const { seenScope, readScope } = payload

  return dispatch('requests/doRequest', {
    requestType: type,
    request: () => client.mutate({ mutation: setPrivacy, variables: { seenScope, readScope } })
  }, { root: true }).then(() => {
    const phone = rootGetters['auth/getCurrentPhone']

    commit(type, { phone, seenScope, readScope })
  })
}
