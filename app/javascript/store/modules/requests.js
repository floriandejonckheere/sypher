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
