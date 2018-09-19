import Vue from 'vue';
import Router from 'vue-router';

// Components
import Home from 'components/Home'
import AuthenticationFrame from 'components/Authentication/AuthenticationFrame'
import Welcome from 'components/Authentication/Welcome'
import VerifyPhone from 'components/Authentication/VerifyPhone'
import VerifyPIN from 'components/Authentication/VerifyPIN'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      component: Home,
    },
    {
      path: '/auth',
      component: AuthenticationFrame,
      children: [
        {
          path: 'welcome',
          component: Welcome,
        },
        {
          path: 'verify',
          component: VerifyPhone,
        },
        {
          path: 'pin',
          component: VerifyPIN,
        },
      ],
    },
  ],
});
