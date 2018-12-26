import signout from './signout'
import verifyPhone from './verifyPhone'
import verifyPin from './verifyPin'

import { actions as t } from '../types'

export default {
  [t.signout]: signout,
  [t.verifyPhone]: verifyPhone,
  [t.verifyPin]: verifyPin,
}
