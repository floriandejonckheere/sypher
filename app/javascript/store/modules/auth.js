import { dummyAuthState } from './dummyStates'

// Initial state
const state = {
  // Signed in user (identifier)
  user: null,
  // API token
  token: null,
}

// Getters
const getters = {
  // State contains an authenticated user
  isAuthenticated: state => {
    return state.user != null
  },
  // State contains an authenticated, complete user
  isComplete: state => {
    return state.user != null && state.user.name != null
  }
}

// Actions
const actions = {
}

// Mutations
const mutations = {
}

export default {
  namespaced: true,
  state: dummyAuthState,
  getters,
  actions,
  mutations,
}
