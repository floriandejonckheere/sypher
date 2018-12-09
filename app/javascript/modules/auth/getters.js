export default {
  // State contains an authenticated user
  isAuthenticated: state => {
    return state.token != null
  },
  // State contains an authenticated, complete user
  isComplete: state => {
    return state.user != null && state.user.name != null
  },
  // Get user object
  getUser: state => state.user,
  // Get authentication token
  getToken: state => state.token,
}
