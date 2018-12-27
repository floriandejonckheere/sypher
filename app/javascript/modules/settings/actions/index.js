import setNotifications from './setNotifications'
import setPrivacy from './setPrivacy'

import { actions as t } from '../types'

export default {
  [t.setNotifications]: setNotifications,
  [t.setPrivacy]: setPrivacy,
}
