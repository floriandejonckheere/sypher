export default {
  getAllUsersAlphabetically: state => {
    return state.users.sort((a, b) => {
      return (a.name < b.name) ? -1 : ((a.name > b.name) ? 1 : 0)
    })
  },
}
