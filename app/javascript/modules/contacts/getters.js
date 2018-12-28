import auth from 'modules/auth'

import { getters as t } from './types'

export default {
  // Get all contacts
  [t.getAll]: (state, getters) => {
    const phone = getters[auth.types.getters.getCurrent]

    return state[phone] || []
  },
}
