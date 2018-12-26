import Vue from 'vue'

export const setType = 'users/SET'

export default {
  [setType]: (state, payload) => {
    const { user }  = payload

    Vue.set(state, user.phone, user)
  },
}
