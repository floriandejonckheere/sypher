import routerMachine  from '../../fsm/routerMachine'
import transition from '../../fsm/transition'

// Initial state
const state = {
  currentState: routerMachine.initial,
}

// Getters
const getters = {
}

// Action types
const actionTypes = {
  TRANSITION: 'router/TRANSITION',
}

// Actions
const actions = {
  [actionTypes.TRANSITION]: transition.bind(null, routerMachine),
}

// Mutations
const mutations = {
  updateRouterState: function(state, nextState) {
    state.currentState = nextState
  },
}

export default {
  state,
  getters,
  actionTypes,
  actions,
  mutations,
}
