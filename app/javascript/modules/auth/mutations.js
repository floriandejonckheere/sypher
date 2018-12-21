export default {
  setToken: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  setCurrentPhone: (state, payload) => {
    const { phone } = payload

    state.currentPhone = phone
  },
}
