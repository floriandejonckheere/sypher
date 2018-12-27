import { requestStates } from './state'

import { getters as t } from './types'

export default {
  // Request is pending
  [t.isPending]: state => requestType => {
    return state.requests[requestType] === requestStates.PENDING
  },
}
