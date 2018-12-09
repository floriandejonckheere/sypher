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
  // Request was successful
  isSuccess: state => requestType => {
    return state.requests[requestType] === requestStates.SUCCESS
  },
  // Request has failed
  isFailure: state => requestType => {
    return state.requests[requestType] === requestStates.FAILURE
  },
}

// Actions
const actions = {
  doRequest: async ({ commit, dispatch }, payload) => {
    const { requestType, request } = payload

    return new Promise(async (resolve, reject) => {
      dispatch('setPending', { requestType })

      try {
        const response = await request()

        const errorKeys = Object.keys(response.data).filter((m) => response.data[m].errors.length > 0)

        if (errorKeys.length > 0) {
          // Errors, reject with all errors
          dispatch('setFailure', { requestType })

          const errors = errorKeys.map(key => response.data[key].errors).flat()
          reject(errors)
        } else {
          // No errors, resolve with response data
          dispatch('setSuccess', { requestType })
          resolve(response.data)
        }
      } catch(e) {
        dispatch('setFailure', { requestType })
        reject([e.message])
      }
    })
  },

  // Mark request as pending
  setPending: ({ commit }, payload) => {
    const { requestType } = payload

    commit('setState', { requestType, requestState: requestStates.PENDING })
  },
  // Mark request as successful
  setSuccess: ({ commit }, payload) => {
    const { requestType } = payload

    commit('setState', { requestType, requestState: requestStates.SUCCESS })
  },
  // Mark request as failed
  setFailure: ({ commit }, payload) => {
    const { requestType } = payload

    commit('setState', { requestType, requestState: requestStates.FAILURE })
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
