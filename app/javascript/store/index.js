import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import auth from './modules/auth'
import requests from './modules/requests'
import users from './modules/users'

Vue.use(Vuex)

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
})

export default store
