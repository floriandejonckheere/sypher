import routerMachine  from '../../fsm/routerMachine'
import transition from '../../fsm/transition'

import router from '../../router'

// Initial state
const state = {
  currentState: routerMachine.initial,
}

// Getters
const getters = {
  getCurrentState: function() {
    return state.currentState
  }
}

// Action types
const actionTypes = {
  TRANSITION: 'router/TRANSITION',
  ROUTE: 'router/ROUTE',
}

// Actions
const actions = {
  [actionTypes.TRANSITION]: transition.bind(null, routerMachine),
  [actionTypes.ROUTE]: function({ commit, dispatch }, { path }) {
    router.push(path)
  },
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
