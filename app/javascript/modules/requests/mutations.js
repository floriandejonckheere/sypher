import Vue from 'vue'

export default {
  setState: (state, payload) => {
    const { requestType, requestState } = payload

    Vue.set(state.requests, requestType, requestState)
  },
}
