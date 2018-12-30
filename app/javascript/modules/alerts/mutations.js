import { mutations as  t } from './types'

export default {
  [t.add]: (state, payload) => {
    const { type, message } = payload

    state.push({ type, message })
  },
}
