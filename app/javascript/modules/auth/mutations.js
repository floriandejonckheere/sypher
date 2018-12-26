import { mutations as t } from './types'

export default {
  [t.setToken]: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  [t.setCurrentPhone]: (state, payload) => {
    const { phone } = payload

    state.currentPhone = phone
  },
}
