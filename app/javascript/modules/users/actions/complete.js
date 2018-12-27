import client from 'lib/apollo'

import requests from 'modules/requests'
import settings from 'modules/settings'

import { actions as t, mutations as mt } from '../types'

import completeUser from './complete.gql'

const { scopes } = settings

export default async ({ commit, dispatch }, payload) => {
  const { name } = payload

  return dispatch(requests.types.actions.request, {
    requestType: t.complete,
    request: () => client.mutate({ mutation: completeUser, variables: { name } })
  }).then((data) => {
    commit(mt.set, { user: data.completeUser.user })

    // TODO: sync user data, set defaults
    dispatch(settings.types.actions.setPrivacy, {
      seenScope: scopes.EVERYONE,
      readScope: scopes.CONTACTS,
    })
    dispatch(settings.types.actions.setNotifications, {
      notifications: true,
      vibrate: true,
    })
  })
}
