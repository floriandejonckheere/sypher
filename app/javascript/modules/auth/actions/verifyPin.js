import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'
import { setTokenType } from '../mutations'

import verifyPin from './verifyPin.gql'

export const type = 'auth/VERIFY_PIN'
export default async ({ commit, dispatch }, payload) => {
  const { phone, pin } = payload

  return dispatch(requestType, {
    requestType: type,
    request: () => client.mutate({ mutation: verifyPin, variables: { phone, pin } })
  }, { root: true }).then((data) => {
    commit(setTokenType, { token: data.verifyPin.token })
  })
}
