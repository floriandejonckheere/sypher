import Vue from 'vue'

export default {
  set: (state, payload) => {
    const { user }  = payload

    Vue.set(state, user.phone, user)
  },
}
