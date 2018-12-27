import client from 'lib/apollo'

import auth from 'modules/auth'
import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import setPrivacy from './setPrivacy.gql'

export default async ({ commit, dispatch, getters }, payload) => {
  const { seenScope, readScope } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.setPrivacy,
    request: () => client.mutate({ mutation: setPrivacy, variables: { seenScope, readScope } })
  }).then(() => {
    const phone = getters[auth.types.getters.getCurrentPhone]

    commit(mt.setPrivacy, { phone, seenScope, readScope })
  })
}
