import { mutations } from '../types'

export default async ({ commit }) => {
  commit(mutations.setCurrentPhone, { phone: null })
  commit(mutations.setToken, { token: null })
}
