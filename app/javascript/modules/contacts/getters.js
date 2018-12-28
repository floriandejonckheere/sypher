import auth from 'modules/auth'

import { getters as t } from './types'

export default {
  [t.getAll]: state => {
    return Object.keys(state)
  },
}
