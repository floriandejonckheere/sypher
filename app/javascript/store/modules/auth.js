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
          console.log(response.data)
          commit('setUser', { name: null, phone: response.data.verifyPhone.phone })
          resolve()
        }
      } catch(e) {
        dispatch('requests/setFailure', { requestType: 'verifyPhone' }, { root: true })
        reject([e.message])
      }
    })
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
