export default {
  setPrivacy: (state, payload) => {
    const { phone, seenScope, readScope } = payload

    state[phone] = {
      ...state[phone],
      account: {
        seenScope,
        readScope,
      },
    }
  },
  setNotifications: (state, payload) => {
    const { phone, notifications, vibrate } = payload

    state[phone] = {
      ...state[phone],
      device: {
        notifications,
        vibrate,
      },
    }
  },
}
