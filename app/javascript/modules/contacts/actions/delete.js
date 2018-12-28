import client from 'lib/apollo'

import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import deleteContact from './delete.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.add,
    request: () => client.mutate({ mutation: deleteContact, variables: { phone } })
  }).then(data => {
    const { phone } = data.deleteContact

    commit(mt.delete, { phone })
  })
}
