import { dummyAuthState } from './dummyStates'

import client from '../../apollo'

import { verifyPhone } from 'api/mutations/verifyPhone.gql'
import { verifyPin } from 'api/mutations/verifyPin.gql'
import { completeUser } from 'api/mutations/completeUser.gql'
import { deleteUser } from 'api/mutations/deleteUser.gql'

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
  // Get authentication token
  getToken: state => state.token,
}

// Actions
const actions = {
  verifyPhone: async ({ commit, dispatch }, payload) => {
    const { phone } = payload

    return dispatch('requests/doRequest', {
      requestType: 'verifyPhone',
      request: () => client.mutate({ mutation: verifyPhone, variables: { phone } })
    }, { root: true }).then((data) => {
      commit('setUser', { user: { name: null, phone: data.verifyPhone.phone } })
    })
  },
  verifyPIN: async ({ commit, dispatch }, payload) => {
    const { phone, pin } = payload

    return dispatch('requests/doRequest', {
      requestType: 'verifyPin',
      request: () => client.mutate({ mutation: verifyPin, variables: { phone, pin } })
    }, { root: true }).then((data) => {
      commit('setToken', { token: data.verifyPin.token })
    })
  },
  completeUser: async ({ commit, dispatch }, payload) => {
    const { name } = payload

    return dispatch('requests/doRequest', {
      requestType: 'completeUser',
      request: () => client.mutate({ mutation: completeUser, variables: { name } })
    }, { root: true }).then((data) => {
      commit('setUser', { user: data.completeUser.user })
    })
  },
  deleteUser: async ({ commit, dispatch }) => {
    return dispatch('requests/doRequest', {
      requestType: 'deleteUser',
      request: () => client.mutate({ mutation: deleteUser })
    }, { root: true }).then(() => {
      commit('reset', null, { root: true })
    })
  }
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
  state,
  getters,
  actions,
  mutations,
}
