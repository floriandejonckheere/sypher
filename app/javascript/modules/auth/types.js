export const actions = {
  signout: 'auth/SIGNOUT',
  verifyPhone: 'auth/VERIFY_PHONE',
  verifyPin: 'auth/VERIFY_PIN',
}

export const getters = {
  getPhone: 'auth/GET_PHONE',
  getToken: 'auth/GET_TOKEN',
  isAuthenticated: 'auth/IS_AUTHENTICATED',
  isComplete: 'auth/IS_COMPLETE',
}

export const mutations = {
  setPhone: 'auth/SET_PHONE',
  setToken: 'auth/SET_TOKEN',
}

export default {
  actions,
  getters,
  mutations,
}
