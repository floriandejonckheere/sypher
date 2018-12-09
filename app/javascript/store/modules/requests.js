import Vue from 'vue'

const requestStates = {
  PENDING: 'requests/PENDING',
  SUCCESS: 'requests/SUCCESS',
  FAILURE: 'requests/FAILURE',
}

// Initial state
const state = {
  requests: {},
}

// Getters
const getters = {
  // Request is pending
  isPending: state => requestType => {
    return state.requests[requestType] === requestStates.PENDING
  },
}

// Actions
const actions = {
  doRequest: async ({ commit }, payload) => {
    const { requestType, request } = payload

    return new Promise(async (resolve, reject) => {
      commit('setState', { requestType, requestState: requestStates.PENDING })

      try {
        const response = await request()

        const errorKeys = Object.keys(response.data).filter((m) => response.data[m].errors.length > 0)

        if (errorKeys.length > 0) {
          // Errors, reject with all errors
          commit('setState', { requestType, requestState: requestStates.FAILURE })

          const errors = errorKeys.map(key => response.data[key].errors).flat()
          reject(errors)
        } else {
          // No errors, resolve with response data
          commit('setState', { requestType, requestState: requestStates.SUCCESS })
          resolve(response.data)
        }
      } catch(e) {
        commit('setState', { requestType, requestState: requestStates.FAILURE })
        reject([e.message])
      }
    })
  },
}

// Mutations
const mutations = {
  setState: (state, payload) => {
    const { requestType, requestState } = payload

    Vue.set(state.requests, requestType, requestState)
  },
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations,
}
