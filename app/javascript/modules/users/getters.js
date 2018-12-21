export default {
  get: state => phone => {
    return state[phone]
  },
  getAllAlphabetically: state => {
    return Object.values(state).sort((a, b) => {
      return (a.name < b.name) ? -1 : ((a.name > b.name) ? 1 : 0)
    })
  },
}
