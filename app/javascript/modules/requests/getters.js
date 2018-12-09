import { requestStates } from './state'

export default {
  // Request is pending
  isPending: state => requestType => {
    return state.requests[requestType] === requestStates.PENDING
  },
}
