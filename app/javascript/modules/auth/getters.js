export default {
  // State contains an authenticated user
  isAuthenticated: state => {
    return state.token != null
  },
  // State contains an authenticated, complete user
  isComplete: (state, getters, rootState, rootGetters) => {
    const user = rootGetters['users/get'](state.currentPhone)

    return state.currentPhone != null && state.token != null && user != null
  },
  // Get current signed in phone
  getCurrentPhone: state => state.currentPhone,
  // Get authentication token
  getToken: state => state.token,
}
