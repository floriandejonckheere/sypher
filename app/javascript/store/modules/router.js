import routerMachine from '../../fsm/routerMachine'
import transition from '../../fsm/transition'

// Initial state
const state = {
  currentState: routerMachine.initial,
}

// Getters
const getters = {
}

// Actions
const actions = {
  ROUTER_TRANSITION: transition.bind(null, routerMachine),
  SIGNUP({ commit, dispatch }, { params: { query } }) {
    // commit('updateItems', ['cat', 'dog', 'fish'])
    // Do work
    console.log('doing work');
    dispatch('ROUTER_TRANSITION', { type: 'SUCCESS' })
  },
}

// Mutations
const mutations = {
  updateRouterState(state, nextState) {
    state.state = nextState
  },
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations,
}
