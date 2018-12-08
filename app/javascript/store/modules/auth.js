import { dummyAuthState } from './dummyStates'

import client from '../../apollo'

import { verifyPhone } from '../../api/mutations/verifyPhone.gql'

// Initial state
const state = {
  // Signed in user (identifier)
  user: { phone: null, name: null },
  // API token
  token: null,
}

// Getters
const getters = {
  // State contains an authenticated user
  isAuthenticated: state => {
    return state.token != null
  },
  // State contains an authenticated, complete user
  isComplete: state => {
    return state.user != null && state.user.name != null
  },
}

// Actions
const actions = {
  verifyPhone: async ({ commit }, phone) => {
    const response = await client.mutate({
      mutation: verifyPhone,
      variables: { phone },
    })

    console.log(response.data.verifyPhone.errors)

    commit('setUser', { name: null, phone: response.data.phone })
  },
}

// Mutations
const mutations = {
  setToken: (state, token) => { state.token = token },
  setUser: (state, user) => { state.user = user },
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations,
}
