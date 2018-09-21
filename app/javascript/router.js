import Vue from 'vue';
import Router from 'vue-router';

// Components
import AuthenticationFrame from 'components/Authentication/AuthenticationFrame'
import Welcome from 'components/Authentication/Welcome'
import VerifyPhone from 'components/Authentication/VerifyPhone'
import VerifyPIN from 'components/Authentication/VerifyPIN'

import ChannelsFrame from 'components/Channels/ChannelsFrame'
import Channels from 'components/Channels/Channels'
import Channel from 'components/Channels/Channel'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/channels',
    },
    {
      path: '/channels',
      component: ChannelsFrame,
      children: [
        {
          path: '',
          name: 'channels',
          component: Channels,
        },
        {
          path: ':id',
          component: Channel,
        }
      ],
    },
    {
      path: '/auth',
      component: AuthenticationFrame,
      children: [
        {
          path: '',
          redirect: '/auth/welcome',
        },
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
