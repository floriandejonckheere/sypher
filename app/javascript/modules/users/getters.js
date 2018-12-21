export default {
  get: state => phone => {
    return state[phone]
  },
  getCurrent: (state, getters, rootState, rootGetters) => {
    const phone = rootGetters['auth/getCurrentPhone']

    getters['get'](phone)
  },
  getAllAlphabetically: state => {
    return Object.values(state).sort((a, b) => {
      return (a.name < b.name) ? -1 : ((a.name > b.name) ? 1 : 0)
    })
  },
}
