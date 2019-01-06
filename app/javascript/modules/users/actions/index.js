import complete from './complete'
import destroy from './destroy'
import get from './get'
import update from './update'

import { actions as t } from '../types'

export default {
  [t.complete]: complete,
  [t.destroy]: destroy,
  [t.get]: get,
  [t.update]: update,
}
