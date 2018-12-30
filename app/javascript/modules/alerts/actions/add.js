import { types } from '../state'
import { mutations as mt } from '../types'

export default async ({ commit }, payload) => {
  const { type, message } = payload

  commit(mt.add, {
    type: type || types.INFO,
    message,
  })
}
