import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import alerts from 'modules/alerts'
import auth from 'modules/auth'
import channels from 'modules/channels'
import contacts from 'modules/contacts'
import messages from 'modules/messages'
import requests from 'modules/requests'
import settings from 'modules/settings'
import users from 'modules/users'

Vue.use(Vuex)

export const resetType = 'root/RESET'

const initialState = {
  alerts: alerts.state,
  auth: auth.state,
  channels: channels.state,
  contacts: contacts.state,
  messages: messages.state,
  requests: requests.state,
  settings: settings.state,
  users: users.state,
}

const store = new Vuex.Store({
  modules: {
    alerts,
    auth,
    channels,
    contacts,
    messages,
    requests,
    settings,
    users,
  },
  plugins: [
    createPersistedState({
      paths: [
        'auth',
        'channels',
        'contacts',
        'messages',
        'settings',
        'users',
      ],
    }),
  ],

  // Root mutations
  mutations: {
    // Reset state
    [resetType]: state => {
      Object.keys(state).forEach(key => {
        Vue.set(state, key, initialState[key])
      })
    },
  }
})

export default store
