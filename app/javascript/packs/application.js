import Vue from 'vue'
import Vuetify from 'vuetify'
import VueMoment from 'vue-moment'

import App from '../App.vue'
import router from '../router'
import store from '../store'
import provider from '../apollo'

Vue.use(Vuetify)
Vue.use(VueMoment)

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))

  new Vue({
    el,
    store,
    provider,
    render: h => h(App),
    router,
  })
})
