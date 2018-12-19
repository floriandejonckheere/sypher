import client from 'lib/apollo'

import requests from '../requests'

import completeUser from './completeUser.gql'

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch('requests/doRequest', {
    requestType: requests.complete,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit('setUser', { user: data.completeUser.user })
    // TODO: dispatch action to sync user data
  })
}
