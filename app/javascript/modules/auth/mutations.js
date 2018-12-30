import { mutations as t } from './types'

export default {
  [t.setToken]: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  [t.setPhone]: (state, payload) => {
    const { phone } = payload

    state.phone = phone
  },
}
