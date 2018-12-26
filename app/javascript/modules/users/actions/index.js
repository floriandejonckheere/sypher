import complete from './complete'
import destroy from './destroy'
import update from './update'

export default {
  [complete.type]: complete,
  [destroy.type]: destroy,
  [update.type]: update,
}
