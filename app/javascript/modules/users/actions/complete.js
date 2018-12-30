import client from 'lib/apollo'

import auth from 'modules/auth'
import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'

import completeUser from './complete.gql'

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.complete,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }).then(data => {
    commit(mt.set, { user: data.completeUser.user })

    dispatch(auth.types.actions.sync)
  })
}
