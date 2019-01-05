import { getters as t } from './types'

export default {
  [t.getAll]: state => {
    // TODO: sort by timestamp
    return Object.values(state)
  },
}
