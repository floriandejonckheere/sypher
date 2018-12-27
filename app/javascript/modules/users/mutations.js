import Vue from 'vue'

import { mutations as t } from './types'

export default {
  [t.set]: (state, payload) => {
    const { user }  = payload

    Vue.set(state, user.phone, user)
  },
}
