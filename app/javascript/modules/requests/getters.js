import { requestStates } from './state'

import { getters as t } from './types'

export default {
  // Request is pending
  [t.isPending]: state => requestType => {
    return state[requestType] === requestStates.PENDING
  },
  [t.isAnyPending]: state => {
    console.log(Object.keys(state).some(requestType => state[requestType] === requestStates.PENDING))
    return Object.keys(state).some(requestType => state[requestType] === requestStates.PENDING)
  },
}
