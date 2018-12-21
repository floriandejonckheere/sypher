export default {
  set: (state, payload) => {
    const { user }  = payload

    state[user.phone] = user
  },
}
