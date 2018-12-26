import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'

import { mutations, actions as t } from '../types'

import verifyPin from './verifyPin.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone, pin } = payload

  return dispatch(requestType, {
    requestType: t.verifyPin,
    request: () => client.mutate({ mutation: verifyPin, variables: { phone, pin } })
  }, { root: true }).then((data) => {
    commit(mutations.setToken, { token: data.verifyPin.token })
  })
}
