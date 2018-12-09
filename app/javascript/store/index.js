import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import auth from './modules/auth'
import requests from './modules/requests'
import users from './modules/users'

Vue.use(Vuex)

const initialState = {
  auth: auth.state,
  requests: requests.state,
  users: users.state,
}

const store = new Vuex.Store({
  modules: {
    auth,
    requests,
    users,
  },
  plugins: [
    createPersistedState({
      paths: ['auth'],
    }),
  ],

  // Root mutations
  mutations: {
    // Reset state
    reset (state) {
      Object.keys(state).forEach(key => {
        Object.assign(state[key], initialState[key])
      })
    }
  }
})

export default store
