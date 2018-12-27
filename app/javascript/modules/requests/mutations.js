import Vue from 'vue'

import { mutations as  t } from './types'

export default {
  [t.setState]: (state, payload) => {
    const { requestType, requestState } = payload

    Vue.set(state.requests, requestType, requestState)
  },
}
