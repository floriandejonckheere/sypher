import Vue from 'vue'

import setPrivacy from './actions/setPrivacy'
import setNotifications from './actions/setNotifications'

export default {
  [setPrivacy.type]: (state, payload) => {
    const { phone, seenScope, readScope } = payload

    Vue.set(state[phone], 'account', { seenScope, readScope })
  },
  [setNotifications.type]: (state, payload) => {
    const { phone, notifications, vibrate } = payload

    Vue.set(state[phone], 'device', { notifications, vibrate })
  },
}
