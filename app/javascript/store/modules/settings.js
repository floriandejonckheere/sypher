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

// Initial state
const state = {
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

// Getters
const getters = {
  getSeenScope: state => state.account.seenScope,
  getReadScope: state => state.account.readScope,
  getProfileScope: state => state.account.profileScope,

  getNotifications: state => state.device.notifications,
  getVibrate: state => state.device.vibrate,
}

// Actions
const actions = {
}

// Mutations
const mutations = {
}

export { seenScopes, readScopes, profileScopes }

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations,
}
