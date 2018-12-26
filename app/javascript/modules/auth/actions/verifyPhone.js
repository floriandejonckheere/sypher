import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'

import { mutations, actions as t } from '../types'

import { verifyPhone } from './verifyPhone.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requestType, {
    requestType: t.verifyPhone,
    request: () => client.mutate({ mutation: verifyPhone, variables: { phone } })
  }, { root: true }).then((data) => {
    commit(mutations.setCurrentPhone, { phone: data.verifyPhone.phone })
  })
}
