import client from 'lib/apollo'

import requests from '../requests'

import setPrivacy from './setPrivacy.gql'

export default async ({ commit, dispatch, rootGetters }, payload) => {
  const { seenScope, readScope } = payload

  return dispatch('requests/doRequest', {
    requestType: requests.setPrivacy,
    request: () => client.mutate({ mutation: setPrivacy, variables: { seenScope, readScope } })
  }, { root: true }).then(() => {
    const phone = rootGetters['auth/getCurrentPhone']

    commit('setPrivacy', { phone, seenScope, readScope })
  })
}
