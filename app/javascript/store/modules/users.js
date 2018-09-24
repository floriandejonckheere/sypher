import { dummyUsersState } from './dummyStates'

// Initial state
const state = []

// Getters
const getters = {
  getAllUsersAlphabetically: state => {
    return state.sort((a, b) => {
      return (a.name < b.name) ? -1 : ((a.name > b.name) ? 1 : 0)
    })
  }
}

// Actions
const actions = {
}

// Mutations
const mutations = {
}

export default {
  namespaced: true,
  state: dummyUsersState,
  getters,
  actions,
  mutations,
}
