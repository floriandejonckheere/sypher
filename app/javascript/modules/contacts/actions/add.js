import client from 'lib/apollo'

import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import addContact from './add.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.add,
    request: () => client.mutate({ mutation: addContact, variables: { phone } })
  }).then((data) => {
    commit(mt.add, { phone: data.addContact.phone })

    // TODO: dispatch call to fetch user
  })
}
