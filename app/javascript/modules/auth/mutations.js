export default {
  setToken: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  setUser: (state, payload) => {
    const { user } = payload

    state.user = user
  },
}
