export const setTokenType = 'auth/SET_TOKEN'
export const setCurrentPhoneType = 'auth/SET_CURRENT_PHONE'

export default {
  [setTokenType]: (state, payload) => {
    const { token } = payload

    state.token = token
  },
  [setCurrentPhoneType]: (state, payload) => {
    const { phone } = payload

    state.currentPhone = phone
  },
}
