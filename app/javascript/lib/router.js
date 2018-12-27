import Vue from 'vue'
import Router from 'vue-router'

import store from 'lib/store'

import auth from 'modules/auth'

// Components
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

/**
 * Navigation guards
 *
 */
// Navigation guard for application pages
const applicationGuard = (to, from, next) => {
  const authenticated = store.getters[auth.types.getters.isAuthenticated]
  const complete = store.getters[auth.types.getters.isComplete]

  if (authenticated) {
    complete ? next() : next({ name: 'complete' })
  } else next({ name: 'welcome' })
}

// Navigation guard for auth/{welcome,verify,pin} pages
const authenticationGuard = (to, from, next) => {
  const authenticated = store.getters[auth.types.getters.isAuthenticated]
  const complete = store.getters[auth.types.getters.isComplete]

  if (authenticated) {
    complete ? next({ name: 'root' }) : next({ name: 'complete' })
  } else next()
}

// Navigation guard for auth/complete page
const authorizationGuard = (to, from, next) => {
  const authenticated = store.getters[auth.types.getters.isAuthenticated]
  const complete = store.getters[auth.types.getters.isComplete]

  if (authenticated) {
    complete ? next({ name: 'root' }) : next()
  } else next({ name: 'welcome' })
}

/**
 * Router
 *
 */
const router = new Router({
  routes: [
    {
      path: '/',
      name: 'root',
      redirect: 'channels',
    },
    {
      path: '/channels',
      component: Frame,
      beforeEnter: applicationGuard,
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
      beforeEnter: applicationGuard,
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
      beforeEnter: applicationGuard,
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
          beforeEnter: authenticationGuard,
        },
        {
          path: 'verify',
          name: 'verify',
          component: VerifyPhone,
          beforeEnter: authenticationGuard,
        },
        {
          path: 'pin',
          name: 'pin',
          component: VerifyPIN,
          beforeEnter: authenticationGuard,
        },
        {
          path: 'complete',
          name: 'complete',
          component: Complete,
          beforeEnter: authorizationGuard,
        },
      ],
    },
  ],
})

export default router
