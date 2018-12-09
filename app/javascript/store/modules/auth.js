import { dummyAuthState } from './dummyStates'

import client from '../../apollo'

import { verifyPhone } from '../../api/mutations/verifyPhone.gql'
import { verifyPin } from '../../api/mutations/verifyPin.gql'

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
  // Get user object
  getUser: state => state.user,
}

// Actions
const actions = {
  verifyPhone: async ({ commit, dispatch }, payload) => {
    const { phone } = payload

    const options = {
      mutation: verifyPhone,
      variables: { phone },
    }

    return dispatch('requests/doRequest', {
      requestType: 'verifyPhone',
      request: () => client.mutate(options)
    }, { root: true }).then((data) => {
      commit('setUser', { user: { name: null, phone: data.verifyPhone.phone } })
    })
  },
  verifyPIN: async ({ commit, dispatch }, payload) => {
    const { phone, pin } = payload

    const options = {
      mutation: verifyPin,
      variables: { phone, pin },
    }

    return dispatch('requests/doRequest', {
      requestType: 'verifyPin',
      request: () => client.mutate(options)
    }, { root: true }).then((data) => {
      commit('setToken', { token: data.verifyPin.token })
    })
  },
}

// Mutations
const mutations = {
  setToken: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  setUser: (state, payload) => {
    const { user } = payload

    state.user = user
  },
}

export default {
  namespaced: true,
  state: dummyAuthState,
  getters,
  actions,
  mutations,
}
