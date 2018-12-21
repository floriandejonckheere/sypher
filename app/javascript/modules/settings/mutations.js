import Vue from 'vue'

export default {
  setPrivacy: (state, payload) => {
    const { phone, seenScope, readScope } = payload

    Vue.set(state[phone], 'account', { seenScope, readScope })
  },
  setNotifications: (state, payload) => {
    const { phone, notifications, vibrate } = payload

    Vue.set(state[phone], 'device', { notifications, vibrate })
  },
}
