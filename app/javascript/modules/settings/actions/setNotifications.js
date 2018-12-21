export default async ({ commit, rootGetters }, payload) => {
  const { notifications, vibrate } = payload
  const phone = rootGetters['auth/getCurrentPhone']

  commit('setNotifications', { phone, notifications, vibrate })
}
