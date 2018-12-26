import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'
import { setCurrentPhoneType } from '../mutations'

import { verifyPhone } from './verifyPhone.gql'

export const type = 'auth/VERIFY_PHONE'
export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requestType, {
    requestType: type,
    request: () => client.mutate({ mutation: verifyPhone, variables: { phone } })
  }, { root: true }).then((data) => {
    commit(setCurrentPhoneType, { phone: data.verifyPhone.phone })
  })
}
