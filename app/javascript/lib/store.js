import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import auth from 'modules/auth'
import contacts from 'modules/contacts'
import requests from 'modules/requests'
import settings from 'modules/settings'
import users from 'modules/users'

Vue.use(Vuex)

export const resetType = 'root/RESET'

const initialState = {
  auth: auth.state,
  contacts: contacts.state,
  requests: requests.state,
  settings: settings.state,
  users: users.state,
}

const store = new Vuex.Store({
  modules: {
    auth,
    contacts,
    requests,
    settings,
    users,
  },
  plugins: [
    createPersistedState({
      paths: ['auth', 'contacts', 'settings', 'users'],
    }),
  ],

  // Root mutations
  mutations: {
    // Reset state
    [resetType] (state) {
      Object.keys(state).forEach(key => {
        Object.assign(state[key], initialState[key])
      })
    }
  }
})

export default store
