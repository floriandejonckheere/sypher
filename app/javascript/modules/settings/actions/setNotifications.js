import { mutations as mt } from '../types'

export default async ({ commit }, payload) => {
  const { notifications, vibrate } = payload

  commit(mt.setNotifications, { notifications, vibrate })
}
