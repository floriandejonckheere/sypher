import client from 'lib/apollo'

import channels from 'modules/channels'
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
    const { readScope, seenScope, contacts: userContacts, channels: userChannels } = data.sync

    // Current user
    commit(users.types.mutations.set, { user: users.parse(data.sync) })

    // Settings
    commit(settings.types.mutations.setPrivacy, { readScope, seenScope })

    // Contacts
    userContacts.forEach(contact => {
      commit(contacts.types.mutations.add, { phone: contact.phone })
      commit(users.types.mutations.set, { user: users.parse(contact) })
    })

    // Channels
    userChannels.forEach(channel => {
      const c = {
        uuid: channel.uuid,
        type: channel.type,
        name: channel.name,
        topic: channel.topic,
      }
      commit(channels.types.mutations.set, { channel: c })

      channel.users.forEach(user => {
        commit(users.types.mutations.set, { user: users.parse(user) })
      })
    })
  })
}
