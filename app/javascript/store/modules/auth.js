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

    return new Promise(async (resolve, reject) => {
      dispatch('requests/setPending', { requestType: 'verifyPhone' }, { root: true })

      try {
        const response = await client.mutate({
          mutation: verifyPhone,
          variables: {phone},
        })

        if (response.data.verifyPhone.errors.length > 0) {
          dispatch('requests/setFailure', { requestType: 'verifyPhone' }, { root: true })
          reject(response.data.verifyPhone.errors)
        } else {
          dispatch('requests/setSuccess', { requestType: 'verifyPhone' }, { root: true })
          commit('setUser', { user: { name: null, phone: response.data.verifyPhone.phone } })
          resolve()
        }
      } catch(e) {
        dispatch('requests/setFailure', { requestType: 'verifyPhone' }, { root: true })
        reject([e.message])
      }
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
