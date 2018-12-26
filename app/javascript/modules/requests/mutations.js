import Vue from 'vue'

export const setStateType = 'requests/SET_STATE'
export default {
  [setStateType]: (state, payload) => {
    const { requestType, requestState } = payload

    Vue.set(state.requests, requestType, requestState)
  },
}
