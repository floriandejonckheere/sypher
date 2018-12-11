export default {
  setPrivacy: (state, payload) => {
    const { seenScope, readScope } = payload

    state.account = {
      seenScope,
      readScope,
    }
  },
}
