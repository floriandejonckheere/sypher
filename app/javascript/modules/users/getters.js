import auth from 'modules/auth'

import { getters as t } from './types'

export default {
  [t.get]: state => phone => {
    return state[phone]
  },
  [t.getCurrent]: (state, getters) => {
    const phone = getters[auth.types.getters.getPhone]

    return getters[t.get](phone)
  },
  [t.getAll]: state => {
    return Object.values(state).sort((a, b) => {
      return (a.name < b.name) ? -1 : ((a.name > b.name) ? 1 : 0)
    })
  },
}
