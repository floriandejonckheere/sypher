import client from 'lib/apollo'

import requests from 'modules/requests'
import users from 'modules/users'

import { actions as t, mutations as mt } from '../types'

import addContact from './add.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload
  return dispatch(requests.types.actions.request, {
    requestType: t.add,
    request: () => client.mutate({ mutation: addContact, variables: { phone } })
  }).then(data => {
    const { phone } = data.addContact

    commit(mt.add, { phone })

    return dispatch(users.types.actions.get, { phone })
  })
}
