import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'

import { setType } from '../mutations'

import updateUser from './update.gql'

export const type = 'users/UPDATE'
export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch(requestType, {
    requestType: type,
    request: () => client.mutate({ mutation: updateUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit(setType, { user: data.updateUser.user })
  })
}
