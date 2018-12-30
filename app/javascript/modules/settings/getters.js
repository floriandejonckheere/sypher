import auth from 'modules/auth'

import { getters as t } from './types'

export default {
  [t.getCurrent]: (state, getters) => {
    const phone = getters[auth.types.getters.getPhone]

    if (phone && state[phone]) return state[phone]
  },
  [t.getSeenScope]: (state, getters) => {
    const settings = getters[t.getCurrent]

    if (settings) return settings.account.seenScope
  },
  [t.getReadScope]: (state, getters) => {
    const settings = getters[t.getCurrent]

    if (settings) return settings.account.readScope
  },

  [t.getNotifications]: (state, getters) => {
    const settings = getters[t.getCurrent]

    if (settings) return settings.device.notifications
  },
  [t.getVibrate]: (state, getters) => {
    const settings = getters[t.getCurrent]

    if (settings) return settings.device.vibrate
  },
}
