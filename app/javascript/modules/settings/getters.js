export default {
  getSeenScope: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    return state[phone].account.seenScope
  },
  getReadScope: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    return state[phone].account.readScope
  },

  getNotifications: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    return state[phone].device.notifications
  },
  getVibrate: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    return state[phone].device.vibrate
  },
}
