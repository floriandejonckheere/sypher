import router from '../store/modules/router'

// Transition to the next state
export default function transition(machine, { commit, state, dispatch }, { type, params, extState }) {
  const nextState = machine.transition(state.currentState, { type, params }, extState)

  // Capitalize machine id
  const machineId = `${machine.config.id.charAt(0).toUpperCase()}${machine.config.id.slice(1)}`

  commit(`update${machineId}State`, nextState.value)

  // Route if new state has a path
  const stateId = `${machine.id}.${nextState.value}`
  if (nextState.meta[stateId].path) {
    dispatch(router.actionTypes.ROUTE, { path: nextState.meta[stateId].path })
  }

  // Dispatch actions
  nextState.actions.forEach(actionKey => {
    dispatch(actionKey, { type, params, history: nextState.history })
  })
}
