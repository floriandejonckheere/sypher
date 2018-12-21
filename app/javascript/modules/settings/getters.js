export default {
  getCurrentSettings: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    if (phone && state[phone]) return state[phone]
  },

  getSeenScope: (state, getters) => {
    const settings = getters['getCurrentSettings']

    if (settings) return settings.account.seenScope
  },
  getReadScope: (state, getters) => {
    const settings = getters['getCurrentSettings']

    if (settings) return settings.account.readScope
  },

  getNotifications: (state, getters) => {
    const settings = getters['getCurrentSettings']

    if (settings) return settings.device.notifications
  },
  getVibrate: (state, getters) => {
    const settings = getters['getCurrentSettings']

    if (settings) return settings.device.vibrate
  },
}
