import client from 'lib/apollo'

import requests from 'modules/requests'

import { mutations, actions as t } from '../types'

import verifyPin from './verifyPin.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone, pin } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.verifyPin,
    request: () => client.mutate({ mutation: verifyPin, variables: { phone, pin } })
  }).then((data) => {
    commit(mutations.setToken, { token: data.verifyPin.token })
  })
}
