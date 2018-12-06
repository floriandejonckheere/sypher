import Vue from 'vue'
import Vuetify from 'vuetify'
import VueMoment from 'vue-moment'
import VueApollo from 'vue-apollo'

import colors from 'vuetify/es5/util/colors'

import App from '../App.vue'
import router from '../router'
import store from '../store'
import provider from '../apollo'

Vue.use(Vuetify, {
  theme: {
    primary: colors.deepPurple.darken1, // #E53935
    secondary: colors.red.lighten4, // #FFCDD2
    accent: colors.indigo.base // #3F51B5
  }
})
Vue.use(VueMoment)
Vue.use(VueApollo)

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
