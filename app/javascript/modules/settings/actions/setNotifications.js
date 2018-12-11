export default async ({ commit }, payload) => {
  const { notifications, vibrate } = payload

  commit('setNotifications', { notifications, vibrate })
}
