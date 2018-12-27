import auth from 'modules/auth'

import { mutations as mt } from '../types'

export default async ({ commit, getters }, payload) => {
  const { notifications, vibrate } = payload
  const phone = getters[auth.types.getters.getCurrentPhone]

  commit(mt.setNotifications, { phone, notifications, vibrate })
}
