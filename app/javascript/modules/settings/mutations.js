import Vue from 'vue'

import { mutations as t } from './types'

export default {
  [t.setPrivacy]: (state, payload) => {
    const { phone, seenScope, readScope } = payload

    Vue.set(state[phone], 'account', { seenScope, readScope })
  },
  [t.setNotifications]: (state, payload) => {
    const { phone, notifications, vibrate } = payload

    Vue.set(state[phone], 'device', { notifications, vibrate })
  },
}
