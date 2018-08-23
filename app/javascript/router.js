import Vue from 'vue';
import Router from 'vue-router';

// Components
import Welcome from 'components/Authentication/Welcome'
import VerifyPhone from 'components/Authentication/VerifyPhone'
import VerifyPIN from 'components/Authentication/VerifyPIN'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/auth/welcome',
      name: 'Welcome',
      component: Welcome,
    },
    {
      path: '/auth/verify',
      name: 'Verify phone number',
      component: VerifyPhone,
    },
    {
      path: '/auth/pin',
      name: 'Verify PIN',
      component: VerifyPIN,
    },
  ],
});
