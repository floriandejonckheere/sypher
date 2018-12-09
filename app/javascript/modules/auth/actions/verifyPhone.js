import client from 'lib/apollo'

import { verifyPhone } from './verifyPhone.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch('requests/doRequest', {
    requestType: 'verifyPhone',
    request: () => client.mutate({ mutation: verifyPhone, variables: { phone } })
  }, { root: true }).then((data) => {
    commit('setUser', { user: { name: null, phone: data.verifyPhone.phone } })
  })
}
