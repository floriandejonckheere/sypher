import { setCurrentPhoneType, setTokenType } from '../mutations'

export const type = 'auth/SIGNOUT'
export default async ({ commit }) => {
  commit(setCurrentPhoneType, { phone: null })
  commit(setTokenType, { token: null })
}
