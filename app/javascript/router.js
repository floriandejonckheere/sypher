import Vue from 'vue'
import Router from 'vue-router'

// Components
import Frame from 'components/Frame'

import Welcome from 'components/Authentication/Welcome'
import VerifyPhone from 'components/Authentication/VerifyPhone'
import VerifyPIN from 'components/Authentication/VerifyPIN'

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

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/channels',
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
          component: CreateConversation,
        },
        {
          path: 'group',
          component: CreateGroup,
        },
        {
          path: ':id',
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
          component: Contacts,
        },
        {
          path: ':id',
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
          component: Settings,
        },
        {
          path: 'account',
          component: Account,
        },
        {
          path: 'notifications',
          component: Notifications,
        },
        {
          path: 'data',
          component: Data,
        },
        {
          path: 'profile',
          component: Profile,
        },
      ],
    },
    {
      path: '/auth',
      component: Frame,
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
})
