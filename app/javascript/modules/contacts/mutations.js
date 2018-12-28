import Vue from 'vue'

import { mutations as t } from './types'

export default {
  [t.add]: (state, payload) => {
    const { phone } = payload

    Vue.set(state, phone, true)
  },
  [t.delete]: (state, payload) => {
    const { phone } = payload

    Vue.delete(state, phone)
  }
}
