export const type = 'settings/SET_NOTIFICATIONS'
export default async ({ commit, rootGetters }, payload) => {
  const { notifications, vibrate } = payload
  const phone = rootGetters['auth/getCurrentPhone']

  commit(type, { phone, notifications, vibrate })
}
