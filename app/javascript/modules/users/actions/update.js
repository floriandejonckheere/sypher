import client from 'lib/apollo'

import requests from '../requests'

import updateUser from './update.gql'

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch('requests/doRequest', {
    requestType: requests.update,
    request: () => client.mutate({ mutation: updateUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit('set', { user: data.updateUser.user })
  })
}
