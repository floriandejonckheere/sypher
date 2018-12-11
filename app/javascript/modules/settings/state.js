const scopes = {
  NOBODY: 'nobody',
  CONTACTS: 'contacts',
  EVERYONE: 'everyone',
}

export { scopes }
export default {
  account: {
    seenScope: scopes.EVERYONE,
    readScope: scopes.CONTACTS,
  },
  device: {
    notifications: true,
    vibrate: true,
  },
}
