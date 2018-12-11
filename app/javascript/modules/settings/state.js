const seenScopes = {
  NOBODY: 'settings/NOBODY',
  CONTACTS: 'settings/CONTACTS',
  EVERYONE: 'settings/EVERYONE',
}

const readScopes = {
  NOBODY: 'settings/NOBODY',
  CONTACTS: 'settings/CONTACTS',
}

export { seenScopes, readScopes }
export default {
  account: {
    seenScope: seenScopes.EVERYONE,
    readScope: readScopes.CONTACTS,
  },
  device: {
    notifications: true,
    vibrate: true,
  },
}
