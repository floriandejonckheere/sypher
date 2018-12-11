export default {
  setPrivacy: (state, payload) => {
    const { seenScope, readScope } = payload

    state.account = {
      seenScope,
      readScope,
    }
  },
  setNotifications: (state, payload) => {
    const { notifications, vibrate } = payload

    state.device = {
      notifications,
      vibrate,
    }
  },
}
