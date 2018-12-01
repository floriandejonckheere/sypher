import Vue from 'vue'
import Router from 'vue-router'

import store from './store'
import auth from './store/modules/auth'

// Components
import Initial from 'components/Initial'
import Final from 'components/Final'
import Frame from 'components/Frame'

import Welcome from 'components/Authentication/Welcome'
import VerifyPhone from 'components/Authentication/VerifyPhone'
import VerifyPIN from 'components/Authentication/VerifyPIN'
import Complete from 'components/Authentication/Complete'

import Channels from 'components/Channels/Channels'
import Channel from 'components/Channels/Channel'

import Contacts from 'components/Contacts/Contacts'
import Contact from 'components/Contacts/Contact'

import CreateConversation from 'components/Channels/CreateConversation'
import CreateGroup from 'components/Channels/CreateGroup'

import Settings from 'components/Settings/Settings'
import Account from 'components/Settings/Account'
import Notifications from 'components/Settings/Notifications'
import Data from 'components/Settings/Data'
import Profile from 'components/Settings/Profile'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'initial',
      component: Initial,
      meta: {
        authorize: (store, next) => {
          if (!store.getters['auth/isAuthenticated'])
            return next({ name: 'welcome' })

          if (!store.getters['auth/isComplete'])
            return next({ name: 'complete' })

          next()
        },
      },
    },
    {
      path: '/final',
      name: 'final',
      component: Final,
    },

    {
      path: '/channels',
      component: Frame,
      children: [
        {
          path: '',
          name: 'channels',
          component: Channels,
        },
        {
          path: 'conversation',
          name: 'conversation',
          component: CreateConversation,
        },
        {
          path: 'group',
          name: 'group',
          component: CreateGroup,
        },
        {
          path: ':id',
          name: 'channel',
          component: Channel,
        },
      ],
    },
    {
      path: '/contacts',
      component: Frame,
      children: [
        {
          path: '',
          name: 'contacts',
          component: Contacts,
        },
        {
          path: ':id',
          name: 'contact',
          component: Contact,
        }
      ],
    },
    {
      path: '/settings',
      component: Frame,
      children: [
        {
          path: '',
          name: 'settings',
          component: Settings,
        },
        {
          path: 'account',
          name: 'account',
          component: Account,
        },
        {
          path: 'notifications',
          name: 'notifications',
          component: Notifications,
        },
        {
          path: 'data',
          name: 'data',
          component: Data,
        },
        {
          path: 'profile',
          name: 'profile',
          component: Profile,
        },
      ],
    },
    {
      path: '/auth',
      component: Frame,
      children: [
        {
          path: 'welcome',
          name: 'welcome',
          component: Welcome,
        },
        {
          path: 'verify',
          name: 'verify',
          component: VerifyPhone,
        },
        {
          path: 'pin',
          name: 'pin',
          component: VerifyPIN,
        },
        {
          path: 'complete',
          name: 'complete',
          component: Complete
        },
      ],
    },
  ],
})

router.beforeEach((to, from, next) => {
  if (to.meta.authorize) {
    to.meta.authorize(store, next)
  } else next()
})

export default router
