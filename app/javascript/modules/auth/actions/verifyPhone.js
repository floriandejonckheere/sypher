import client from 'lib/apollo'

import requests from 'modules/requests'

import { mutations, actions as t } from '../types'

import { verifyPhone } from './verifyPhone.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.verifyPhone,
    request: () => client.mutate({ mutation: verifyPhone, variables: { phone } })
  }).then((data) => {
    commit(mutations.setCurrentPhone, { phone: data.verifyPhone.phone })
  })
}
