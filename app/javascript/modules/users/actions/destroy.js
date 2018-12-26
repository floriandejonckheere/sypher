import client from 'lib/apollo'
import { resetType } from 'lib/store'

import { type as requestType } from 'modules/requests/actions/doRequest'

import destroy from './destroy.gql'

export const type = 'users/DESTROY'
export default async ({ commit, dispatch }) => {
  return dispatch(requestType, {
    requestType: type,
    request: () => client.mutate({ mutation: destroy })
  }, { root: true }).then(() => {
    commit(resetType, null, { root: true })
  })
}
