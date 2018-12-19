import client from 'lib/apollo'

import requests from '../requests'

import destroy from './destroy.gql'

export default async ({ commit, dispatch }) => {
  return dispatch('requests/doRequest', {
    requestType: requests.destroy,
    request: () => client.mutate({ mutation: destroy })
  }, { root: true }).then(() => {
    commit('reset', null, { root: true })
  })
}
