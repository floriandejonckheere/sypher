import client from 'lib/apollo'

import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import updateUser from './update.gql'

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.update,
    request: () => client.mutate({ mutation: updateUser, variables: { name } })
  }).then((data) => {
    commit(mt.set, { user: data.updateUser.user })
  })
}
