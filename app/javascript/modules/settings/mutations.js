import { mutations as t } from './types'

export default {
  [t.setPrivacy]: (state, payload) => {
    const { seenScope, readScope } = payload

    state.account = { seenScope, readScope }
  },
  [t.setNotifications]: (state, payload) => {
    const { notifications, vibrate } = payload

    state.device = { notifications, vibrate }
  },
}
