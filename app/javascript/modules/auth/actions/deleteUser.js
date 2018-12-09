import client from 'lib/apollo'

import deleteUser from './deleteUser.gql'

export default async ({ commit, dispatch }) => {
  return dispatch('requests/doRequest', {
    requestType: 'deleteUser',
    request: () => client.mutate({ mutation: deleteUser })
  }, { root: true }).then(() => {
    commit('reset', null, { root: true })
  })
}
