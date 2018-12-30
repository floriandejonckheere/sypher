export const actions = {
  setNotifications: 'settings/SET_NOTIFICATIONS',
  setPrivacy: 'settings/SET_PRIVACY',
}

export const getters = {
  getSeenScope: 'settings/GET_SEEN_SCOPE',
  getReadScope: 'settings/GET_READ_SCOPE',
  getNotifications: 'settings/GET_NOTIFICATIONS',
  getVibrate: 'settings/GET_VIBRATE',
}

export const mutations = {
  setPrivacy: 'settings/SET_PRIVACY',
  setNotifications: 'settings/SET_NOTIFICATIONS',
}

export default {
  actions,
  getters,
  mutations,
}
