import client from 'lib/apollo'

import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import getUser from './get.gql'

export default async ({ commit, dispatch }, payload) => {
  const { phone } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.get,
    request: () => client.query({ query: getUser, variables: { phone } })
  }).then(data => {
    commit(mt.set, { user: data.user })
  })
}
