import Vue from 'vue'
import Vuex from 'vuex'

import auth from './modules/auth'
import channels from './modules/channels'
import users from './modules/users'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth,
    channels,
    users,
  },
})

export default store
