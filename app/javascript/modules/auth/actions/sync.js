import client from 'lib/apollo'

import contacts from 'modules/contacts'
import requests from 'modules/requests'
import settings from 'modules/settings'
import users from 'modules/users'

import { actions as t } from '../types'

import { sync } from './sync.gql'

export default async ({ commit, dispatch }) => {
  return dispatch(requests.types.actions.request, {
    requestType: t.sync,
    request: () => client.query({ query: sync })
  }).then(data => {
    const { name, phone, contacts: userContacts, readScope, seenScope } = data.sync

    // Current user
    commit(users.types.mutations.set, { user: { name, phone }})

    // Contacts
    userContacts.forEach(contact => {
      commit(contacts.types.mutations.add, { phone: contact.phone })
      commit(users.types.mutations.set, { user: { name, phone } })
    })

    // Settings
    commit(settings.types.mutations.setPrivacy, { readScope, seenScope })
  })
}
