import client from 'lib/apollo'

import { scopes } from 'modules/settings/state'

import requests from '../requests'

import completeUser from './complete.gql'

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch('requests/doRequest', {
    requestType: requests.complete,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }, { root: true }).then((data) => {
    commit('set', { user: data.completeUser.user })

    // TODO: sync user data, set defaults
    dispatch('settings/setPrivacy', { seenScope: scopes.EVERYONE, readScope: scopes.CONTACTS }, { root: true })
    dispatch('settings/setNotifications', { notifications: true, vibrate: true }, { root: true })
  })
}
