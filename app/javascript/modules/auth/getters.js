import users from 'modules/users'

import { getters as t } from './types'

export default {
  // State contains an authenticated user
  [t.isAuthenticated]: state => {
    return state.token != null
  },
  // State contains an authenticated, complete user
  [t.isComplete]: (state, getters) => {
    const user = getters[users.types.getters.get](state.phone)

    return state.phone != null && state.token != null && user != null
  },
  // Get current signed in phone
  [t.getPhone]: state => state.phone,
  // Get authentication token
  [t.getToken]: state => state.token,
}
