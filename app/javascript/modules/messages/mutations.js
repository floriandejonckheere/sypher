import Vue from 'vue'

import { mutations as t } from './types'

export default {
  [t.set]: (state, payload) => {
    const { message } = payload

    Vue.set(state, message.uuid, message)
  },
}
