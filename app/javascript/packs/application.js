import Vue from 'vue'

import App from '../App.vue'
import router from '../router';
import store from '../store';

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))

  const app = new Vue({
    el,
    store,
    render: h => h(App),
    router,
  })
})
