import { requestStates } from '../state'

import { mutations as mt } from '../types'

export default async ({ commit }, payload) => {
  const { requestType, request } = payload

  return new Promise(async (resolve, reject) => {
    commit(mt.setState, { requestType, requestState: requestStates.PENDING })

    try {
      const response = await request()

      const errorKeys = Object.keys(response.data).filter(m => {
        return response.data[m].errors && response.data[m].errors.length > 0
      })

      if (errorKeys.length > 0) {
        // Errors, reject with all errors
        commit(mt.setState, { requestType, requestState: requestStates.FAILURE })

        const errors = errorKeys.map(key => response.data[key].errors).flat()
        reject(errors)
      } else {
        // No errors, resolve with response data
        commit(mt.setState, { requestType, requestState: requestStates.SUCCESS })
        resolve(response.data)
      }
    } catch(e) {
      commit(mt.setState, { requestType, requestState: requestStates.FAILURE })
      reject([e.message])
    }
  })
}
