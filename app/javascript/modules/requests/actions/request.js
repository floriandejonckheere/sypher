import alerts from 'modules/alerts'
import { types } from 'modules/alerts/state'

import { requestStates } from '../state'
import { mutations as mt } from '../types'

export default async ({ commit, dispatch }, payload) => {
  const { requestType, request } = payload

  return new Promise(async (resolve) => {
    commit(mt.setState, { requestType, requestState: requestStates.PENDING })

    try {
      const response = await request()

      const errorKeys = Object.keys(response.data).filter(m => {
        return response.data[m].errors && response.data[m].errors.length > 0
      })

      if (errorKeys.length > 0) {
        // Errors, dispatch alert action
        commit(mt.setState, { requestType, requestState: requestStates.FAILURE })

        const errors = errorKeys.map(key => response.data[key].errors).flat()

        errors.forEach((e) => dispatch(alerts.types.actions.add, { type: types.ERROR, message: e }))
      } else {
        // No errors, resolve with response data
        commit(mt.setState, { requestType, requestState: requestStates.SUCCESS })
        resolve(response.data)
      }
    } catch(e) {
      // Exception
      commit(mt.setState, { requestType, requestState: requestStates.FAILURE })

      throw(e)
    }
  })
}
