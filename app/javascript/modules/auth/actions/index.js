import signout from './signout'
import sync from './sync'
import verifyPhone from './verifyPhone'
import verifyPin from './verifyPin'

import { actions as t } from '../types'

export default {
  [t.signout]: signout,
  [t.sync]: sync,
  [t.verifyPhone]: verifyPhone,
  [t.verifyPin]: verifyPin,
}
