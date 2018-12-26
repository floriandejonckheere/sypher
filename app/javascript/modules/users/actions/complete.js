import client from 'lib/apollo'

import { type as requestType } from 'modules/requests/actions/doRequest'
import { scopes } from 'modules/settings/state'
import { type as setPrivacyType } from 'modules/settings/actions/setPrivacy'
import { type as setNotificationsType } from 'modules/settings/actions/setNotifications'

import { setType } from '../mutations'

import completeUser from './complete.gql'

export const type = 'users/COMPLETE'
export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch(requestType, {
    requestType: type,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit(setType, { user: data.completeUser.user })

    // TODO: sync user data, set defaults
    dispatch(setPrivacyType, { seenScope: scopes.EVERYONE, readScope: scopes.CONTACTS }, { root: true })
    dispatch(setNotificationsType, { notifications: true, vibrate: true }, { root: true })
  })
}
