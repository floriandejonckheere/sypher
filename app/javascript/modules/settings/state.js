export const scopes = {
  NOBODY: 'nobody',
  CONTACTS: 'contacts',
  EVERYONE: 'everyone',
}

export default {
  account: {
    readScope: scopes.CONTACTS,
    seenScope: scopes.EVERYONE,
  },
  device: {
    notifications: true,
    vibrate: true,
  },
}
