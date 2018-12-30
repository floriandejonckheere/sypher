import { actions as t } from '../types'

import add from './add'
import deleteFunction from './delete'

export default {
  [t.add]: add,
  [t.delete]: deleteFunction,
}
