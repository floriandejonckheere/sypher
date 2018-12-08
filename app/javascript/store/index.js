import Vue from 'vue'
import Vuex from 'vuex'

import auth from './modules/auth'
import router from './modules/router'
import users from './modules/users'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth,
    router,
    users,
  },
})

export default store
