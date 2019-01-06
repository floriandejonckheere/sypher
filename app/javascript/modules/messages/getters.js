import { getters as t } from './types'

export default {
  [t.getAll]: state => {
    return Object.values(state).sort((a, b) => {
      return (a.timestamp < b.timestamp) ? -1 : ((a.timestamp > b.timestamp) ? 1 : 0)
    })
  },
}
