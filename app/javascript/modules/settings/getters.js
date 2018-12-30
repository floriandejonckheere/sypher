import { getters as t } from './types'

export default {
  [t.getSeenScope]: (state) => {
    return state.account.seenScope
  },
  [t.getReadScope]: (state) => {
    return state.account.readScope
  },

  [t.getNotifications]: (state) => {
    return state.device.notifications
  },
  [t.getVibrate]: (state) => {
    return state.device.vibrate
  },
}
