import client from 'lib/apollo'
import { resetType } from 'lib/store'

import requests from 'modules/requests'

import { actions as t } from '../types'

import destroy from './destroy.gql'

export default async ({ commit, dispatch }) => {
  return dispatch(requests.types.actions.request, {
    requestType: t.destroy,
    request: () => client.mutate({ mutation: destroy })
  }).then(() => {
    commit(resetType)
  })
}
