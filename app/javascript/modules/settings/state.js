const seenScopes = {
  NOBODY: 'settings/NOBODY',
  CONTACTS: 'settings/CONTACTS',
  EVERYONE: 'settings/EVERYONE',
}

const readScopes = {
  NOBODY: 'settings/NOBODY',
  CONTACTS: 'settings/CONTACTS',
}

const profileScopes = {
  CONTACTS: 'settings/CONTACTS',
  EVERYONE: 'settings/EVERYONE',
}

export { seenScopes, readScopes, profileScopes }
export default {
  account: {
    seenScope: seenScopes.EVERYONE,
    readScope: readScopes.CONTACTS,
    profileScope: profileScopes.EVERYONE,
  },
  device: {
    notifications: true,
    vibrate: true,
  },
}
