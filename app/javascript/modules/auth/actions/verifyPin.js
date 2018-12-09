import client from 'lib/apollo'

import verifyPin from './verifyPin.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone, pin } = payload

  return dispatch('requests/doRequest', {
    requestType: 'verifyPin',
    request: () => client.mutate({ mutation: verifyPin, variables: { phone, pin } })
  }, { root: true }).then((data) => {
    commit('setToken', { token: data.verifyPin.token })
  })
}
