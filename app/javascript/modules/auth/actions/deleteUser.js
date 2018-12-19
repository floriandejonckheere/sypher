import client from 'lib/apollo'

import requests from '../requests'

import deleteUser from './deleteUser.gql'

export default async ({ commit, dispatch }) => {
  return dispatch('requests/doRequest', {
    requestType: requests.delete,
    request: () => client.mutate({ mutation: deleteUser })
  }, { root: true }).then(() => {
    commit('reset', null, { root: true })
  })
}
