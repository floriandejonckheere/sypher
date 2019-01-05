import Vue from 'vue'

import { mutations as t } from './types'

export default {
  [t.set]: (state, payload) => {
    const { channel } = payload

    Vue.set(state, channel.uuid, channel)
  },
}
